const express = require("express");
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");
const User = require("../models/user");
const userRouter = express.Router();

userRouter.post('/api/add-to-cart', auth, async (req, res)=>{
    try {
        const {id} = req.body;
        const product = await Product.findById(id);
        let user = await User.findById(req.user);

        if(user.cart.length ==0){
            user.cart.push({ product, quantity:1 });
        }else{
            let isProductsFound = false;
            for(let i =0;i<user.cart.length; i++){
                if(user.cart[i].product._id.equals(product._id)){
                    isProductsFound = true;
                }
            }
            if(isProductsFound){
                let producttt = user.cart.find((producttt) => producttt.product._id.equals(product._id) );
                producttt.quantity += 1;
            }else{
            user.cart.push({ product, quantity:1 });
            }
        }
        user = await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});

userRouter.delete('/api/remove-from-cart/:id', auth, async (req, res)=>{
    try {
        const {id} = req.params;
        const product = await Product.findById(id);
        let user = await User.findById(req.user);

            for(let i =0;i<user.cart.length; i++){
                if(user.cart[i].product._id.equals(product._id)){
                    if(user.cart[i].quantity == 1){

                        user.cart.splice(i, 1);
                    }else{
                        user.cart[i].quantity -= 1;
                    }
                }
            }
        user = await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});

module.exports = userRouter;