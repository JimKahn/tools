# Flash all Broadcom RAID cards.

@echo -off
map

for %f in fs0 fs1 fs2 fs3 fs4
  if exist %f%:\flashall.nsh then
    %f%:
    echo "using %f%"
    goto FOUND
  endif
endfor
goto FOUND

:FOUND
flashall
