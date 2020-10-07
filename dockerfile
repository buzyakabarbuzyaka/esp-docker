FROM python:3.8
RUN python -m pip install --upgrade pip
RUN pip install pyserial
RUN apt-get update
RUN apt-get install git
RUN apt-get install make
RUN git clone https://github.com/espressif/arduino-esp32.git
RUN cd arduino-esp32/tools && python get.py
RUN git clone https://github.com/plerup/makeEspArduino.git
WORKDIR /makeEspArduino
CMD make -f makeEspArduino.mk ESP_ROOT=/arduino-esp32 LIBS=/arduino-esp32/libraries/ CHIP=esp32 DEMO=1 UPLOAD_PORT=/dev/ttyUSB0 flash
