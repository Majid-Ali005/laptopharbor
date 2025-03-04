const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());

app.get('/manifest.json', (req, res) => {
  res.json({ message: 'This is the manifest file.' });
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});