# Minio

Minio is an application which provides an S3 interface on top of storage. This means file may be accessed, updated, or created over API, allowing programmatic access to data files.

Within our architecture, Minio's role is to act as base metadata container, allowing files to be drawn in from Prefect and processed.

## Technical setup

Minio runs in a Docker container; this maps to a local volume on the hard drive, where files and stored and drawn.

## Image

The image is maintained by [Minio on Dockerhub](https://hub.docker.com/r/minio/minio/tags?page=1&name=latest).
