#!/bin/bash
#ネットワーク実験(1)の31で動かすゲスト用のスクリプト

#IPアドレスが設定されているかの確認
a=$(ip addr show | grep enp0s1 | awk 'NR==2{print $2}')
if [ "$a" = "10.0.0.31/24" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$a"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$a"
fi


#ip routeで確認できるか
b=$(ip route)
if [ "$b" != "" ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$b"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$b"
fi


#pingで確認できるか
c=$( ping -c 1 10.0.0.32 | grep received | awk '{print $4}')
if [ "$c" = 1 ]; then
 echo "true" >> /home/jikken/デスクトップ/output.txt
 echo "$c"
else
 echo "false" >> /home/jikken/デスクトップ/output.txt
 echo "$c"
fi;1



# #ARPテーブルのクリア
# ip neigh del 10.0.0.32 dev enp0s1;sleep 1


# # #tcmdumpでのキャプチャ開始
# # tcpdump -i enp0s1 -e arp -c 4 -w /var/tmp/aaa.cap;sleep 5 & 


# # # #pingの確認
# # ping -c 20 10.0.0.32 >/dev/null;sleep 22


# # #Broadcastが送られているか
# # d=$(sudo tcpdump -r /var/tmp/aaa.cap -e 2</dev/null | grep Broadcast | awk '{gsub(/,/, ""); print $6}')
# # if [ "$d" = "Broadcast" ]; then
# #  echo "true" >> /home/jikken/デスクトップ/output.txt
# #  echo "$d"
# # else
# #  echo "false" >> /home/jikken/デスクトップ/output.txt
# #  echo "$d"
# # fi;sleep 1








# #tsharkでのキャプチャ開始
# tshark -i enp0s1 -f "arp" -c 4 -w /var/tmp/cap_file.cap;sleep 5 &


# #pingの確認
# ping -c 10 10.0.0.32 >/dev/null;sleep 10


# #Broadcastが送られているか
# d=$(sudo tshark -r /var/tmp/cap_file.cap 2</dev/null | awk 'NR==1{print $5}')
# if [ "$d" = "Broadcast" ]; then
#  echo "true" >> /home/jikken/デスクトップ/output.txt
#  echo "$d"
# else
#  echo "false" >> /home/jikken/デスクトップ/output.txt
#  echo "$d"
# fi;sleep 1








# #wireshark\u3067\u30ad\u30e3\u30d7\u30c1\u30e3\u3067\u304d\u308b\u304b
# #ARP\u306e\u30d1\u30b1\u30c3\u30c8\u3092\u53d6\u5f97\u3067\u304d\u308b\u304b
# # t1="c2:00:00:10:15:31 \u2192 c2:00:00:10:15:32 ARP 10.0.0.31 is at c2:00:00:10:15:31"
# # t2="c2:00:00:10:15:31 \u2192 c2:00:00:10:15:32 ARP Who has 10.0.0.32? Tell 10.0.0.31"
# # t3="c2:00:00:10:15:32 \u2192 c2:00:00:10:15:31 ARP 10.0.0.32 is at c2:00:00:10:15:32"
# # t4="c2:00:00:10:15:32 \u2192 c2:00:00:10:15:31 ARP Who has 10.0.0.31? Tell 10.0.0.32"

# # t_array=("$t1""$t2""$t3""$t4")

# # echo "${t_array[*]}"

# # t_line=()

# # w1=$(tshark -r /var/tmp/cap_file.cap 2>/dev/null | grep c2 | sortawk '{print $3,$4,$5,$6,$8,$9,$10,$11,$12}')"
# # w2="c2:00:00:10:15:31 \u2192 c2:00:00:10:15:32 ARP Who has 10.0.0.32? Tell 10.0.0.31"
# # w3="c2:00:00:10:15:32 \u2192 c2:00:00:10:15:31 ARP 10.0.0.32 is at c2:00:00:10:15:32"
# # w4="c2:00:00:10:15:32 \u2192 c2:00:00:10:15:31 ARP Who has 10.0.0.31? Tell 10.0.0.32"
# # while IFS= read -r line; do
# #     t_line+=("$line")
# # done < <(tshark -r /var/tmp/cap_file.cap 2>/dev/null | grep c2 | awk '{print $3,$4,$5,$6,$8,$9,$10,$11,$12}' | sort)

# # if [[ "${t_array[*]}" == "${t_line[*]}" ]]; then
# #     echo "true" >> /home/jikken/\u30c7\u30b9\u30af\u30c8\u30c3\u30d7/output.txt
# # else
# #     echo "false" >> /home/jikken/\u30c7\u30b9\u30af\u30c8\u30c3\u30d7/output.txt
# # fi

# # echo "${t_line[*]}"
# # sleep 20