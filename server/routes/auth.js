const express = require("express");

const authRouter = express.Router();

authRouter.post("/api/signup", (req, res) => {
    //! get the data from the clients
  const {name,email,password}=req.body;


  // Post data in database

  // Return that data to the user
});

// to make it public we use
module.exports = authRouter;
