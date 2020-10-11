# RUN FROM ./esp-docker/makeEspArduino !!!

rm -f ../build/*
touch ../build/.dust
make -f makeEspArduino.mk ESP_ROOT=../arduino-esp32 LIBS=./libraries/ CHIP=esp32 SKETCH=../src/app.cpp all
cp /tmp/mkESP/app_esp32/app.bin ../build/app.bin
cp /tmp/mkESP/app_esp32/app.partitions.bin ../build/app.partitions.bin