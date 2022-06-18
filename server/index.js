const express = require("express");
const PORT = 3000;

const app = express();

// creating an api
app.get('/',(req,res)=>{
    res.send("Hello");

})


// ! CRUD  Get ,Put,Post,Delete,Update  ->




app.listen(PORT, (req, res) => {
  console.log(`connected at port ${PORT}`);
});
