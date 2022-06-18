// ?IMPORT FROM PACKAGES
const express = require("express");

// !
const PORT = 3000;
const app = express();

// ? iMPORT FROM OTHER FILES

const authRouter = require("./routes/auth");

// ! middleware
// CLIENTS -> MIDDLEWARE -> SERVER ->CLIENT
app.use(authRouter);

// listening an api

app.listen(PORT, (req, res) => {
  console.log(`connected at port ${PORT}`);
});
