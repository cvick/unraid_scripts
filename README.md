# unRAID Scripts

These are the scripts I use on my unRAID server. Server specs:

* Dell R710
* 2 x Intel Xeon Quad Core L5630 2.13GHz
* 32GB RAM
* PERC H200 RAID controller flashed to IT mode
* 6 x 2TB HDDs, 1 x 512 GB SSD cache drive

The two fan scripts and the LCD script have only been tested on an R710 so I can't guarantee they work on any other Dell server models. They probably won't work at all on non Dell servers.

## Script descriptions

`install_ipmitool.sh`

This script downloads the ipmitool package and installs it.

`fan_static_rpm.sh`

This script sets the 5 fans inside the R710 to 2160 RPM instead of the standard 3600 RPM which results in a significant reduction in noise.

`fan_rpm_temp_check.sh`

This script will check the ambient temperature reading and if it goes over the set limit (in my case I have it set to 27°C (80.6°F)) it will return fan RPM control to dynamic so they can spin up to cool the server down.

`update_lcd_temp_watts.sh`

This script will grab the ambient temperature and current power usage in watts, convert the temperature to fahrenheit, combine the two numbers, and print the resulting string to the server's front LCD.