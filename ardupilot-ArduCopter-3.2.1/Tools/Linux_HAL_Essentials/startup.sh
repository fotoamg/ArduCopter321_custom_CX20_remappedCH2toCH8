if [ "`echo $1`" = "load" ]; then
    echo "Loading Test_Capes..."
    cp BB-SPI0-PXF-01-00A0.dtbo /lib/firmware/
    cp BB-SPI1-PXF-01-00A0.dtbo /lib/firmware/
    cp BB-BONE-PRU-05-00A0.dtbo /lib/firmware/
    cp testpru0 /lib/firmware
    cp pwmpru1 /lib/firmware
    echo BB-BONE-PRU-05 > /sys/devices/bone_capemgr.*/slots
    echo BB-SPI0-PXF-01 > /sys/devices/bone_capemgr.*/slots
    echo BB-SPI1-PXF-01 > /sys/devices/bone_capemgr.*/slots
    dmesg | grep "SPI"
    dmesg | grep "PRU"
    cat /sys/devices/bone_capemgr.*/slots
elif [ "`echo $1`" = "reload" ]; then
    echo "Loading Firmware..."
    cp testpru0 /lib/firmware
    cp pwmpru1 /lib/firmware
    echo 0:testpru0,1:pwmpru1 > /sys/devices/ocp.3/4a300000.prurproc/load
else
    echo "Usage:"
    echo "      ./startup.sh load  : to load the capes and firmware"
    echo "      ./startup.sh reload: to reload firmware"
fi
