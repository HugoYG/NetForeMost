const express = require('express');
const mongoose = require('mongoose');
const fs = require('fs');

const app = express();
const port = 3000;

mongoose.connect('mongodb://localhost/netforemost', { useNewUrlParser: true, useUnifiedTopology: true })
    .then(async () => {
        console.log('Connected to MongoDB');
        try {
            const documentNumbers = await Article.countDocuments();
            console.log('Document numbers:', documentNumbers);
            if (documentNumbers === 0) {
                const data = JSON.parse(fs.readFileSync('../data.json'));
                await Article.insertMany(data);
                console.log('Data inserted successfully!');
            }
            else {
                console.log('Collection is not empty, I can skip the data insertion!');
            }
        } catch (error) {
            console.error('Error with handling the data:', err);
        }

    })
    .catch((error) => {
        console.error('Error connecting to MongoDB:', error);
    });

const articleSchema = new mongoose.Schema({
    author: String,
    title: String,
    description: String,
    url: String,
    urlToImage: String,
    publishedAt: Date
});

const Article = mongoose.model('Article', articleSchema);

app.get('/articles', async (req, res) => {
    try {
        const articles = await Article.find({});
        res.json(articles);
    } catch (error) {
        console.error('Error fetching articles:', error);
    }
});

app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
