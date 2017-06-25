const express         = require("express");
const bodyParser      = require("body-parser");
const validator       = require("express-validator");
const mustacheExpress = require("mustache-express");
const path            = require("path");
const session         = require("express-session");

// Initialze Express App
const app = express();

// Set Port
app.set('port', (process.env.PORT || 5000));

// Serve static files to server
app.use(express.static(path.join(__dirname, "public")));

// Setting up View Engine
app.engine("mustache", mustacheExpress());
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "mustache");

// Body parser and validator implementation
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(validator());

// Initialize Express Session
app.use(session({
  secret: 'asdfasdf',
  resave: false,
  saveUninitialized: false
}));

app.get("/", function(req, res) {
  res.render("index");
});

app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});
