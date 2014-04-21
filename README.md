# _Wiretap Server_ - API Reference

This is the Web Service component of the Wiretap game.

## Making a request
All URLs start with `https://api.somedomain.com/api/v1/`(**SSL only**). The path includes the API version number (1 in this example).

### JSON Only

This service accepts only JSON (sorry, no XML). You will need to send `Content-Type: application/json; charset=utf-8` when POSTing or PUTing any data. All URLs end in `.json` to reflect that they accept, expect and respond with JSON.

### Rate limiting

Currently, rate limiting is not supported, but will be imposed at some point in the future. The limit is likely to be in the form of 50 requests per 10 second period from the same IP address, for the same user.

## Authentication
There are two types of authentication schemes in place when accessing services provided by the WireTap server.

The client (i.e. App) must authentication via HTTP Basic Auth to access the API, and the _User_ must authenticate via either common user/password combination or via 3rd part login (i.e. Facebook).

### Identify your app - Client Authentication

API Authentication uses **HTTP Basic Authentication** with the following credentials mapping:
* Username -> _API Key_
* Password -> _Secret Key_

### Identify users - User Authentication

_TODO_

## API

### Users

* `POST /signup.json` Register new user

```json
{
	"email": "ahamidi@me.com",
	"password": "F6S77s6wdhS182T",
	"first_name": "Ali",
	"last_name": "Hamidi"
}
```

Only `email` and `password` are mandatory.

This will return `201` and the generated `user_id`. If the user already exists with return `409` and `error: Email already in use`.

* `POST /login` Login a user

```json
{
	"email": "ahamidi@me.com",
	"password": "F6S77s6wdhS182T",
}
```

This will return `200` and a `session_token`. If the username or password is incorrect, it will return `401` and `error: Email or password is incorrect`.

### Achievements



## Project Setup

1. Checkout code
1. Bundle gems: `bundle install`
1. Run server: `ruby ccd.rb`

## Dependencies

### Corona Labs Website

The CCD web service authenticates users via the Corona Labs website using the external login API.

### Database

WireTap Server uses PostgreSQL and Redis. Postgres as an operational datastore and Redis as a cache.

## Deployment

**TBD**

## Testing

1. Checkout code
1. Bundle gems: `bundle update`
1. Run tests: `ruby ccd_tests.rb`

## TODO

- Retrieve questions API
- Submit answers API
- Forward results via Email
- Update docs with responses
- Tests
