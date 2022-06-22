const express = require("express");
const authRouter = express.Router();
const User = require("../models/user");
var bcrypt = require("bcryptjs");
var jwt = require("jsonwebtoken");

//

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }
    const hashPassword = await bcrypt.hash(password, 8);

    let user = new User({
      email: email,
      name: name,
      password: hashPassword,
    });

    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email doesnt exist!" });
    }
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect Password" });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    // ('...') is object destructuring
    // ! usinf only user we will get big object which is no use to us so we used  ._doc
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.headers("x-auth-token");
    if (!token) return res.json(false);
    const isVarify = jwt.verify(token, "passwordKey");
    if (!isVarify) res.json(false);
    const user = await User.findById(isVarify.id);
    if (!user) {
      return res.json(false);
    }
    res.json(true);
  } catch (error) {}
});

// !api to get user data after all verification completed

// middleware
authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

// to make it public we use
module.exports = authRouter;
