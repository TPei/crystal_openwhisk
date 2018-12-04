# crystal_openwhisk

crystal docker template for openwhisk

## How do I use this?

1. Download and install the OpenWhisk CLI
2. add code to main.cr
3. add dependencies to shard.yml
4. build and push your image
5. Test out action with CL

The script `buildAndPush.sh` is provided for your convenience. The following command sequence
runs the included example Docker action container using OpenWhisk.

```
# build/push, argument is your docker hub user name and a valid docker image name
./buildAndPush <dockerhub username>/docker-crystal

# create docker action
wsk action create dockerCrystal --docker <dockerhub username>/docker-crystal

# invoke created action
wsk action invoke dockerCrystal --blocking
```

## Anything else?

Make sure that you return a dict-compatible json object, so just `{ key:
value, key: value }` stuff

### Using wskdeploy

Create a manifest.yml

```yaml
packages:
  some_package:
    actions:
      dockerCrystal:
        docker: username/docker_crystal
```

Then run `wskdeploy`
