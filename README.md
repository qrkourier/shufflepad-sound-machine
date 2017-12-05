# shufflepad-sound-machine
Continuously play sound effects separated by a random amount dead air

## A Spooky Sound Machine
I wanted to create a spooky ambiance for the front stoop of the house where tricksters and ghouls were expected to appear on Halloween night. I wrote a script to shuffle a directory full of halloween sound effects (e.g., chains rattling, ghosts laughing, etc...) and concatenate them together with an unpredictable delay between each effect to increase the chances of startling my victims.

### Download a copy of the sound effect loop
If you just want the 90 minute stream of sounds with random silence that I used with my Spooky Sound Machine you can download [the .mp3 file](https://dl.dropboxusercontent.com/u/284525/SpookySoundMachine.mp3).

### Make Your Own Spooky Sound Machine
#### Materials
* one or more amplified speaker(s) that can accept a signal from a 1/8" headphone jack
* one Raspberry Pi (any model with a headphone jack should work)
* one SD card at least 8GB in size
* one copy of [the SpookySoundMachine disk image for Raspberry Pi](https://dl.dropboxusercontent.com/u/284525/raspi-miniban-spookysoundmachine.img.gz)

#### Instructions

##### Overview

You will write the disk image to the SD card, insert the card in the RasPi, connect the speaker to the RasPi, and plug in the power to the RasPi. In a few moments you will hear the first sound effect. Of course, the following steps will completely destroy any existing data on your SD card.

You do not need Linux or MacOS for this, but I don't have convenient access to Windows in order to write those instructions. If you do so I would be happy to include your findings in this document. 

##### Step by step 
###### Linux terminal or MacOS Terminal.app

1. Attach the SD card to your computer

2. Discover the device name of your SD card. 
  * Run `sudo fdisk -l` and look for a device with the appropriate size 
  ```
  Device         Boot Start      End  Sectors  Size Id Type
  /dev/mmcblk0p1 8192 62333951 62325760 29.7G  c W95 FAT32 (LBA)
  ```
  * Alternatively, run `dmesg` immediately after attaching the card and inspect that last few lines of kernel ring buffer output as it detects the device

3. make sure it is not mounted (is ejected) or the write command will fail
  1. run `mount` or `df -h` or look in your file manager GUI to see mounted devices
  2. run `sudo umount DEVICENAME` for the DEVICENAME or click eject if any of your SD card's partitions are mounted 

4. Decompress and write the image file to the SD card root device (not to a partition).
  * I did this in Ubuntu Linux `gunzip < ~/Downloads/raspi-miniban-spookysoundmachine.img.gz | sudo dd of=/dev/mmcblk0`. 
  * You will need to modify this depending on where you downloaded the compressed image file and whatever the name of the SD card happens to be on your system (mine is /dev/mmcblk0 and the first partition has a 'p1' suffix, so be sure to not include that in your `dd` command). 

### Make A Sound Machine With Your Own Sound Files
#### Materials
* Same as the list for the Spooky Sound Machine above plus,
* one or more .mp3 sound files, 
* a copy of this Git repository, 
* some free open-source software (FOSS) detailed below

#### Instructions
##### Overview
In addition to the step-by-step instructions for the Spooky Sound Machine above, you will collect the sound effects you wish to use in a directory and run shufflepad.sh. You will need to install some software dependencies for shufflepad.sh to use (libav, SoX). Then you'll copy your own out.mp3 composed by the script to the RasPi and you're done.

##### Step by step
1. Clone this repository to your computer like `git clone https://github.com/qrkourier/shufflepad-sound-machine.git`
2. Copy your sound effects to the folder named "shufflepad-sound-machine"
3. Use your OS's package manager (or something like homebrew on MacOS) to install libav and SoX which are dependencies of the script below. I did this in Ubuntu Linux with `sudo apt-get install sox libav-tools`
3. In your terminal, change directory to "shufflepad-sound-machine"
4. Execute `bash ./bin/shufflepad.sh` and wait
5. In a few minutes you should see that ./pad/out.mp3 has been created. This is a shuffled compilation of your sounds with random silence between each.
6. Copy out.mp3 to your raspi:/var/tmp/out.mp3 and reboot. You'll hear the first sound in a few seconds.











