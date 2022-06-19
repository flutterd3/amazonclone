const express = require("express");
const authRouter = express.Router();
const User = require("../models/user");

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

    let user = new User({
      email,
      name,
      password,
    });

    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// to make it public we use
module.exports = authRouter;
