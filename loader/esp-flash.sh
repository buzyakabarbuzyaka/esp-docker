# RUN FROM ./esp-docker !!!

python ./arduino-esp32/tools/esptool/esptool.py \
--chip esp32 \
--baud 921600 \
--before default_reset \
--after hard_reset \
write_flash -z \
--flash_mode dio \
--flash_freq 40m \
--flash_size detect \
0xe000 ./arduino-esp32/tools/partitions/boot_app0.bin \
0x1000 ./arduino-esp32/tools/sdk/bin/bootloader_dio_40m.bin \
0x10000 ./build/app.bin \
0x8000 ./build/app.partitions.bin