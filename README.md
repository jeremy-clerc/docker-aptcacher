# apt-cacher docker resources

A working Dockerfile for apt-cacher, with a pipeline definition for
[concourse](https://concourse.ci/).

## Run

```
docker run -p 3142:3142 jeremyclerc/aptcacher
```

## Configure concourse

Add a pipepline to your [concourse](https://concourse.ci/) CI, to build and
push a new image when this repository or debian:stable are updated.

Create a `creds.yml` file with the following infos:

```YAML
dockerhub_repository: bob/aptcacher
dockerhub_username: bob
dockerhub_password: bobpassword
```

Create and unpause the pipeline:
```
fly -t docker-ci set-pipeline -p apt-cacher -c pipeline.yml -l creds.yml
fly -t docker-ci unpause-pipeline -p apt-cacher
```
