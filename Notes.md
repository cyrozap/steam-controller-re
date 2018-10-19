Controller Info:
 - Firmware Revision: 0x5653A68A @ 0x000034DC
 - Bootloader Revision: 0x55D2926D @ 0x00000024
 - Radio Firmware Revision: 0x56424A6C
 - Firmware Date: 1448322698 (0x5653A68A)
 - Bootloader Date: 2015-08-17-22:03:25
 - Radio Firmware Date: 2015-11-10-14:50:04
 - Receiver Firmware Date: 1442256398 (0x55F7160E)

USB IDs:
 - Valve VID: 28de
 - Wired Controller Bootloader PID: 1002
 - Wired Controller PID: 1102
 - Wireless Dongle PID: 1142

To dump the LPC boot ROM:

    $ dump_image lpc-bootrom.bin 0x1fff0000 0x4000

To dump the LPC firmware:

    $ dump_image lpc-flash.bin 0 0x20000

To dump the NRF firmware:

    $ dump_image nrf-flash.bin 0 0x20000


Firmware update protocol:
 - Unknown byte: 0x92
 - Firmware data length N (usually 0x32 until the last packet)
 - N bytes of the firmware
 - (64 - 2 - N) null padding bytes


nRF Serial Protocol:
 - 0x02: SOP
 - 0x03: EOP
 - Received samples:
   - 0x02 0x57 0x1f 0x22 0x03
   - 0x02 0x57 0x01 0x03
