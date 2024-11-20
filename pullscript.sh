#!/bin/bash
#ゲスト上で動かすスクリプト
#rootからjikkenへ変更させる
su jikken

#wireshark
a=$(apt list --installed 2>/dev/null | grep wireshark/)
if [ "$a" != "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$a"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$a"
fi


#libwireshark-data
b=$(apt list --installed 2>/dev/null | grep libwireshark-data)
if [ "$b" != "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$b"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$b"
fi


#libwireshark15
c=$(apt list --installed 2>/dev/null | grep libwireshark15)
if [ "$c" != "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$c"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$c"
fi


#wireshark-common
d=$(apt list --installed 2>/dev/null | grep wireshark-common)
if [ "$d" != "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$d"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$d"
fi


#wireshark-qt
e=$(apt list --installed 2>/dev/null | grep wireshark-qt)
if [ "$e" != "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$e"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$e"
fi


#traceroute
f=$(apt list --installed 2>/dev/null | grep traceroute)
if [ "$f" != "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$f"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$f"
fi


#openssh-server
g=$(apt list --installed 2>/dev/null | grep openssh-server)
if [ "$g" != "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$g"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$g"
fi


#gnome-screenshot
h=$(apt list --installed 2>/dev/null | grep gnome-screenshot)
if [ "$h" != "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$h"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$h"
fi


#cups
i=$(apt list --installed 2>/dev/null | grep cups/jammy-security)
if [ "$i" = "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$i"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$i"
fi


#cups.service
j=$(systetmctl status cups.service | grep Active | awk '{print $2}')
if [ "$j" != "active" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$j"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$j"
fi


#cups-browsed.service
k=$(systemctl status cups-browsed.service | grep Active | awk '{print $2}')
if [ "$k" != "active" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$k"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$k"
fi

#avahi-daemon
l=$(apt list --installed 2>/dev/null| grep avahi-daemon)
if [ "$l" = "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$l"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$l"
fi

#systemd-networkd
m=$(systemctl status systemd-networkd | grep Active | awk '{print $2}')
if [ "$m" = "active" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$m"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$m"
fi

#traceroute
n=$(traceroute localhost | awk 'NR==2{print $2}')
if [ "$n" = "localhost" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$n"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$n"
fi

#dhcp
o=$(ip addr show enp0s1 | awk 'NR==3{print $0}')
if [ "$o" = "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$o"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$o"
fi

#cpfile
cp /home/jikken/デスクトップ/aaa.txt /home/jikken/デスクトップ/Shared
p=$(ls /home/jikken/デスクトップ/Shared)
if [ "$p" = "aaa.txt" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$p"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$p"
fi
rm /home/jikken/デスクトップ/Shared/aaa.txt

#mvfile
mv /home/jikken/デスクトップ/aaa.txt /home/jikken/デスクトップ/Shared
q=$(ls /home/jikken/デスクトップ/Shared)
if [ "$q" = "aaa.txt" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$q"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$q"
fi

#language
r=$(echo $LANG)
if [ "$r" = "ja_JP.UTF-8" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$r"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$r"
fi

#.bashrc
s=$(diff -c /home/jikken/.bashrc /home/jikken/デスクトップ/bashrc.txt)
if [ "$s" = "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$s"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$s"
fi

# #root
# s=$(whoami)
# if [ "$s" = "jikken" ]; then
#  echo "true" >> /home/jikken/デスクトップ/output.txt
#  echo "$s" >>  /home/jikken/デスクトップ/output.txt
# else
#  echo "false" >> /home/jikken/デスクトップ/output.txt
#  echo "$s" >>/home/jikken/デスクトップ/output.txt
# fi

#.bashrc
# s=$(diff -c .bashrc /home/jikken/デスクトップ/bashrc.txt)
# if [ "$s" = "" ]; then
#  echo "true" >> /home/jikken/デスクトップ/output.txt
#  echo "$s"
# else
#  echo "false" >> /home/jikken/デスクトップ/output.txt
#  echo "$s"
# fi

# #password
# s=$(cat /etc/shadow | grep jikken | awk -F: '{print $2}')
# if [ "$s" = "\$y\$j9T\$DP86gTimmZhYywmoaZNW.0\$w/w0HIRcHRAqfuAXit03QSIQcujPnNcYDQE6l5X6KtD" ]; then
#  echo "true" >> /home/jikken/デスクトップ/output.txt
#  echo "$s"
# else
#  echo "false" >> /home/jikken/デスクトップ/output.txt
#  echo "$s"
# fi

# #history
# HISTFILESIZE=0
# t=$(history | awk 'NR==1{print $0}')
# if [ "$t" = "" ]; then
#  echo "true" >> /home/jikken/デスクトップ/output.txt
#  echo "$t"
# else
#  echo "false" >> /home/jikken/デスクトップ/output.txt
#  echo "$t"
# fi
