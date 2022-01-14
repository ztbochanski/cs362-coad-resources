# Central Oregon COAD

This is the GitHub repository for the Central Oregon Community Organizations Active
in Disaster (COAD) help service system. It connects people in need with resources
made available by members of Community Organizations Active in Disaster.

## Development

Clone the repository:

Fork the repository from  ybakos/cs362-coad-resources
```
use git clone git@github.com:osu-cascades/coad-resources.git
```

This is a Rails application that uses SQLite in development and PostgreSQL in production.

Install the dependencies:

```
gem install bundler
bundle install
```
If you have issues installing these it might be becuase of your ruby version. You can check the ruby version in the command line with ruby -v
If you are using a mac/xcode you might have the ruby version that comes with xcode that is known to be suspicious. Use the commands brew install rbenv ruby-build, rbenv install 2.7.5, rbenv global 2.7.5 to install ruby 2.7.5

Next, set up the database:

```
rails db:setup
```

If you want, you can create some seed data in the database:

```
rails db:seed

```
Before starting the app you have to setup the .env variables. To do this cp the .env.example file and modify the parts where you set the admin email and the password.
Once saving drop the database (rails db:drop) and restup the database (rails db:setup) 

Start the app:
Through the browser go to localhost:3000 
```
rails server
```

## Testing

This project uses RSpec for testing.

```
rspec
```

You can also run a specific directory of tests or file by supplying its name, like so:

```
spring rspec spec/path/to/file_spec.rb
```

## Deployment

This application uses [heroku for deployment](https://devcenter.heroku.com/articles/git).
Some useful commands to know can be found below.

Set up a heroku app to deploy to:

```
heroku git:remote -a coad-resources-staging
heroku git:remote -a coad-resources

```

Rename them _staging_ and _production_:

```
git remote rename coad-resources-staging staging
git remote rename coad-resources production

```

Deploy to a heroku app:

```
git push staging
```

Migrate the rails database of a heroku app:

```
heroku run rails db:migrate --remote staging
```

Seed the rails database of a heroku app:

```
heroku run rails db:seed --remote staging
```

Set environment variables (see _.env.example_ for expectations):

```
heroku config:set FOO=bar
```

## Production Dependencies

PostgreSQL
Email Server (Gmail)
Recaptcha

## Data model
![erd](public/documentation/erd.jpg?raw=true)


&copy; 2020 Lucas Rouchy,Zach Bochanski, Luke Reynolds . All rights reserved.


asdf asdf

