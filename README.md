# University API Project
### Check requirements:

* RVM 1.29.10
* Ruby 3.3.6
* Rails 8.0.0
* Postgres 15

### Make a copy of the file config/database.yml.template and rename it database.yml

### Once you have all the requirements installed and the file database.yml you just have to run the following commands:

* `bundle install`
* `rails db:setup`
* `bundle exec rake secret`

* `rails s`

Congratulations! now you're running University API successfully.

## Rubocop
Run the next command to check code syntax errors on Ruby
* `rubocop`

## Rspec
Run the next command to check if there are unit test errors
* `rspec`
