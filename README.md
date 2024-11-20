ISEmake.shがMacのターミナルで動かすスクリプトでpullscript.shはゲスト上で動かすスクリプトです。


ISEmake.shの中のutmctlでチェックできる項目はチェックして、utmctlではチェックできない項目ゲスト上で動かすスクリプトのpullscript.shでチェックを行っています(例　wiresharkがインストールされているかの確認.


また,Macのパスを参照する行があります。ISEmake.shの80、83はbashrc.txtとpullscript.shがある場所にパスを変更する必要があります。


「utmctl exec Ubuntu24 --cmd ~~」 の"Ubuntu24"の部分は対象とする仮想マシン名にしてください。


多分変更します
