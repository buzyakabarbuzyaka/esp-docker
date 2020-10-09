FROM python:3.8

RUN python -m pip install --upgrade pip
RUN pip install pyserial

RUN apt-get update
RUN apt-get install git
RUN apt-get install make

RUN git clone https://github.com/espressif/arduino-esp32.git
RUN cd arduino-esp32/tools && python get.py

RUN git clone https://github.com/plerup/makeEspArduino.git
# VOLUME ./output /output
COPY ./src /src
COPY ./esp-build-extract.sh /esp-build-extract.sh
WORKDIR /makeEspArduino
CMD . /esp-build-extract.sh