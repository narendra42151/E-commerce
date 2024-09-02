

const jwt= require('jsonwebtoken');

const auth = async (req,res,next) => {
    try {
        const token = req.header('x-auth-token') ; 
        if(!token) 
            return res.status(401).json({msg :'Access denied. No token provided.'});
        const verified = jwt.verify(token,"passwordKey");
        if(!verified)
            return res.status(401).json({msg :'Token Varification failed, autherisation denied'});


req.user= verified.id;
req.token = token;
next();
    
    
    } catch (err) {
        res.status(500).json({error : err.message});

    }
}
module.exports = auth;  //export the auth middleware function  //export the auth middleware function