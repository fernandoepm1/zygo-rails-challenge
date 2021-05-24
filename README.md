# Zygo Rails Challenge

## Dependencies

- Ruby version 2.7.1
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

## Additional RubyGems used

### General purposes

- **Devise**: User authentication
- **Kaminari**: Books pagination
- **Ransack**: Filters and ordering implementation
- **RailsAdmin**: Admin access/dashboard implementation
- **Slim**: Template to simplify ERB views

### For testing

- **Rspec**: To implement the test suite
- **Faker**: Mocking additional data
- **FactoryBot**: To implement factories
- **DatabaseCleaner**: Clean test database in test environment
- **RailsControllerTesting**: For additional methods/matchers
- **ShouldaMatchers**: For additional methods/matchers

## Dashboard

### Endpoint

The Admin Acess was implemented using the `rails_admin` gem. The dashboard was mounted in this endpoint: `/command_center`

### Admin Access

To access the main admin dashboard you need to be authenticated first. To register a new admin user you need to use the following **Special code**: `4DM1N_4C3SS`, as shown in the following form example:

<p align="center">
  <img src="https://user-images.githubusercontent.com/25914952/119374561-1810d180-bc90-11eb-85b9-0f0a7686aa0f.png">
</p>


After creating and logging in as the admin_user you'll be able to access the dashboard for CRUDing all resources given (_Books_, _Authors_ and _Users_).

