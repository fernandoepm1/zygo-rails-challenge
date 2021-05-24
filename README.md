# Zygo Rails Challenge

## Dependencies

- Ruby version 2.7.1
- Bundler version 2.1.4
- Rails version 6.1.3.2
- Node.js and yarn
- PostgreSQL

## Running App locally

### Clone this repository

```bash
git clone git@github.com:fernandoepm1/zygo-rails-challenge.git && cd zygo-rails-challenge
```

### Check ruby version

```bash
ruby -v
```

It should be `2.7.1`, if not, use your preferred version manager to install ruby 2.7.1 and set it as the local ruby version.

### Install dependencies

```bash
bundle install && yarn
```

### Initialize the database

```bash
bundle exec rails db:create db:migrate db:seed
```

### Serve

```bash
bundle exec rails s
```

### Running tests

```bash
bundle exec rspec spec/
```

## Deployed version

The current version of the app was deployed to [heroku](https://dashboard.heroku.com/) and can be acessed by the following url:

- https://zygo-rails-challenge.herokuapp.com/

## Dashboard

### Endpoint

The Admin Acess was implemented using the `rails_admin` gem. The dashboard was mounted in this endpoint: `/command_center`

### Admin Access

To access the main admin dashboard you need to be authenticated first. To register a new admin user you need to use the following **Special code**: `4DM1N_4C3SS`, as shown in the following form example:

<p align="center">
  <img src="https://user-images.githubusercontent.com/25914952/119374561-1810d180-bc90-11eb-85b9-0f0a7686aa0f.png">
</p>

After creating and logging in as the admin_user you'll be able to access the dashboard for CRUDing all resources given (_Books_, _Authors_ and _Users_).

## Additional RubyGems used

### General purposes

- [**Devise**](https://github.com/heartcombo/devise): User authentication
- [**Kaminari**](https://github.com/kaminari/kaminari): Books pagination
- [**Ransack**](https://github.com/activerecord-hackery/ransack): Filters and ordering implementation
- [**RailsAdmin**](https://github.com/sferik/rails_admin): Admin access/dashboard implementation
- [**Slim**](https://github.com/slim-template/slim): Template to simplify ERB views

### For testing

- [**FactoryBot**](https://github.com/thoughtbot/factory_bot): To implement factories
- [**Faker**](https://github.com/faker-ruby/faker): Mocking additional data
- [**DatabaseCleaner**](https://github.com/DatabaseCleaner/database_cleaner): Clean test database in test environment
- [**RailsControllerTesting**](https://github.com/rails/rails-controller-testing): For additional methods/matchers
- [**Rspec**](https://github.com/rspec/rspec): To implement the test suite
- [**ShouldaMatchers**](https://github.com/thoughtbot/shoulda-matchers): For additional methods/matchers
