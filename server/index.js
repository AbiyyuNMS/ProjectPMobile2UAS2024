
const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/products');
const userRouter = require('./routes/user');

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://abiyyunms223:abiyyugagah223@prj223.kseksdb.mongodb.net/?retryWrites=true&w=majority&appName=prj223"


app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);


//koneksi
mongoose.connect(DB).then(() =>{
    console.log("succesful");
}).catch((e)=>{
    console.log(e);
});


app.listen(PORT,"0.0.0.0", () => {
    console.log(`Connected Masbro di ${PORT}`);
});