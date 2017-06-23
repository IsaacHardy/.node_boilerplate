#! /bin/bash

# Variables
dir=~/.node_boilerplate

# Retrieve app name
echo "Name your Node applicaiton folder: "

read dirname

mkdir $dirname

cd $dirname

touch server.js

mkdir public
cd public
mkdir css
cd css
touch main.css

cd ..
cd ..

mkdir views
cd views
touch index.mustache
cd ..

mkdir routes

cat $dir/tmp_server.js >> server.js
cat $dir/index.mustache >> ./views/index.mustache
cat $dir/main.css >> ./public/css/main.css

npm init

npm install express path express-validator express-session body-parser mustache mustache-express --save

echo -n "Would you like make this a git repo?"
read response

if [[ $response == "y" ]]; then
  git init

  git add .

  git commit -m "initial commit"
fi

atom .

# google-chrome --new-tab "http://localhost:8080"

nodemon server.js
