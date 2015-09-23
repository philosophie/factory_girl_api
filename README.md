# factory_girl_api [![Gem Version](https://badge.fury.io/rb/factory_girl_api.svg)](http://badge.fury.io/rb/factory_girl_api)

The factory_girl_api gem is a Rails Engine that integrates with [factory_girl][factory_girl] to add API routes for manipulating factories that can be used for context setup in frontend tests.

It cooperates with [angular-factory-girl-api][angular-factory-girl-api], which provides an Angular service that will make the proper requests to your server during tests.

## Installation

Add factory_girl_api to your Gemfile:

```
group :test do
  gem 'factory_girl_api'
end
```

Then mount the engine in your routes file:

```
Rails.application.routes.draw do
  mount FactoryGirlApi::Engine => '/api/v1/test_helpers' if Rails.env.test?
end
```

## Routes Added

The factory_girl_api gem adds three routes at the location it is mounted at.

| Method   | Route        | Description                                        |
| -------- | ------------ | -------------------------------------------------- |
| `POST`   | `/factories` | Calls `FactoryGirl.create` and returns the result  |
| `POST`   | `/database`  | Sets up the database                               |
| `DELETE` | `/database`  | Rolls back the database to a clean state           |

### `POST /factories`

This is the primary endpoint installed by the gem. It accepts the following parameters:

```
{
  factory: {
    name: 'string',
    attributes: { object ... },
    traits: [ array ... ]
  }
}
```

The `name` parameter is required. All other parameters are optional. When used, this calls `FactoryGirl.create` with the provided options, then renders the resulting model as JSON.

Since this calls `FactoryGirl.create`, it will modify the database, so it should be surrounded by calls to `/database` to control database cleanup.

### `POST /database`

This endpoint does nothing on its own. Each usage of this endpoint should be paired with a call to `DELETE /database`, which will delete all records created in the database between the two calls.

### `DELETE /database`

Uses [DatabaseCleaner][database_cleaner] to delete all records created since the previous call to `POST /database`. This can be used to clean up DB context after creating records with factories.

[angular-factory-girl-api]: https://github.com/lexi-lambda/angular-factory-girl-api
[database_cleaner]: https://github.com/DatabaseCleaner/database_cleaner
[factory_girl]: https://github.com/thoughtbot/factory_girl
