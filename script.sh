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
touch layout.mustache
touch index.mustache
cd ..

mkdir routes
cd routes
touch index.js
cd ..

cat $dir/tmp_server.js >> server.js
cat $dir/index.mustache >> ./views/index.mustache
cat $dir/layout.mustache >> ./views/layout.mustache
cat $dir/routes.js >> ./routes/index.js
cat $dir/main.css >> ./public/css/main.css

touch readme.md

cat $dir/readme.txt >> readme.md

touch Procfile

cat $dir/Procfile.txt >> Procfile

touch .gitignore

cat $dir/git_ignore.txt >> .gitignore

touch .env

cat $dir/env.txt >> .env

atom .

npm init --yes

json -I -f package.json -e 'this.engine={"node": "6.10.2"}'
json -I -f package.json -e 'this.keywords=["node","heroku","express"]'

npm install express path express-validator express-session body-parser mustache mustache-express pg sequelize --save

sequelize init

cd config

rm -f config.json

cat $dir/tmp_config.json > config.json

cd ..

createdb $dirname-db

echo -n "Would you like make this a git repo? (Yes)"
read response

if [[ $response == "y" ]] || [[ $response == "" ]] || [[ $response == "yes" ]]; then
  git init

  git add .

  git commit -m "initial commit"

  echo -n "Paste Download URL for new Git Repository here: "

  unset giturl
  while [ -z ${giturl} ]; do
       read giturl
  done

  git remote add origin $giturl

  git push origin master

  echo -n "Would you like to place this on heroku? (Yes)"
  read heroku

  if [[ $heroku == "y" ]] || [[ $heroku == "" ]] || [[ $heroku == "yes" ]]; then
    heroku login

    heroku create $dirname-8675309

    git push heroku master

    heroku ps:scale web=1

    heroku addons | grep -i POSTGRES

    heroku addons:create heroku-postgresql:hobby-dev

    heroku pg:wait

    heroku open

    heroku local web
  fi
fi

echo "Complete."
