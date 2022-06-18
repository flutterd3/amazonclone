const express = require("express");
const User = require("../models/user");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  const { name, email, password } = req.body;

  //? Post data in database



  const existingUSer = await User.findOne({ email });
  if (existingUSer) {
    return res.json({ msg: "User with same email  already exist" });
  }


  //?   !initialize user model
  
  let user = new User({
    email,
    password,
    name,
  });

  user = await user.save();
  res.json(user);
});

// to make it public we use
module.exports = authRouter;
