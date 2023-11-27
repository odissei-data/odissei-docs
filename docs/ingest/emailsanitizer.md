# Email sanitation

Email sanitizer is responsible for attempting to remove email addresses from arbitrary blobs of text. This is done using regex, on a best-effort basis (it's going to catch about 99.9% of all cases but it's not perfect). This attempts to ensure the metadata does not contain personal data in the form of email addresses.

## Technical setup

The setup here is a single FastAPI container which acts as a function, taking in a metadata record as string input and returning that same datas string output. Logs are ephemereal.

Currently two copies are running; the Docker container which is described here, and a serverless function running off Azure Functions.

## API endpoints

- `/version` returns the current version number of the application/
- `/sanitize` is responsible for taking in data (in string format) and returning that data, same format, with the email addresses removed.

## Image

This image presently lives on Dockerhub, on `thomasve/emailsanitizer`.
