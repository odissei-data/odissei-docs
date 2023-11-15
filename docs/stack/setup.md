# Understanding setup

Setting up the stack is decently easy. Very briefly said, there's a couple of tasks to do when setting up; namely starting up, and letting containers build, and then configuring properly.

## Starting

1. Clone the repo
2. Clone the Skosmos submodule in the right spot
3. `./start-odissei.sh`
4. This will now pull, build, and start all the containers

## Configuring

1. Move the `docker-compose-skosmos.ttl` to the correct directory (`distros/Skosmos/dockerfiles/config/`)
2. `docker compose -f distros/Skosmos/dockerfiles/docker-compose.yml restart`
3. Run submodule init for the utils directory
4. Go to `utils/metadata` and run `./upload-blocks.sh`

## Optional steps

1. Copy the .war file (if you have one) into the container with `docker cp dataverse.war dataverse:/tmp/dataverse.war`
2. `docker exec -it dataverse bash`
3. `docker mv dataverse.war dataverse-old.war && cp /tmp/dataverse.war .`
4. `asadmin undeploy dataverse` (credentials admin/admin)
5. `asadmin deploy dataverse.war`
