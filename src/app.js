const express = require('express');

const app = express();

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.get('/api/hello', (req, res) => {
  res.json({ message: 'Hello DevOps' });
});

module.exports = app;
