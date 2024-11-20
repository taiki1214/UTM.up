・Mac上で「$ sudo ln -sf /Applications/UTM.app/Contents/MacOS/utmctl /usr/local/bin/utmctl」でutmctlを使えるようにする


・Ubuntu上で「$ sudo apt install qemu-guest-agent」でインストールし、「$ sudo systemctl start qemu-guest-agent」で起動しておく


・ISEmake.shがMacのターミナルで動かすスクリプトでpullscript.shはゲスト上で動かすスクリプトです。


・ISEmake.shの中のutmctlでチェックできる項目はチェックして、utmctlではチェックできない項目ゲスト上で動かすスクリプトのpullscript.shでチェックを行っています(例　wiresharkがインストールされているかの確認.


・また,Macのパスを参照する行があります。ISEmake.shの80、83はbashrc.txtとpullscript.shがある場所にパスを変更する必要があります。


・「utmctl exec Ubuntu24 --cmd ~~」 の"Ubuntu24"の部分は対象とする仮想マシン名にしてください。


・中身は多分変更します
