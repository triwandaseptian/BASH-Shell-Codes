# Simple Scripts Monitoring using bash script v.1
# code and modified by twster

#color
green='\e[0;32m'
redbold='\e[1;31m'
#users
user=$(whoami)
echo -e $green"[+] User Online : " $redbold $user
# os type
os=$(uname -o)
echo -e $green"[+] Operating System : "$redbold $os
# Machine Hardware
machinehardware=$(uname -m)
echo -e $green"[+] Architecture : "$redbold $machinehardware
# network node hostname
nodename=$(uname -n)
echo -e $green"[+] Hostname : "$redbold $nodename
# kernel release
kernelrelease=$(uname -r)
echo -e $green"[+] Kernel Release : "$redbold $kernelrelease
# kernel version
kernelversion=$(uname -v)
echo -e $green"[+] Kernel Version : "$redbold $kernelversion
# OS Release
cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > /tmp/osnameversion
echo -n -e $green"[+] OS Name : "$redbold  && cat /tmp/osnameversion | grep -v "VERSION" | cut -f2 -d\"
echo -n -e $green"[+] OS Version : "$redbold  && cat /tmp/osnameversion | grep -v "NAME" | cut -f2 -d\"
#OS Homepage
cat /etc/os-release | grep 'HOME_URL' > /tmp/oshomepage
echo -n -e $green"[+] OS Homepage : "$redbold  && cat /tmp/oshomepage | cut -f2 -d\"
# internal IP
internalip=$(hostname -I)
echo -e $green"[+] Internal IP : "$redbold $internalip
#external IP
externalip=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//';echo)
echo -e $green"[+] External IP : "$redbold $externalip
#memoriinfo
cat /proc/meminfo | grep 'MemTotal\|MemFree\|MemAvailable' > /tmp/meminfo
echo -n -e $green"[+] Memori Total : "$redbold && cat /tmp/meminfo | grep -v "MemFree" | grep -v "MemAvailable" | cut -c18-
echo -n -e $green"[+] Memori Free : "$redbold && cat /tmp/meminfo | grep -v "MemTotal" | grep -v "MemAvailable" | cut -c18-
echo -n -e $green"[+] Memori Available : "$redbold && cat /tmp/meminfo | grep -v "MemTotal" | grep -v "MemFree" | cut -c18-

