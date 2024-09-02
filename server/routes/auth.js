const express = require('express');
const User = require('../model/user');
const bcryptjs = require('bcryptjs') ;
const jwt = require("jsonwebtoken");// Adjust the path if necessary
const auth = require('../middleware/auth');

const authRouter = express.Router();

authRouter.post('/api/signup', async (req, res) => {

try {const { name, email, password } = req.body;

const existingUser = await User.findOne({ email });

if (existingUser) {

    console.log(" dijej")
    // print("user found")
    return res.status(400).json({ msg: 'Email already exists' });
}

const hassedPassword= await bcryptjs.hash(password, 9);

console.log(" gbng")
// print("hash ok")
let user = new User({
    email,
  password:  hassedPassword,
    name,
});
console.log(" tgbnjy")
// print("start")


user = await user.save();
res.json(user);
}
catch (e) { 
    res.status(500).json({error : e.message});
}

    
});

authRouter.post("/api/signin", async (req, res) => {
    try {
      const { email, password } = req.body;
  
      const user = await User.findOne({ email });
      if (!user) {
        return res
          .status(400)
          .json({ msg: "User with this email does not exist!" });
      }
  
      const isMatch = await bcryptjs.compare(password, user.password);
      if (!isMatch) {
        return res.status(400).json({ msg: "Incorrect password." });
      }
  
      const token = jwt.sign({ id: user._id }, "passwordKey");
      res.json({ token, ...user._doc });
    } catch (e) {
      res.status(500).json({ error: e.message });
    }


    //varifiyng token
    authRouter.post("/tokenIsValid", async (req,res)  =>  {
      try { 
        const token = req.header("x-auth-token");
        if (!token) return res.json(false);
        const verified=jwt.verify(token,'passwordKey');
        if (!verified) return res.json(false);
     const user = await User.findById(verified.id);
     if (!user) return res.json(false);

        res.json(true);






      }
      catch (e) {
        res.status(500).json({error : e.message});
       }
    } )
  });
  // get user data
  
authRouter.get('/', auth,async (req,res) =>  {
  const user= await User.findById(req.user);
  res.json({...user._doc, token : req.token});



}
)


module.exports = authRouter;
