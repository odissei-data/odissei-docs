# Loading CV data

N.B. This is an advanced article into how data is loaded into Jena Fuseki, and how Skosmos accesses this data. The best start is to familiarize yourself with the `odissei-init.sh` script first, and understand, conceptually, how the lines and configurations there work.

As covered in the setup part of Skosmos; in order for Skosmos to show data, it must be loaded into Jena Fuseki into a graph, whilst Skosmos must be properly configured. Below are the steps to perform this task.

## How downloading and conversion is done

Typically, when vocabs are downloaded, they're in an RDF format. This is no good; Skosmos likes to read .ttl files. In order to convert, we use the `raptor2-utils` library to convert files. Install this with your system package manager. Your best option is a Linux-based system here; I haven't run or tested this on Windows. Once it's installed (or you switched to a better operating system which allows you to install this), run `man rapper` to see the man file, confirming it's installed. You're now ready to convert.

We download RDF files typically by using wget or curl, redirecting output to a file. Previously, I included logic to strip zero-byte characters from this file (or termination characters), but later on it appears that while `rapper` throws a warning, it does not actually break and Skosmos is happy to load it. Conversion can be done with a single command, such as `rapper TypeOfInstrument.rdf --output turtle > TypeOfInstrument.ttl`. This generates (with a warning) a .ttl file, which Jena-Fuseki is happy to ingest.

## How data is loaded into a graph in Jena Fuseki

Once all the conversions are done (this should take a few seconds per file; the `rapper` library is quite efficient), you can start ingesting them into Jena Fuseki. Do to this - simply curl them to `http://localhost:3000/` along with an auth header to do the `admin:admin` login. You are supposed to encode the graph endpoint normally (and can do so with curl), but I typically prefer to do this manually since curl can get bothersome with this sometimes. Main thing - make sure you're loading the graph as binary data.

Example curl:

```
curl -X POST \
 -H "Content-Type: text/turtle" \
 -H "Authorization: Basic $AUTHHEADER" \
 --data-binary @elsst.ttl \
 $TARGET/skosmos/data?graph=$ELSST_GRAPH_ENDPOINT
 ```

Once this is done, Jena Fuseki should now show some data. Or, you've got an error. Those are tackled below.

### Troubleshooting Jena Fuseki

Troubleshooting JF is, in short, annoying. When you reached this point in the documentation, understand a number of things could have gotten messed up:

1. The JF API has been changed, again. The last time this happened, required the introduction of the basicauth header as part of the API call.
2. The JF version has changed in the Skosmos repo, again. The last time this happened, it broke JF, since the maintainer (`stain`) produced a broken image. It appears that Skosmos is now doing the build steps as part of their repo for that reason.
3. Something else has changed, which is not covered here.

Your best option here is:

- Check the logs when uploading the .ttl files to JF locally. Then check the Docker logs. This should give you some hint about what might be happening.
- Change your code accordingly. This will require a fair bit of experimentation. I have kept my tools restricted to basic Unix tools; my suggestion would be to do the same, in order to keep interopability.
- Please, make a backport to the `odissei-init` script.
 
## How Skosmos knows which graph to access

At this point, data should be living inside JF, and now Skosmos should be able to connect to it.

See the example `docker-compose-skosmos.ttl` file which lives in `/utils/skosmos` directory in ODISSEI Stack; this contains the default config we load (and it's syntax). Of importance in this config:

- The languages. Most graphs will be multi-language, but this can differ per graph. Under `skosmos:language`, you can configure this.
- The `skosmos:sparqlGraph` endpoint. This is the graph endpoint where we uploaded the graph.
- The `shortname`, which is visible in the interface.

Skosmos is much less tolerant of errors, so when you mess up this file (*always make a copy!), it will refuse to start.

### Troubleshooting a Skosmos config

You could mess up several things with a Skosmos config. Common mistakes are included below:

- Using the wrong graphing endpoint; using `http` instead of `https`, or making typo's here, will result in an error when this graph is viewed using the Skosmos webinterface.
- Syntax will break your config, causing Skosmos to die. Check the syntax carefully, and mind the pesky `;` characters to denote an end of line, and a `.` character to denote end of block.
- Sometimes, `skosmos:showTopConcepts true ;` must be set to `false` instead, since the CV might not have a top level concept list (and will break as a result). Experiment.
- The logs in the Skosmos container are decent and can be checked for fairly decent errors.

## Loading

Loading is the combined processes of downloading, conversion, and ingestion into JF. This can be done in two ways; manually or using the cool script we've got for this.

### Using odissei-init.sh

`odissei-init.sh` tackles three distinct problems:

1. Which version of the vocabulary to download and convert; these are arguments based on the URL here.
2. What to do with each vocab; some of these vocabs download as TTL, while others do as RDF. We've largely automated the logic here per CV.
3. Which graphs to upload to. This is also a setting, which can be centrally managed.

This saves you a lot of time with rinse, repeat, and troubleshooting. Once it's done.

Just update the vars as you see fit, then try to convert/upload.

# ## Loading manually

The process for manually uploading and converting is exactly the same as with `odissei-init.sh`; except you'll upload using your human fingers rather than automation. Use this to debug where something might be breaking, while keeping an eye on container logs. The instructions can literally be copied, line by line, from `odissei-init.sh`. 

See the troubleshooting sections to figure out what might be wrong; furthermore, the documentation for Jena Fuseki and Skosmos, the Dockerfiles enclosed in Skosmos, and common sense will be your greatest assets here. 
