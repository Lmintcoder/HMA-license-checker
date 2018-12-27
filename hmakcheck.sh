#!/bin/bash
#Github : https://github.com/Lmintcoder
#Don't Change The Author Or I Will Delete The API
#I'm not responsible for any use of this tools
#Created By Guzz (グッズ)
merah='\e[31m'
ijo='\e[1;32m'
kuning='\e[1;33m'
biru='\e[1;34m'
NC='\e[0m'
checkdepeden(){
	cekdep=$(dpkg -l | grep -o 'curl\|grep' | uniq)
	if [[ ! $cekdep =~ "curl" ]]
	then
		sudo apt install curl -y 2>/dev/null
		#for termux
		apt install curl -y 2>/dev/null
		elif [[ ! $cekdep =~ "grep" ]]
			then
				sudo apt install grep -y 2>/dev/null
				#termux
				apt install grep -y 2>/dev/null
	fi
}
checkdepeden
clear
#intro
printf "${ijo}
	██╗  ██╗███╗   ███╗ █████╗ ██╗
	██║  ██║████╗ ████║██╔══██╗██║
	███████║██╔████╔██║███████║██║
	██╔══██║██║╚██╔╝██║██╔══██║╚═╝
	██║  ██║██║ ╚═╝ ██║██║  ██║██╗
	╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝${biru}
	   HMA License Key Checker
	       Code By : Guzz
	 (https://github.com/Lmintcoder)
"
printf "${kuning}__________________________________________________${NC}\n\n"
printf "${kuning}[+]${NC} Key list File : "; read klist
gen(){
cek=$(curl -s -m 20 "http://nandrbiz1.com/hma.php" -d "key=$key" | grep -Po '(?<=9: ")[^"]*' | sed -n 1p)
if [[ $cek == "" ]]
then
printf "${merah}[DIE]${NC} $key\n"
else
printf "${ijo}[LIVE]${NC} $key [$cek]\n"
echo "$key : $cek" >> hmalicense.txt
fi
}
for key in $(cat $klist)
do
gen
done
printf "\n${ijo}[+]${NC} Live License Key Can Be Found in hmalicense.txt\n"
