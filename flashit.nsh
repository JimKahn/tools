# Update Broadcom 9300 PCIe Card Firmware
#
@echo -off
echo "Updating Broadcom 9300-8i PCIe Card Firmware."
echo

sas3flash.efi -o -listsasadd
echo "Please record SAS address."
pause

# Wipe everything
#sas3flash.efi -o -e 7
sas3flash.efi -o -e 6

sas3flash.efi -c 0 -o -b mptsas3.rom -f SAS9300_8i_IT.bin
if not %lasterror% == 0 then
  set -v FwStatus %lasterror%
  echo "*** ERROR: Broadcom firmware update failed!"
  goto END
endif

sas3flash.efi -c 0 -b mpt3x64.rom
if not %lasterror% == 0 then
  set -v FwStatus %lasterror%
  echo "*** ERROR: Broadcom EFI update failed!"
  goto END
endif

sas3flash.efi -c 0 -o -sasaddhi 5003048

:END
