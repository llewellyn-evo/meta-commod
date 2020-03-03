#Initialising Reset Line for XBEE
echo 1 > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio1/direction
echo 1 > /sys/class/gpio/gpio1/value


#Initialising OE Line for TXB0108
echo 68 > /sys/class/gpio/export             
echo "out" > /sys/class/gpio/gpio68/direction
echo 1 > /sys/class/gpio/gpio68/value


#Initialising WIFI_RST Line
echo 67 > /sys/class/gpio/export             
echo "out" > /sys/class/gpio/gpio67/direction
echo 0 > /sys/class/gpio/gpio67/value


#Initialising GPS_RST Line
echo 3 > /sys/class/gpio/export             
echo "out" > /sys/class/gpio/gpio3/direction
echo 1 > /sys/class/gpio/gpio3/value


#Initialising PWM for LED Flasher
echo 0 > /sys/class/pwm/pwmchip0/export
echo 3000000000 > /sys/class/pwm/pwmchip0/pwm0/period
echo 100000000 > /sys/class/pwm/pwmchip0/pwm0/duty_cycle
echo 0 > /sys/class/pwm/pwmchip0/pwm0/enable

#Initialising BITE input from Atomic Clock
echo 23 > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio23/direction

#Initialise GPIO for Navigation Lights
echo 0 > /sys/class/pwm/pwmchip1/export
echo 50000000 > /sys/class/pwm/pwmchip1/pwm0/period
echo 100000000 > /sys/class/pwm/pwmchip1/pwm0/duty_cycle
echo 0 > /sys/class/pwm/pwmchip1/pwm0/enable

#Initialise CAN Silent Pin
echo 130 > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio130/direction
echo 0 > /sys/class/gpio/gpio130/value


stty -F /dev/ttymxc6 115200 raw
echo "A" > /dev/ttymxc6