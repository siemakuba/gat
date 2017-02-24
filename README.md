## GAT dev test

Prepare & seed database, than run rspec.

### Private API:

* GET /api/internal/locations/:country_code
* GET /api/internal/:country_code
* POST /api/internal/evaluate_target

Private API requires authentication with an AuthKey.
AuthKey value is specified in [config/api.yml](https://github.com/siemakuba/gat/blob/master/config/api.yml). Key needs to be passed with every request as an additional request header named: `X-InternalApiAuthKey`.

### Public API:

* GET /api/v1/locations/:country_code
* GET /api/v1/:country_code
