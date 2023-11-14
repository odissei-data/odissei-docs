# Your first ingestion

For local development purposes, it may be interesting to run an ingest locally. Keep in mind, you will need a sufficiently powerful laptop. Do not go under 16 GB's of RAM and as many cores as you have the $$ for, unfortunately a number of these services (such as the stack) consume quite some memory.

A good go-between may be to run the stack somewhere external to your computer (say, a server) as a deployed application, and then do the ingestion locally. The stack is, by and far, the heaviest piece of tech you're going to run. If you find yourself running out of resources, see about running that externally.

## Set up ODISSEI Stack

1. Clone the repo
2. Copy the .env example file to a `.env` file.
3. `./start-odissei.sh`
4. Get coffee. This will take a while.

Once you've got coffee, do the following:

1. Deploy your .war archive, in case you're running custom and really want those interface changes.
2. Add the TSV metadata files
3. Log in via `http://localhost:8080`, and create the corresponding sub-dataverses (directly under root) through the interface. Don't forget to turn on the correspoding tsv blocks when setting up the sub-dataverses.

That's it. Move over to labs.

## Set up labs

Clone the repo (or write your own Docker file) to set up the labs environment. Locally, all of these services will run in one port; just make sure they're in the `traefik` network so they can talk to the Stack.

Set up secrets if you need. You'll need dev config for certain.

## Get you some metadata

Get some metadata. Talk to some people. Get their data. Then host it in your minio container (which should also live in `traefik` network on Docker). You can either upload it by scripting this, or by adding it through the webinterface of Minio.

## Start up workflow orchestrator

Start the orchestrator. By default, this should already provide you with some flows. Pick the one you like - and start it. You should see a list of sub-flows being executed, and assuming you've read through the documentation carefully enough, you'll either have some errors (which should be there as plaintext) or the beginning of data inside your Dataverse.
