# University API Project
### Check requirements:

* RVM 1.29.10
* Ruby 3.3.6
* Rails 8.0.0
* Postgres 15

### Make a copy of the file .env.template and rename it .env
Then replace the values with your PostgreSQL credentials and update `UNIVERSITY_CORS_ORIGINS` with the URL of your UI (e.g., localhost:5173).

### Once you have all the requirements installed and the file .env you just have to run the following commands:

* `bundle install`
* `rails db:setup`
* `rails s`

Congratulations! now you're running University API successfully.

## Rubocop
Run the next command to check code syntax errors on Ruby
* `rubocop`

## Rspec
Run the next command to check if there are unit test errors
* `rspec`
