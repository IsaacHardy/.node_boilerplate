# Node App

A barebones Node.js app using [Express 4](http://expressjs.com/).

## Running Locally

Make sure you have [Node.js](http://nodejs.org/) and the [Heroku CLI](https://cli.heroku.com/) installed.

```sh
$ npm install
$ npm start
```

Your app should now be running on [localhost:5000](http://localhost:5000/).

## Deploying to Heroku

```
$ heroku create
$ git push heroku master
$ heroku open
```
or

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


## Created Data in database

To create data, use Sequelize seeders to bulk create your data:

1. Edit the `config.json` file with local database name.
2. Create your models and migrate into database
3. Create a seeder with `sequelize seed:create --name Seedername`
4. Update seeder to contain bulk create methods:

```js
'use strict';

const data = [
  {
    username: 'John Doe',
    password: 'password',
    createdAt: '2017-07-04T02:05:01+00:00',
    updatedAt: '2017-07-04T02:05:01+00:00'
  },
  {
    username: 'John Doe1',
    password: 'password',
    createdAt: '2017-07-04T02:05:01+00:00',
    updatedAt: '2017-07-04T02:05:01+00:00'
  },
  {
    username: 'John Doe2',
    password: 'password',
    createdAt: '2017-07-04T02:05:01+00:00',
    updatedAt: '2017-07-04T02:05:01+00:00'
  }
];

module.exports = {
  up: function (queryInterface, Sequelize) {
      return queryInterface.bulkInsert('Users', data, {});
  },

  down: function (queryInterface, Sequelize) {
      return queryInterface.bulkDelete('Users', null, {});
  }
};

```
5. Push the database to the Heroku database: `heroku pg:push myLocalDatabaseName DATABASE_URL --app herokuAppName`

## Documentation

- [Getting Started with Node.js on Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs)
- [Heroku Node.js Support](https://devcenter.heroku.com/articles/nodejs-support)
- [Node.js on Heroku](https://devcenter.heroku.com/categories/nodejs)
- [Best Practices for Node.js Development](https://devcenter.heroku.com/articles/node-best-practices)
- [Using WebSockets on Heroku with Node.js](https://devcenter.heroku.com/articles/node-websockets)
