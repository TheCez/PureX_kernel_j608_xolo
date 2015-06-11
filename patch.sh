if [ -e ./out/target/product/j608_fly/obj/KERNEL_OBJ/arch/arm/boot/zImage ]; then
    echo "**** Successfully built kernel ****"

    echo "*** COpyig kernel for patching header ***"
    cp ./out/target/product/j608_fly/obj/KERNEL_OBJ/arch/arm/boot/zImage mediatek/build/tools

    echo "*** Patching header ***"
    cd mediatek/build/tools
    ./mkimage zImage KERNEL > ../../../mtktools/boot.img-kernel.img

echo "*** Making boot.img ***"
cd ../../../mtktools
./repack-MTK.pl -boot boot.img-kernel.img boot.img-ramdisk ./bootzip/boot.img

echo "*** Making zip ***"
cd bootzip
zip -r out .
mv out.zip ../../kernel.zip

fi
