docker build -t esp-docker:latest .  
docker run --device=/dev/ttyUSB0 -t esp-docker:latest