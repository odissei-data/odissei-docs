# Provenance tracking

Provenance tracking tracks which enrichment tools were called, in what order, with what endpoint. In this manner, we provide a persistent, versionable record of changes done to a single dataset/DOI, allowing our work to be reproduced. This makes it more FAIR. 

## Technical setup

The setup here is a single FastAPI container which runs the API and the database connection, and a single MongoDB database container which is responsible for persistent storage. Both of these services are Dockerized, and run as part of labs infrastructure.

## API endpoints

Current version runs [Here](https://version-tracker.labs.dans.knaw.nl/docs). 

Current endpoints are `/store`, which takes in a POST request, and accepts a dictionary/hashtable as POST data. This data is then persistently stored, and an identifier is returned. Second endpoint is `/retrieve/<version_dict_id>`, which allows a single record to be retrieved by identifier.

## Image

This has been packaged into an image; presently available at Dockerhub at [version 0.1.0](https://hub.docker.com/r/fjodorvr/version-tracker).

