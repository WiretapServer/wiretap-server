# _Wiretap Server_

_Description: This is the Web Service component of the Wiretap game._

## API Reference

### Authentication
There are two types of authentication schemes in place when accessing services provided by the WireTap server.

The client (i.e. App) must authentication via HTTP Basic Auth to access the API, and the _User_ must authenticate via either common user/password combination or via 3rd part login (i.e. Facebook).

#### API Authentication (Clients)

API Authentication uses **HTTP Basic Authentication** with the following credentials mapping:
* Username -> _API Key_
* Password -> _Secret Key_

#### User Authentication (Users)

_TODO_

#### Authentication

- `POST` /login
	- Parameters:
		- email
		- password

#### Content

- `GET` /about/ccd
- `GET` /about/corona
- `GET` /study/outline
- `GET` /study/categories

#### Questions

- `GET` /questions/practice
- `GET` /questions/real

#### Results

- `POST` /results

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
