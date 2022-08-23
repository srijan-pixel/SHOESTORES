// use the path of your model
const User = require('../Models/UserModel');
const mongoose = require('mongoose');
// use the new name of the database
const url = 'mongodb://localhost:27017/new_database_name';
beforeAll(async () => {
    await mongoose.connect(url, {
        useNewUrlParser: true,
        // useCreateIndex: true
    });
});
afterAll(async () => {
    await mongoose.connection.close();
});
describe('user Schema test anything', () => {
    // the code below is for insert testing
    it('Add user testing anything', () => {
        const user = {
            'name': 'ashish8',
            'email': 'ashish8@gmail.com',
            'password': 'ashish2123',
            'isAdmin': 'false'
        };
        return User.create(user)
            .then((pro_ret) => {
                expect(pro_ret.name).toEqual('ashish8');
            });
    });
    // the code below is for delete testing
    it('to test the update', async () => {
        return User.updateOne({ _id: Object('5d20c71c0da2982d681e4bf0') },
            { $set: { name: 'harrai' } })
            .then((pp) => {
                console.log(pp)
                expect(pp.ok).toEqual(undefined)
            })
    });
    it('to test the delete user is working or not', async () => {
        const status = await User.deleteOne({ _id: '5d20c71c0da2982d681e4bf0' });
        expect(status.ok).toBe(undefined);
    });
});