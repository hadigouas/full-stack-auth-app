const mongoose = require('mongoose');

const schema = mongoose.Schema({
    name: {
        type: String,
        trim: true,
        required: true
    },
    email: {
        type: String,
        trim: true,
        required: true,
        validate: {
            validator: function (value) {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return re.test(value);
            },
            message: "Please enter a valid email"
        }
    },
    password: {
        type: String,
        trim: true,
        required: true,
        validate: {
            validator: function (value) {
                return value.length >= 8;
            },
            message: "Password must be at least 8 characters long"
        }
    }
});

const User = mongoose.model("User", schema);

module.exports = User;
