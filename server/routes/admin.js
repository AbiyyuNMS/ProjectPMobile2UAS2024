const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const { Product } = require('../models/product');

//create admin midleware
adminRouter.post('/admin/add-product', admin, async (req, res)=>{
    try {
        const {name, description, images, quantity, price, category} = req.body;
    let product = new Product({
        name,
        description,
        images,
        quantity,
        price,
        category,
    });
    product = await product.save();
    res.json(product);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});

//get all products
adminRouter.get('/admin/get-products', admin, async(req, res) =>{
    try {

        const products = await Product.find({});
        res.json(products);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});

//delete products
adminRouter.post('/admin/delete-product', admin, async (req, res) => {
    try {
        const {id} = req.body;
        let product = await Product.findByIdAndDelete(id);
        res.json(product);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
})

module.exports = adminRouter;