const express = require('express');
const mongoose = require('mongoose');
const fs = require('fs');

const app = express();
const port = 3000;

// Connect to MongoDB
mongoose.connect('mongodb://localhost/netforemost', { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => {
        console.log('Connected to MongoDB');
    })
    .catch((error) => {
        console.error('Error connecting to MongoDB:', error);
    });

// Load data from data.json
const data = JSON.parse(fs.readFileSync('data.json'));
