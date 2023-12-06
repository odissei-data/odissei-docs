# DOI Minting

Doi minting is done at Datacite; this is done by posting against the Datacite API, and then extracting a DOI from the response. This response is implemented in the resulting JSON.

## Technical setup

The technical setup here is a single Docker container running FastAPI. There is a hard dependency on dans-transformer-service, which transforms the input data to Datacite API-compatible JSON, and interprets the response.

## API endpoints


## Image
