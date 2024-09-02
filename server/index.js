const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const adminRouter= require('./routes/admin');
const productRouter=require('./routes/product');
const userRouter = require('./routes/user');


 // Adjust the path if necessary

const port = 3000;
const app = express();
const DB = 'mongodb+srv://Narendra:Narendra42151@cluster0.snswb.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0';

app.use(express.json()); // To parse JSON bodies
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

mongoose.connect(DB)
    .then(() => {
        console.log('Connection successful');
    })
    .catch((e) => {
        console.log(e);
    });

app.listen(port, '0.0.0.0', () => {
    console.log(`Server is running on port ${port}`);
});
