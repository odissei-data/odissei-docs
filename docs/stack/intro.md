# ODISSEI Stack

The ODISSEI Stack is the component that will host all of your (enriched) metadata. The details of this construction are enclosed within this article.

## Components & software

The Stack itself uses Dataverse, which is developed by Harvard and IQSS as a knowledge repository. Versioning and maintainance is done by Harvard. The great part here is that we can use it as a stand-alone package to host repository information.

We're using a version developed by Vyacheslav Tykhonov, which runs on Docker. The benefit here is that we can easily destroy and re-ingest information, if need be.

The Stack has a number of components. These are listed below.

### Solr

Solr is responsible for acting as index, and initial point for searching. We run Solr 8.7.* with a couple of edits to our configuration file and schema, so as to accomodate for our enriched metadata. These configuration files, respectively, have the following purposes:

- The configuration file (`solr.xml`) is responsible for the behaviour of the Solr instance. This dictates weights, completion, stemming, and priorities. We use this to ensure the proper results arrive in the order we like.
- The `schema.xml` file is responsible for mapping and identifying fields we plan to ingest, making the indexable and searchable. This is required to be updated so that the data we plan to add will be properly indexed.

Some of the enrichments we do are done through Dataverse; some of them are done directly through Solr. We will later examine why this is done.

### Postgres

Postgres is a database, responsible for persistent storage of metadata information. Dataverse uses this as a way to both preserve information (and usage information) about files and data hosted within Dataverse, as well as a way of regenerating the Solr index in case it's ever lost. 

We have made no modifications here.

### Dataverse

Dataverse is the software platform maintained and written by Harvard, which we're using to provide a tool to search enriched metadata. Few changes have been made here; we simply run a changed dataverse.war archive with some visual changes. These are technically unnecessary for the proper function of the Stack

## Configuration

Configuration of dataverse is to some extent done via an environment file (`.env`). We've changed very little here, again; simply copy the example before starting it.

## Starting

We've packaged two scripts to start and stop the stack. Simply run `./start-odissei.sh` in your ODISSEI Stack repo to run the corresponding Docker containers. 

