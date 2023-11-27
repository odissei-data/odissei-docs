# Introduction

Ingestion is what we call the process of downloading, enriching, and ingesting metadata into the ODISSEI Stack. This process utilizes Docker containers to perform these functions, for schematic and semantic translations, and ultimately to upload it in the Dataverse instance.

## Techniques used

When performing an ingest, we tend to use the following techniques and technologies:

- Minio for fire storage and API/S3 level file access. All our metadata files are small and do not require extende file storage and so; reaching them programmatically is the first step to making the machine work.
- A number of Docker containers, running FastAPI, allowing functions and processes to be adressed using HTTP. By keeping those services small, they can scale by moving them easily, and it's easy to create a new one or improve an existing one.
- Finally, the orchestrator to rope everything together, by allowing long running tasks to work.

## Technical setup
 
The technical setup is relatively uncomplicated:

- All the Docker containers must live in the same network as the orchestrator.
- Minio must be network addressable as well, ideally again same network, alternatively within the same Docker network
