# Repair Broadcom 9300 PCIe Card Firmware
#
@echo -off
echo "Repairing Broadcom 9300-8i PCIe Card Firmware."
echo

# Wipe everything but SAS ID.
sas3flash.efi -o -e 6

sas3flash.efi -c 0 -o -f 3008IT10.rom -nossid
if not %lasterror% == 0 then
  set -v FwStatus %lasterror%
  echo "*** ERROR: Avago firmware repair failed!"
  goto END
endif

sas3flash.efi -c 0 -b mptsas3.rom
if not %lasterror% == 0 then
  set -v FwStatus %lasterror%
  echo "*** ERROR: Avago OPTROM repair failed!"
  goto END
endif

sas3flash.efi -c 0 -b mpt3x64.rom
if not %lasterror% == 0 then
  set -v FwStatus %lasterror%
  echo "*** ERROR: Avago EFI repair failed!"
  goto END
endif

:END
