const mongoose=require("mongoose");
const express=require("express");
const app=express();
const authrout=require("./routs/auth");
app.use(authrout);
app.listen(3000,()=>{
    console.log("connected to PORT 3000");
});

mongoose.connect("mongodb+srv://hadigouas8:7qy0FLUyBbSGlx8D@cluster0.83nl2ab.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0").then(()=>{
    try {
        console.log("connected to mongo");
    } catch (error) {
        console.log(error.message);
    }
});
