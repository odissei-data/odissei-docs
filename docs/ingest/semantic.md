# Semantic enrichment

Semantic enrichment is a tool to enrich the SOLR index by providing translations and alternate meanings of concepts, based on Skosmos vocabularies. This is done by querying the Skosmos API, and then inserting this directly in the Solr index. The semantic enrichment was developed by Vyacheslav Tykhonov.

## Technical setup

This is a single Docker container; requirements are a running Skosmos instance (can be local or remote) with an accessible API, and a Solr instance which is either exposed, or accessible on the local host.

## Configuration

The semantic enrichment is controlled by means of a configuration file; this is handled in the repo. Both the `.env` file and the `config.py` file are important; ensure you check both of them.

## API endpoints

The API has two endpoints:

- `version` returns a version string to be used for versioning.
- `importdoi` is a single endpoint, which expects a DOI at a dataverse, a Skosmos instance, a field, and various other items to produce an enriched record in Solr.

## Image

The image can be built from the repo; to my understanding, there is no image on Dockerhub

## Repo

The repo is available at [Github](https://github.com/Dans-labs/semantic-enrichment).
