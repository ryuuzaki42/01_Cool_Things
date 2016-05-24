## Download VM
    http://www.osboxes.org/android-x86/
    # Android-x86_4.4_r4 works good

## Configuration in the VM
    Version: Other Linux (32-bit)
    Boot order: only Hard disk
    Pointing Device: PS/2 Mouse
    Extended Features: Enable PAE/NX
    User Interface = Disable mouse integration

## Fulll screen # http://stackoverflow.com/questions/6202342/switch-android-x86-screen-resolution
    # List VM running
    VBoxManage list runningvms

    # Check your VM name and add a new resolution:
    VBoxManage setextradata "[YourVmNameHere]" "CustomVideoMode1" "800x480x16"
        # VBoxManage setextradata "Android-x86 4.4-r4-disk1" "CustomVideoMode1" "1366x768x16"

     # Change the android load resolution
     Load VM in (Debub video=LVDS-1:d)

     # Mount the partition boot
     mount /dev/sda1 /mnt

     # Edit the file /mnt/grub/menu.lst
     vi /mnt/grub/menu.lst

     # And added in the frist kernel load entrer after android_x86
     UVESA_MODE=1366x768 DPI=160
#