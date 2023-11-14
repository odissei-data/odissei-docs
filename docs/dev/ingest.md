# Ingestion tools

Ingestion tools is a category of tools (by which is meant, Docker containers), tasked with performing transformative, enrichment, and third party-related tasks, aimed at ingesting enriched data into the stack. These tools, by virtue of fact of being Dockerized, can be run locally, or on a server of your choosing.

## Architecture and reasoning

The architecture is intended to be (micro)services. Each ingestion tool performs a set task, and performs it well; furthermore, even if scientific needs diverge away from the created prototypes, we can quickly deliver something new to meet that newly identified need.

The intention here is that smaller services will at some point become serverless functions, while larger, more impactful services will eventually go to live on a Kubernetes cluster. However, these are end-stage solutions, and this is a research project. 

All of these services are aimed to work over HTTP (using a RESTful API); this promotes decoupling, and scaling may occur by moving these services to the desired platform or server.

## Setup

In the current setup, we've done this using a number of Docker compose files, a CI/CD pipeline based on Github actions, and a secondary repo to copy secrets/configs to a set spot on the correct server. 

For a local setup, your configurations would simply live on your computer (and you'd need to correspondingly change the mount paths in the docker compose files).

## Intended flow

All of the services are intended to operate over REST. The orchestrator is intended to address each of these services, provide input, receive output, and proceed to the next service. Input from one service can be easily passed as request body to another service. 

This leads to the following process:

1. The orchestrator will perform flows. Each flows contains tasks, which address a service.
2. The orchestrator contacts the first service, providing the raw metadata file, and receives the file as reply.
3. The reply contains the to-be enriched metadata, as it stands at that point.
4. The reply is passed into the next service. This service is invariably an enrichment service.
5. This process continues until data is enriched, properly formatted, and all steps are completed. Kind of like pushing a domino.
6. The last step is ingestion into the ODISSEI Stack. The result is enriched metadata.

### Workflow orchestrator

The workflow orchestrator is responsible for stringing all separated services together in the correct order. In order to do this, it performs a number of tasks:

1. It contains the tasks to contact each service.
2. It contains the secrets (using Dynaconf) to gain access to each of those services.
3. It allows for long running jobs, using a list of files to be processed.

The workflow orchestrator is based on Prefect and Dynaconf. Check out their documentation(s) if you'd like to get a bit more insight on what we did here.

### Minio

Minio is a service, which adds S3 access on top of traditional file storage. The main benefit is that we can now programmatically update and access file data, which is great for automation purposes.

Minio is developed by, well, Minio. We've made no alterations to the base Docker container; simply run it, create buckets, add data, and you're done. The next step is accessing it.

## Settings and secrets

Secrets and settings are roughly the same thing, except different. Secrets are intended to remain secret, and should never be committed to repo's. Settings can be committed all you like (even advised). Both are relevant for starting and setting up flows.

Settings and secrets are what make the workflow orchestrator able to do it's job. We've committed the settings. As for secrets, there is an example.


