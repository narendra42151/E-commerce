const mongoose = require('mongoose');
const { productSchema } = require('./product');

const userSchema = new mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    email: {
        required: true,
        trim: true,
        type: String,
        validate: {
            validator: (value) => {
                const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\\.,;:\s@\"]+\.)+[^<>()[\]\\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: 'Invalid email'
        }
    },
    password: {
        required: true,
        type: String,
    },
    address: {
        default: '',
        type: String
    },
    type: {
        default: 'user',
        type: String
    },
    cart : [
         {
            product : productSchema,
           quantity : {
            type : Number,
            required : true,
            
           }

        }
    ]
});

const User = mongoose.model("User", userSchema);
module.exports = User;
