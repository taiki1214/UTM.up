#!/bin/bash
#ネットワーク実験(1)の31で動かすホスト用のスクリプト

#IPアドレスの設定
utmctl exec ISE-net-jikken2 --cmd ip addr add 10.0.0.31/24 dev enp0s1


#空のスクリプトファイルの作成
utmctl exec ISE-net-jikken2 --cmd touch /home/jikken/デスクトップ/test.sh


#結果を記録するテキストファイルの作成
utmctl exec ISE-net-jikken2 --cmd touch /home/jikken/デスクトップ/output.txt


#空のスクリプファイルにスクリプトをコピーする
cat /Users/akilab/Desktop/VMconfig/31_pullnet1.sh | utmctl file push ISE-net-jikken2 /home/jikken/デスクトップ/test.sh


#test.shをゲスト上で動かす
utmctl exec ISE-net-jikken2 --cmd bash /home/jikken/デスクトップ/test.sh;sleep 33
#この処理を終えるとoutput.txtが返ってくる


#ip addr showでIPアドレスが設定されているかの確認
ipShow=$(utmctl file pull ISE-net-jikken2 /home/jikken/デスクトップ/output.txt | awk 'NR==1{print $0}')
if [ "${ipShow}" = "true" ];then
    echo "IPアドレスは設定されています."
    echo "${ipShow}"
else
    echo "IPアドレスは設定されていません."
    echo "${ipShow}"
fi


#ip routeで確認できるか
ipRoute=$(utmctl file pull ISE-net-jikken2 /home/jikken/デスクトップ/output.txt | awk 'NR==2{print $0}')
if [ "${ipRoute}" = "true" ];then
    echo "ip routeで確認できます."
    echo "${ipRoute}"
else
    echo "ip routeで確認できません."
    echo "${ipRoute}"
fi


#pingで確認できるか
ping=$(utmctl file pull ISE-net-jikken2 /home/jikken/デスクトップ/output.txt | awk 'NR==3{print $0}')
if [ "${ping}" = "true" ];then
    echo "pingで確認できます."
    echo "${ping}"
else
    echo "pingで確認できません."
    echo "${ping}"
fi


# #ARPのパケットとWiresharkでキャプチャできるか
# arp=$(utmctl file pull ISE-net-jikken2 /home/jikken/デスクトップ/output.txt | awk 'NR==4{print $0}')
# if [ "${arp}" = "true" ];then
#     echo "ARPのパケットは確認できます."
#     echo "${arp}"
# else
#     echo "ARPのパケットは確認できません."
#     echo "${arp}"
# fi

#いらないファイルの削除
utmctl exec ISE-net-jikken2 --cmd rm /home/jikken/デスクトップ/test.sh
utmctl exec ISE-net-jikken2 --cmd rm /home/jikken/デスクトップ/output.txt
utmctl exec ISE-net-jikken2 --cmd rm /var/tmp/cap_file.cap
utmctl exec ISE-net-jikken2 --cmd rm /home/jikken/aaaa.cap

