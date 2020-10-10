# BUILD
#### dir: ./esp-docker/builder  
```docker build -t esp-builder:latest .```

# RUN
#### dir: ./esp-docker
```docker run -t -v ${PWD}/build:/build esp-builder:latest```