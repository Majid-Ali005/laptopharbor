const express = require('express');
const cors = require('cors');
const { createProxyMiddleware } = require('http-proxy-middleware');

const app = express();

// Enable CORS
app.use(cors());

// Proxy API requests
app.use('/api', createProxyMiddleware({
  target: 'https://api.example.com', // Replace with your API URL
  changeOrigin: true,
  pathRewrite: { '^/api': '' }, // Remove /api prefix
}));

// Serve static files (Flutter web build)
app.use(express.static('build/web'));

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Proxy server running on http://localhost:${PORT}`);
});