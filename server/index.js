// ?IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

const PORT = 3000;
const app = express();

// ? iMPORT FROM OTHER FILES

const authRouter = require("./routes/auth");

// ! middleware
// You need to use express's body parser before adding routes to express

app.use(express.json());
app.use(authRouter);

// yesle json request lai server tira send gardinxa so we can access our server

//! connections

mongoose
  .connect(
    "mongodb+srv://awash:awash@cluster0.m1ge6.mongodb.net/?retryWrites=true&w=majority"
  )
  .then(() => {
    console.log("Connections Successful");
  })
  .catch((e) => {
    console.log(e);
  });

// listening an api

app.listen(PORT, (req, res) => {
  console.log(`connected at port ${PORT}`);
});
