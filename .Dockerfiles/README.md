### Build Docker base image ###

from your git root dir execute 
```
./.Dockerfiles/create_images.sh
```

this will create 4 base images
```
docker images
REPOSITORY                    TAG                          IMAGE ID       CREATED        SIZE
build-10-27                   latest                       0fd8a7f92da6   3 hours ago    2.04GB
build-10-38                   latest                       aa43c0913ac2   11 hours ago   2.04GB
build-8-38                    latest                       0435aba2d95f   11 hours ago   2.04GB
build-8-27                    latest                       7e9f964e32eb   11 hours ago   2.04GB
```

