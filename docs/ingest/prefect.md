# Prefect

In order to rope all services together, we have a service which calls the services in term, in a long-term, automated manner. This is Prefect; similar to Airflow, but a bit different. By staging deployments based on our configs here, we can re-use small pieces of our work repeatedly to produce results.

## Technical setup

The technical setup is two Docker containers; a Prefect instance we build ourselves, which runs Prefect Server and a local agent to process tasks. The second container runs a Postgres database for data persistency of runs. In a production setting, we add a reverse proxy through Nginx.

### Prefect

Prefect is the software which controls the runs of flows and is responsible for executing tasks. In order to run this, we've leveraged two things; namely first a Prefect server instance which runs on port 4200, and secondly an Agent which is capable of running schedule flows. The 

### Supervisord

Supervisor is used to maintain several processses; this is what we mean with a server and agent process to perform tasks. Technically this gives us scaling room, since agents may live (technically) on a different machine, or alternatively on a cloud.

## Concepts

In order to develop on Prefect, an understanding of concept is required. While the [core documentation of Prefect](https://docs.prefect.io/latest/) gives a decent view on this, this is more natural to a writer/reader of Python than someone reading the code and trying to piece together hierarchies. Hence, it's covered here as well.

### Tasks

Tasks are the elementary units of processing of Prefect; a single function which takes an input, and returns an output. In most cases, this will be a Python dictionary. Tasks are the unit of scaling/processing; the dependency of task objects determines the construction of the DAG, which in turn determines method resolution and parallelisation. When we look at the success of a single enrichment, a task is what we look at.

### Flows

Flows contain tasks. Each ingestion of a single record, corresponds with a task in Prefect. A task is a long-running job which has a state, such as `running`, `completed`, or `failed`. When we look at the success of an ingestion, a task is the declarative unit to look at.

### Deployments

Deployment are formalization of flows, allowing us to run them from the interface. Deploying a flow is optional (a flow can run just fine without deployment over the command line interface), it's a human convenience factor which allows scheduling, starting through the interface, and otherwise greater convenience.

A deployment is the end result of our work.

## CI/CD

Our CI/CD setup does a number of things:

- Creates a Docker image and commits it
- Once deployment is done, creates deployments

## Production setup

The production setup uses an nginx reverse proxy to ensure no direct access to the container is possible.
