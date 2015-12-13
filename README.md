# Sinatra Active Record Starter Kit

This template provides a basic [Sinatra](http://www.sinatrarb.com/) application
that includes:

- [Active Record](http://guides.rubyonrails.org/active_record_querying.html)
using [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)
- [PostgreSQL](http://www.postgresql.org/) for a database
- [Sinatra::Reloader](http://www.sinatrarb.com/contrib/reloader.html) to
  automatically reload modified files during development
- [RSpec](https://github.com/rspec/rspec) for unit testing
- [Capybara](https://github.com/jnicklas/capybara) for acceptance testing
- [Pry](https://github.com/pry/pry) for debugging

## Getting Started

```no-highlight
# Clone down this template
git clone git@github.com:LaunchAcademy/sinatra-activerecord-starter-kit.git <YOUR_APP_NAME>

# Move into your app's directory
cd <YOUR_APP_NAME>

# Install all the gems
bundle install

# Remove the old git history and start your own
rm -rf .git && git init && git add -A && git commit -m 'Initial commit'
```

### Configuring Your Database

This template is set up for using a PostgreSQL database. You will need to create a
`config/database.yml`. There is an example at `config/database.example.yml`.

Once you've created a `config/database.yml`, you can create your database with
`rake db:create`.

## Rake Tasks

This template uses the [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)
gem, which provides the following rails-like rake tasks:

```no-highlight
rake db:create            # create the database from config/database.yml from the current Sinatra env
rake db:create_migration  # create an ActiveRecord migration
rake db:drop              # drops the data from config/database.yml from the current Sinatra env
rake db:migrate           # migrate the database (use version with VERSION=n)
rake db:rollback          # roll back the migration (use steps with STEP=n)
rake db:schema:dump       # dump schema into file
rake db:schema:load       # load schema into database
rake db:seed              # load the seed data from db/seeds.rb
rake db:setup             # create the database and load the schema
rake db:test:prepare      # Prepare test database from development schema
```

###queries
* How would you return all the recipes in your database?
recipe = Recipes.all

* How would you return all the comments in your database?
comment = Comment.all

* How would you return the most recent recipe posted in your database?
recipe = Recipe.all.order(created_at: :desc).first

* How would you return all the comments of the most recent recipe in your database?
comment = Comment.find_by(recipe_id: Recipe.all.order(created_at: :desc).first.id)

* How would you return the most recent comment of all your comments?
comment = Comment.all.order(created_at: :desc).first

* How would you return the recipe associated with the most recent comment in your database?
recipe = Recipe.find_by(id: Comment.all.order(created_at: :desc).first.recipe_id)

* How would you return all comments that include the string `brussels` in them?
comment = Comment.where("body LIKE?", "%Brussels%")


5.times do
  Recipe.create(
    title: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
    instrutions: Faker::Hacker.say_something_smart
  )
end  
Comment.create(
  recipe_id: 1,
  body: "Something about Brussels Sprouts"
  )
Comment.create(
  recipe_id: 1,
  body: "Something about pancakes"
  )
Comment.create(
  recipe_id: 2,
  body: "Roasted Brussels Sprouts"
  )
Comment.create(
  recipe_id: 3,
  body: "Blueberries"
  )
Comment.create(
  recipe_id: 4,
  body: "Carrots"
  )
Comment.create(
  recipe_id: 5,
  body: "Turkey"
  )
