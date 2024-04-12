
const { json } = require("express");
const jwt=require("jsonwebtoken");
const auth=async(req,res,next)=>{
    try {
        const token=req.header("token")
        if(!token)res.status(401).json({msg:"invalid token ,access denied"});
        const valid=await jwt.verify(token,"passwordkey");
        if(!valid)res.status(401).json({msg:"invalid token ,access denied"});
        req.user=valid.id;
        req.token=token;
        next();
    } catch (error) {
        res.status(500).json({error:error.message});
    }
}
module.exports=auth;