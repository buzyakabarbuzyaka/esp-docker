# BUILD
#### dir: ./esp-docker/loader
```
docker build -t esp-loader:latest .
```

# RUN
#### dir: ./esp-docker
```
docker run --privileged  -v ${PWD}/build:/build  -t esp-loader:latest
```