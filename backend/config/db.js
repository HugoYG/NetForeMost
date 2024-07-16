require('dotenv').config();
const mongoose = require('mongoose');
const fs = require('fs');
const Article = require('../models/article.model'); 
const path = require('path');

const connectDB = async () => {
    try {
        await mongoose.connect(process.env.MONGODB_URI);
        console.log('Connected to MongoDB');
        
        const documentNumbers = await Article.countDocuments();
        console.log('Document numbers:', documentNumbers);
        if (documentNumbers === 0) {
            const dataPath = path.resolve(__dirname, './data.json');
            const data = JSON.parse(fs.readFileSync(dataPath));
            await Article.insertMany(data);
            console.log('Data inserted successfully!');
        } else {
            console.log('Collection is not empty, skipping data insertion');
        }
    } catch (error) {
        console.error('Error connecting to MongoDB or handling data:', error);
        process.exit(1); 
    }
};

module.exports = connectDB;
