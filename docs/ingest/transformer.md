# Transformer service

The DANS transformer service is a service which takes care of schematic transformations between services. Within our setup, this is used to convert between schemas of DOI minter, dataverse JSON, and various other tools.

## Technical setup

The technical setup is a docker container. It's presently deployed at [Labs](https://transformer.dans.knaw.nl/docs/).

## API endpoints

The transformer has a large amount of API endpoints. Main purpose:

- Take in XSLT files to perform transformations
- Delete XSLT files
- Use XSLT files to perform transformations; a file is also required

