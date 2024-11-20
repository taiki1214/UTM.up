#!/bin/bash

#ubuntu22.04.2LTSがインストールされているかの確認
Ubuntu=$(utmctl exec Ubuntu24 --cmd cat /etc/os-release | awk -F= 'NR==4{gsub(/"/, "", $2); print $2}')
cur_Ubuntu="22.04.2 LTS (Jammy Jellyfish)"
if [ "${Ubuntu}" = "${cur_Ubuntu}" ];then
    echo "ubuntuはインストールされています.${Ubuntu}"
else
    echo "ubuntuはインストールされていません.${Ubuntu}"
fi

#ユーザー名がjikkenになっているか
hostname=$(utmctl exec Ubuntu24 --cmd who -q | awk 'NR==1{print $0}')
cur_hostname="jikken"
if [ "${hostname}" = "${cur_hostname}" ];then
    echo "ユーザー名は正しいです.${hostname}"
else
    echo "ユーザー名は間違っています.${hostname}"
fi


#wiresharkの権限の確認
#capabilityの確認
capability=$(utmctl exec Ubuntu24 --cmd getcap /usr/bin/dumpcap)
cur_capability="/usr/bin/dumpcap cap_net_admin,cap_net_raw=eip"
if [ "${capability}" = "${cur_capability}" ];then
    echo "capabilityは正しく設定されています.${capability}"
else
    echo "capabilityは正しく設定されていません.${capability}"
fi

#dumpcapの権限の確認
dumpcap=$(utmctl exec Ubuntu24 --cmd stat /usr/bin/dumpcap | grep 'Access:' | awk 'NR==1 {print $2}')
cur_dumpcap="(0755/-rwxr-xr-x)"
if [ "${dumpcap}" = "${cur_dumpcap}" ];then
    echo "dumpcapは正しく設定されています.${dumpcap}"
else
    echo "dumpcapは正しく設定されていません.${dumpcap}"
fi

#共有ディレクトリの確認
#Sharedが存在しているか
Shared=$(utmctl exec Ubuntu24 --cmd ls /home/jikken/デスクトップ | grep Shared)
cur_Shared="Shared"
if [ "${Shared}" = "${cur_Shared}" ];then
    echo "Sharedは存在します.${Shared}"
else
    echo "Sharedは存在しません.${Shared}"
fi

#sysctl.confのファイルが書き換えられているか
#net.ipv6.conf.all.disable_ipv6 が設定されているか
ipv6all=$(utmctl exec Ubuntu24 --cmd sysctl net.ipv6.conf.all.disable_ipv6)
cur_ipv6all="net.ipv6.conf.all.disable_ipv6 = 1"
if [ "${ipv6all}" = "${cur_ipv6all}" ];then
    echo "net.ipv6.conf.all.disable_ipv6は正しく設定されています.${ipv6all}"
else
    echo "net.ipv6.conf.all.disable_ipv6は正しく設定されていません.${ipv6all}"
fi

#net.ipv6.conf.default.disable_ipv6 が設定されているか
ipv6default=$(utmctl exec Ubuntu24 --cmd sysctl net.ipv6.conf.default.disable_ipv6)
cur_ipv6default="net.ipv6.conf.default.disable_ipv6 = 1"
if [ "${ipv6default}" = "${cur_ipv6default}" ];then
    echo "net.ipv6.conf.default.disable_ipv6は正しく設定されています.${ipv6default}"
else
    echo "net.ipv6.conf.default.disable_ipv6は正しく設定されていません.${ipv6default}"
fi

#空のスクリプトファイルの作成
utmctl exec Ubuntu24 --cmd touch /home/jikken/デスクトップ/test.sh

#結果を記録するテキストファイルの作成
utmctl exec Ubuntu24 --cmd touch /home/jikken/デスクトップ/output.txt

#共有ディレクトリのテスト用ファイルの作成
utmctl exec Ubuntu24 --cmd touch /home/jikken/デスクトップ/aaa.txt

#.bashrcのファイルの確認用ファイルの作成
cat /Users/akilab/Desktop/VMconfig/bashrc.txt | utmctl file push Ubuntu24 /home/jikken/デスクトップ/bashrc.txt

#空のスクリプファイルにスクリプトをコピーする
cat /Users/akilab/Desktop/VMconfig/pullscript.sh | utmctl file push Ubuntu24 /home/jikken/デスクトップ/test.sh

#test.shをゲスト上で動かす
utmctl exec Ubuntu24 --cmd bash /home/jikken/デスクトップ/test.sh;sleep 3
#この処理を終えるとoutput.txtが返ってくる

#wiresharkがインストールされているか
wireshark=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==1{print $0}')
if [ "${wireshark}" = "true" ];then
    echo "wiresharkはインストールされています."
    echo "${wireshark}"
else
    echo "wiresharkはインストールされていません."
    echo "${wireshark}"
fi


#libwireshark-dataがインストールされているか
libwireshark_data=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==2{print $0}')
if [ "${libwireshark_data}" = "true" ];then
    echo "libwireshark-dataはインストールされています."
    echo "${libwireshark_data}"
else
    echo "libwireshark-dataはインストールされていません."
    echo "${libwireshark_data}"
fi


#libwireshark15がインストールされているか
libwireshark15=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==3{print $0}')
if [ "${libwireshark15}" = "true" ];then
    echo "libwireshark15はインストールされています."
    echo "${libwireshark15}"
else
    echo "libwireshark15はインストールされていません."
    echo "${libwireshark15}"
fi


#wireshark-commonがインストールされているか
wireshark_common=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==4{print $0}')
if [ "${wireshark_common}" = "true" ];then
    echo "wireshark-commonはインストールされています."
    echo "${wireshark_common}"
else
    echo "wireshark-commonはインストールされていません."
    echo "${wireshark_common}"
fi


#wireshark-qtがインストールされているか
wireshark_qt=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==5{print $0}')
if [ "${wireshark_qt}" = "true" ];then
    echo "wireshark-qtはインストールされています."
    echo "${wireshark_qt}"
else
    echo "wireshark-qtはインストールされていません."
    echo "${wireshark_qt}"
fi


#tracerouteがインストールされているか
traceroute=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==6{print $0}')
if [ "${traceroute}" = "true" ];then
    echo "tracerouteはインストールされています."
    echo "${traceroute}"
else
    echo "tracerouteはインストールされていません."
    echo "${traceroute}"
fi


#openssh-serverがインストールされているか
openssh=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==7{print $0}')
if [ "${openssh}" = "true" ];then
    echo "openssh-serverはインストールされています."
    echo "${openssh}"
else
    echo "openssh-serverはインストールされていません."
    echo "${openssh}"
fi


#gnome-screenshotがインストールされているか
gnome=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==8{print $0}')
if [ "${gnome}" = "true" ];then
    echo "gnome-screenshotはインストールされています."
    echo "${gnome}"
else
    echo "gnome-screenshotはインストールされていません."
    echo "${gnome}"
fi

#cupsがアンインストールされているか
cups=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==9{print $0}')
if [ "${cups}" = "true" ];then
    echo "cupsはインストールされていません."
    echo "${cups}"
else
    echo "cupsはインストールされています."
    echo "${cups}"
fi

#cups.serviceが無効化されているか
cupsservice=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==10{print $0}')
if [ "${cupsservice}" = "true" ];then
    echo "cups.serviceは無効化されています."
    echo "${cupsservice}"
else
    echo "cups.serviceは無効化されていません."
    echo "${cupsservice}"
fi


#cups-browsed.serviceが無効化されているか
cupsbrowsed=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==11{print $0}')
if [ "${cupsbrowsed}" = "true" ];then
    echo "cups-browsed.serviceは無効化されています."
    echo "${cupsbrowsed}"
else
    echo "cups-browsed.serviceは無効化されていません."
    echo "${cupsbrowsed}"
fi

#avahi-daemonが消えているか
avahi_daemon=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==12{print $0}')
if [ "${avahi_daemon}" = "true" ];then
    echo "avahi-daemonインストールされていません."
    echo "${avahi_daemon}"
else
    echo "avahi-daemonはインストールされています."
    echo "${avahi_daemon}"
fi

#systemd-networkdが使用されているか
systemd_networkd=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==13{print $0}')
if [ "${systemd_networkd}" = "true" ];then
    echo "systemd-networkdは有効化されています."
    echo "${systemd_networkd}"
else
    echo "systemd-networkdは有効化されていません."
    echo "${systemd_networkd}"
fi

#tracerouteが使用できるか
traceroute=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==14{print $0}')
if [ "${traceroute}" = "true" ];then
    echo "tracerouteは使用できます."
    echo "${traceroute}"
else
    echo "tracerouteは使用できません."
    echo "${traceroute}"
fi

#dhcpが無効化されているか
dhcp=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==15{print $0}')
if [ "${dhcp}" = "true" ];then
    echo "dhcpは無効化されています."
    echo "${dhcp}"
else
    echo "dhcpは無効化されていません."
    echo "${dhcp}"
fi

#共有ディレクトリへファイルをコピーできるか
cpfile=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==16{print $0}')
if [ "${cpfile}" = "true" ];then
    echo "ファイルをコピーできます."
    echo "${cpfile}"
else
    echo "ファイルをコピーできません."
    echo "${cpfile}"
fi

#共有ディレクトリへファイルを移動できるか
mvfile=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==17{print $0}')
if [ "${mvfile}" = "true" ];then
    echo "ファイルを移動できます."
    echo "${mvfile}"
else
    echo "ファイルを移動できません."
    echo "${mvfile}"
fi

#fstabが書き換えられているか
fstab=$(utmctl exec Ubuntu24 --cmd cat /etc/fstab | grep share)
if [ "${fstab}" = "share	/home/jikken/デスクトップ/Shared	9p	trans=virtio,version=9p2000.L,rw,_netdev,nofail	0	0" ];then
    echo "fstabは書き換えられています."
    echo "${fstab}"
else
    echo "fstabは書き換えられていません."
    echo "${fstab}"
fi

#言語サポートで日本語がインストールされているか
language=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==18{print $0}')
if [ "${language}" = "true" ];then
    echo "日本語はインストールされています."
    echo "${language}"
else
    echo "日本語はインストールされていません."
    echo "${language}"
fi

#.bashrcが適切に設定されているか
bashrc=$(utmctl file pull Ubuntu24 /home/jikken/デスクトップ/output.txt | awk 'NR==19{print $0}')
if [ "${bashrc}" = "true" ];then
    echo ".bashrcは適切に設定されています."
    echo "${bashrc}"
else
    echo ".bashrcは適切に設定されていません."
    echo "${bashrc}"
fi


#ゲスト上の不要なファイルを削除する
utmctl exec Ubuntu24 --cmd rm /home/jikken/デスクトップ/test.sh
utmctl exec Ubuntu24 --cmd rm /home/jikken/デスクトップ/output.txt
utmctl exec Ubuntu24 --cmd rm /home/jikken/デスクトップ/Shared/aaa.txt
utmctl exec Ubuntu24 --cmd rm /home/jikken/デスクトップ/bashrc.txt


#ゲスト上に不要なファイルが残っていないかの確認
exfile=$(utmctl exec Ubuntu24 --cmd ls /home/jikken/デスクトップ | grep txt && utmctl exec Ubuntu24 --cmd ls /home/jikken/デスクトップ | grep sh )
if [ "${exfile}" = "" ];then
    echo "不要なファイルは削除されています."
    echo "${exfile}"
else
    echo "不要なファイルは削除されていません."
    echo "${exfile}"
fi