make -f makeEspArduino.mk ESP_ROOT=../arduino-esp32 LIBS=../arduino-esp32/libraries/ CHIP=esp32 SKETCH=../src/app.cpp all
cp /tmp/mkESP/app_esp32/app.bin ../output/app.bin
cp /tmp/mkESP/app_esp32/app.partitions.bin ../output/app.partitions.bin