# _Wiretap Server_

_Description: This is the Web Service component of the Wiretap game._

## API Reference

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

The CCD web service relies on a CouchDB database setup on Cloudant. This may be changed to consolidate DBs on MongoDB, however in order to get up and running ASAP CouchDB was chosen.

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
