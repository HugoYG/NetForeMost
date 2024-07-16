const express = require('express');


const Article = require('./models/article.model');
const connectDB = require('./config/db');

const app = express();
const port = 3000;

connectDB();


app.get('/articles', async (_, res) => {
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
