const EXPRESS = require('express'),
  BODY_PARSER = require('body-parser'),
  CORS_POLOCIES = require('cors'),
  APP = EXPRESS(),

  ARR_ALLOWED_DOMAINS = ['http://localhost:8080', 'https://localhost:8080'];

// Set headers
APP.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', ARR_ALLOWED_DOMAINS);
  res.header('Access-Control-Allow-Methods', 'POST, GET');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
});

// Activate cors
APP.use(CORS_POLOCIES({
  origin: ARR_ALLOWED_DOMAINS,
  credentials: true,
  exposedHeaders: ['set-cookie']
}));

// Use the bodyparser for JSON files and set the routes
APP.use(BODY_PARSER.json());
APP.use(BODY_PARSER.urlencoded({
  extended: true,
}));

APP.listen(3000, () => console.log('I listen to port 3000!'));
