# Documentation project

This project came out of a need to:

- Document knowledge 
- Share it in an easily readable format
- Keep it versionable
- Allow it to automatically build and ideally deploy

## Technology stack

- Docker (For having product version control)
- Python 3.9 Alpine (to keep image size small)
- mkdocs (Pip package)
- mkdocs-material (For nicer presentation)

## Setup

In order to set up the project locally, do the following:

1. Install Docker on your computer.
2. Clone the project repo.
3. `docker compose up -d`
4. Go to [http://0.0.0.0:4040](http://0.0.0.0:4040)
5. Voila. You have documentation.

The docker compose file also mounts the directory `docs` to the container. This allows for live editing. In the build, this is handled just by copying.

## CI/CD & Deployment

The project builds (currently) to dansknaw/odissei-docs:<version>. This version is presently private to protect sensitive information.
