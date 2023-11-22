# Skosmos setup

Skosmos is run using Docker, similar to ODISSEi Stack. Setting up requires you to clone the subrepo in the correct location:

1. Go to the home directory of ODISSEI Stack
2. `git submodule init`
3. `git submodule sync`
4. `git submodule foreach git pull --rebase`

You should be on latest tip of the branches at this point; for reference; this can differ between `develop` for dataverse, `master` for Skosmos, and `main` for Custom-Metadata. In case these are off - go to each directory manually (run `git submodule`) and checkout each one manually by running `git checkout <branch_name>`.

Lastly, run `./start-odissei.sh`. This will pull, build, and up Skosmos too, which should then run on `http://localhost:9090`.

## Architecture

Skosmos runs using three containers:

1. The Skosmos application, running in PHP. This provides the API and webinterface for searching and so.
2. The Jena-Fuseki application, running in Java. This hosts the persistent storage.
3. A Varnish container. Graphing queries are rather (read: hugely) expensive compared to relational equivalents in terms of computing and memory resources to run a shortest path algorithm, so caching these is a "cheap" way to serve repeat queries rather than paying the computing cost each time.

## Setting up as part of ODISSEI Stack

A number of steps need to be done to get Skosmos to be able to talk to ODISSEI Stack, and externally reachable.

1. Go to `/distros/Skosmos/dockerfiles` from the home directory of the Stack, then edit the Docker compose file to add all containers to the `traefik` network. Also add the network to the docker-compose.yml file. This makes containers reachable via proxy and arranges SSL for you.
2. Copy the config from the `/utils/skosmos` directory to `/distros/Skosmos/dockerfiles/config`, and either change the mount in the docker-compose file to use the new file, or just replace the existing file. This will allow you to load/connect the directories.
3. Run the `odissei-init.sh` script, located in `/utils/skosmos`. This script does a number of things; it downloads existing TTL/RDF files, converts them using `raptor2-utils` CLI library, then uploads the results into Jena-Fuseki, assuming this runs on `http://localhost:3000`, on endpoints corresponding with the graphs in the Skosmos configuration file.

Now, if you head to the webinterface of Skosmos, you should see a number of new vocabularies added. 

## API reference

API reference of Skosmos can be found [in their own documentation.](https://github.com/NatLibFi/Skosmos/wiki/REST-API)

## Webinterface

The webinterface natively runs on `http://localhost:9090`, while the webinterface for Jena-Fuseki is supposed to run on `http://localhost:3000`. If you proxy using traefik, it "normally" runs on `https://skosmos.<hostname>.odissei.nl`, though you're free to change this in the central .env file.

## Reverse proxy

The reverse proxy configuration file is located in `/distros/ODISSEI`, which is what we're using for Traefik.
