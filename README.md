# Neo4j Dockerfile

A Dockerfile that produces a Docker Image for [Neo4j](http://www.neo4j.org/).

## Neo4j version

The `master` branch currently hosts Neo4j 2.1.

Different versions of Neo4j are located at the github repo [branches](https://github.com/josekilo/docker-neo4j/branches).

## Usage

### Build the image

To create the image `josekilo/neo4j`, execute the following command on the `docker-neo4j` folder:

```
$ docker build -t josekilo/neo4j .
```

### Run the image

To run the image and bind to host port 7474:

```
$ docker run -d --name neo4j -p 7474:7474 josekilo/neo4j
```

#### Persistent data

The Neo4j server is configured to store data in the `/data` directory inside the container. You can map the
container's `/data` volume to a volume on the host so the data becomes independent of the running container:

```
$ mkdir -p /tmp/neo4j
$ docker run -d \
    --name neo4j \
    -p 7474:7474 \
    -v /tmp/neo4j:/data \
    josekilo/neo4j
```
