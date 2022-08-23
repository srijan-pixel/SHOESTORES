// use the path of your model
const Product = require('../Models/ProductModel');
const mongoose = require('mongoose');
// use the new name of the database
const url = 'mongodb://localhost:27017/new_product';
beforeAll(async () => {
    await mongoose.connect(url, {
        useNewUrlParser: true,
        useCreateIndex: true
    });
});
afterAll(async () => {
    await mongoose.connection.close();
});
describe('user Schema test anything', () => {
    // the code below is for insert testing
    it('Add product testing anything', () => {
        const product = {
            'name': 'toy',
            'image': 'good.jpg',
            'description': 'Good',
            'rating': '2',
            'numReviews': '3',
            'price': '200',
            'countInStock': '5'
        };
        return Product.create(product)
            .then((pro_ret) => {
                expect(pro_ret.name).toEqual('toy');
            });
    });
    // the code below is for delete testing
    it('to test the update', async () => {
        return Product.updateOne({ _id: Object('5d20c71c0da2982d681e4bf0') },
            { $set: { name: 'hari' } })
            .then((pp) => {
                console.log(pp)
                expect(pp.ok).toEqual(undefined)
            })
    });
    it('to test the delete user is working or not', async () => {
        const status = await Product.deleteOne({ _id: '5d20c71c0da2982d681e4bf0' });
        expect(status.ok).toBe(undefined);
    });
})