const express = require("express");
const bcrypt = require("bcrypt");
const User = require("../schema/user_schema");
const jwt=require("jsonwebtoken");
const authrout = express.Router();

authrout.use(express.json());

authrout.post("/api/signup", async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const existUser = await User.findOne({ email });
        if (existUser) {
            return res.status(400).json({ msg: "The email is already in use" });
        }
        const hashedPassword = await bcrypt.hash(password, 10);
        const user = new User({ name, email, password: hashedPassword });
        await user.save();
        res.status(201).json({ _id: user._id, name: user.name, email: user.email });
        console.log("The user added successfully");
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

authrout.post('/api/login',async(req,res)=>{
  try {
    const {email,password}=req.body;
    const existUser=await User.findOne({email});
    if(!existUser){
        res.status(400).json({msg:"the email you sent not fond"});
    }
    const validpassword=await bcrypt.compare(password,existUser.password);
    if(!validpassword){
        res.status(400).json({msg:"incorrect password"});
    }
    const token=await jwt.sign({id:existUser._id},"passwordkey");
    res.status(201).json({token ,...existUser._doc});
  } catch (error) {
    res.status(500).json({error:error.message});
  }



})



module.exports = authrout;
