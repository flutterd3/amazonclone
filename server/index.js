// ?IMPORT FROM PACKAGES
const express = require("express");

// !
const PORT = 3000;
const app = express();

// ? iMPORT FROM OTHER FILES

const authRouter = require("./routes/auth");

// ! middleware
// ?Use for manipulation of the data sharing between server and clients
// CLIENTS -> MIDDLEWARE -> SERVER ->CLIENT

app.use(authRouter);


// listening an api

app.listen(PORT, (req, res) => {
  console.log(`connected at port ${PORT}`);
});
