SUMMARY = "Versatile implementation of the Network Time Protocol"
DESCRIPTION = "Chrony can synchronize the system clock with NTP \
servers, reference clocks (e.g. GPS receiver), and manual input using \
wristwatch and keyboard. It can also operate as an NTPv4 (RFC 5905) \
server and peer to provide a time service to other computers in the \
network. \
\
It is designed to perform well in a wide range of conditions, \
including intermittent network connections, heavily congested \
networks, changing temperatures (ordinary computer clocks are \
sensitive to temperature), and systems that do not run continuously, or \
run on a virtual machine. \
\
Typical accuracy between two machines on a LAN is in tens, or a few \
hundreds, of microseconds; over the Internet, accuracy is typically \
within a few milliseconds. With a good hardware reference clock \
sub-microsecond accuracy is possible. \
\
Two programs are included in chrony: chronyd is a daemon that can be \
started at boot time and chronyc is a command-line interface program \
which can be used to monitor chronyd's performance and to change \
various operating parameters whilst it is running. \
\
This recipe produces two binary packages: 'chrony' which contains chronyd, \
the configuration file and the init script, and 'chronyc' which contains \
the client program only."


FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://chrony.conf \
"
