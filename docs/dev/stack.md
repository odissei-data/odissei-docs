# ODISSEI Stack

The ODISSEI Stack is the repository of metadata, which is used to contain and offer searchable metadata in a webinterface. Prior to deposition, this is enriched by a variety of tools, discussed elsewhere in this documentation.

ODISSEI Stack is largely based off dataverse-docker, or Archive in a Box, as developed by Vyacheslav Tykhonov.

The stack contains, in short, the following components:

- A Dataverse application container, which runs and extracts a .war archive and runs it under a Payara server.
- A Solr instance, which can talk to the Dataverse container and is accessible to search queries.
- A Postgres instance, which hosts persistent file storage.

## Versions

Version management is done per branch/version of the stack. Underwater, this sets the correct Docker images to produce a working instance.

Beyond that, there are two versions of the stack present. The current version, which we are running in production, is running the Dataverse stack based on dataverse-docker. The Devstack, however, is running IQSS's Dataverse in container mode. This has not been released yet, but looks promising.

### Current version

The current version is running on 5.13, with a custom .war archive. The ODISSEI UI changes are packaged into the .war file, which means extracting it is enough to get you going.

### Future version

The future version, Devstack, will no longer run a .war file, but instead work directly off Java files. Furthermore, the versions used are a fair bit newer.

## Setting up locally

1. Clone the repository of your choice.
2. Follow the instructions as described in the readme of that repo.
