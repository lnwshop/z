#!/bin/bash
#By Sakariya
echo "
=============================================
 credit : Dev By ADMIN SP-NET
 Facebook : https://www.facebook.com/profile.php?id=100009782145678 
 Line     : http://line.me/ti/p/Tr8OCQghLc
 Wallet   : 0951911696
 ============================================="
echo -e "         \033[1;33mRemover Usuarios Expirados\033[0m"
datahoje=$(date +%s)
for user in $(cat /etc/passwd |grep -v "nobody" |awk -F : '$3 > 900 {print $1}')
do
dataexp=$(chage -l $user |grep "Account expires" |awk -F : '{print $2}')
if [[ $dataexp == ' never' ]]; then
id > /dev/null 2>/dev/null
else
dataexpn=$(date -d"$dataexp" '+%d/%m/%Y')
dataexpnum=$(date '+%s' -d"$dataexp")
fi
if [[ $dataexpnum < $datahoje ]]; then
printf "\033[1;33m"
printf '%-41s' $user
printf "\033[0m"
printf "\033[1;31m"
echo "Expired Deleted"
kill $(ps -u $user |awk '{print $1}') >/dev/null 2>/dev/null ; userdel $user
else
printf "\033[1;36m"
printf '%-41s' $user
printf "\033[0m"
printf "\033[1;32m"
echo $dataexpn
fi
done
echo -e "\033[1;32m"

