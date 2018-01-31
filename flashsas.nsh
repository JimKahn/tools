# Update Broadcom 9300 Firmware
#
@echo -off
echo "Updating Broadcom 9300 SAS Controller Firmware."
echo

sas3flash.efi -c 0 -o -b mptsas3.rom -f 3008IT10.rom
if not %lasterror% == 0 then
  flashfix
  goto END
endif

sas3flash.efi -c 0 -b mpt3x64.rom
if not %lasterror% == 0 then
  set -v FwStatus %lasterror%
  echo "*** ERROR: Broadcom EFI update failed!"
  goto END
endif

:END
