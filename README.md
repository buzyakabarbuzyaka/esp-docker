docker build -t esp-docker:latest .  
docker run --device=/dev/ttyUSB0 -t esp-docker:latest


docker run -t -v ${PWD}/output:/output esp-docker:latest


### GET_MAC  
python arduino-esp32/tools/esptool.py read_mac

### LOAD BIN
python -m esptool --port /dev/ttyUSB0 write_flash 0x1000 build/WiFiScan.bin
python -m esptool --port /dev/ttyUSB0 write_flash 0x0 build/WiFiScan.bin


make -f makeEspArduino.mk ESP_ROOT=../arduino-esp32 LIBS=../arduino-esp32/libraries/ CHIP=esp32 SKETCH=../snippets/blink.cpp all  



python ../arduino-esp32/tools/esptool/esptool.py \
--chip esp32 \
--port /dev/ttyUSB0 \
--baud 921600 \
--before default_reset \
--after hard_reset \
write_flash -z \
--flash_mode dio \
--flash_freq 40m \
--flash_size detect \
0xe000 ../arduino-esp32/tools/partitions/boot_app0.bin \
0x1000 ../arduino-esp32/tools/sdk/bin/bootloader_dio_40m.bin \
0x10000 /tmp/mkESP/blink_esp32/blink.bin \
0x8000 /tmp/mkESP/blink_esp32/blink.partitions.bin

python ../arduino-esp32/tools/esptool/esptool.py \
--chip esp32 \
--port /dev/ttyUSB0 \ 
--baud 921600 \
--before default_reset \ 
--after hard_reset \
write_flash -z \ 
--flash_mode dio \
--flash_freq 40m \
--flash_size detect \ 
0xe000 ../arduino-esp32/tools/partitions/boot_app0.bin \
0x1000 ../arduino-esp32/tools/sdk/bin/bootloader_dio_40m.bin \ 
0x10000 /tmp/mkESP/blink_esp32/blink.bin \
0x8000 /tmp/mkESP/blink_esp32/blink.partitions.bin