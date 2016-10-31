# shufflepad-sound-machine
Continuously play sound effects separated by a random amount dead air

## A Spooky Sound Machine
I wanted to create a spooky ambiance for the front stoop of the house where tricksters and ghouls were expected to appear on Halloween night. I wrote a script to shuffle a directory full of halloween sound effects (e.g., chains rattling, ghosts laughing, etc...) and concatenate them together with an unpredictable delay between each effect to increase the chances of startling my victims.

### Download a copy of the sound effect loop
If you just want the finished product that I used with my Spooky Sound Machine you can download [the .mp3 file](https://dl.dropboxusercontent.com/u/284525/SpookySoundMachine.mp3).

### Make Your Own Spooky Sound Machine
#### Materials
* one or more amplified speaker(s) that can accept a signal from a regular 1/8" headphone jack
* one Raspberry Pi v1
* one SD card at least 8GB in size
* one copy of [the SpookySoundMachine disk image for Raspberry Pi](https://dl.dropboxusercontent.com/u/284525/raspi-miniban-spookysoundmachine.img.gz)

#### Instructions
##### Overview
You will write the disk image to the SD card, insert the card in the RasPi, connect the speaker to the RasPi, and plug in the power to the RasPi. In a few moments you will hear the first sound effect. Of course, the following steps will completely destroy any existing data on your SD card.
##### Step by step
- The disk image is compressed with gzip, so the first step is to decompress. There are many ways to do this depending on the operating systems you have available. 
** I used Ubuntu Linux like this `for sdpart in /dev/mmcblk0p*;do sudo umount $sdpart;done; gunzip < ~/Downloads/raspi-miniban-spookysoundmachine.img.gz | sudo dd of=/dev/mmcblk0`. 
** You will need to modify this depending on where you downloaded the compressed image file and whatever the name of the SD card happens to be on your system. 
** The `for loop` is an attempt to make sure any partitions you may have on your SD card are not mounted, but you should make sure of that. 

## 
one or more .mp3 sound files
- a copy of [my script](https://gist.github.com/qrkourier/09abb1a8dccc0f5ac7ec6345f7ed3053) (shufpad.sh)
-- 
