#!/usr/bin/env bash
# check root
get_char()
{
SAVEDSTTY=`stty -g`
stty -echo
stty cbreak
dd if=/dev/tty bs=1 count=1 2> /dev/null
stty -raw
stty echo
stty $SAVEDSTTY
}
# echo
# begin
echo "开始删除云盾，任意键继续"
char=`get_char`
wget http://update.aegis.aliyun.com/download/uninstall.sh
chmod +x uninstall.sh
./uninstall.sh
wget http://update.aegis.aliyun.com/download/quartz_uninstall.sh
chmod +x quartz_uninstall.sh
./quartz_uninstall.sh
echo "删除成功，任意键继续"
char=`get_char`
#removefile
echo "开始清理残留文件，任意键继续"
char=`get_char`
pkill aliyun-service
rm -fr /etc/init.d/agentwatch /usr/sbin/aliyun-service
rm -rf /usr/local/aegis*
echo "清理完成，任意键继续"
char=`get_char`
#iptables
echo "开始屏蔽云盾 ip，任意键继续"
char=`get_char`
iptables -I INPUT -s 140.205.201.0/28 -j DROP
iptables -I INPUT -s 140.205.201.16/29 -j DROP
iptables -I INPUT -s 140.205.201.32/28 -j DROP
iptables -I INPUT -s 140.205.225.192/29 -j DROP
iptables -I INPUT -s 140.205.225.200/30 -j DROP
iptables -I INPUT -s 140.205.225.184/29 -j DROP
iptables -I INPUT -s 140.205.225.183/32 -j DROP
iptables -I INPUT -s 140.205.225.206/32 -j DROP
iptables -I INPUT -s 140.205.225.205/32 -j DROP
iptables -I INPUT -s 140.205.225.195/32 -j DROP
iptables -I INPUT -s 140.205.225.204/32 -j DROP
iptables -I INPUT -s 140.205.201.0/28 -j DROP
iptables -I INPUT -s 140.205.201.16/29 -j DROP
iptables -I INPUT -s 140.205.201.32/28 -j DROP
iptables -I INPUT -s 140.205.225.192/29 -j DROP
iptables -I INPUT -s 140.205.225.200/30 -j DROP
iptables -I INPUT -s 140.205.225.184/29 -j DROP
iptables -I INPUT -s 140.205.225.183/32 -j DROP
iptables -I INPUT -s 140.205.225.206/32 -j DROP
iptables -I INPUT -s 140.205.225.205/32 -j DROP
iptables -I INPUT -s 140.205.225.195/32 -j DROP
iptables -I INPUT -s 140.205.225.204/32 -j DROP
iptables -I INPUT -s 106.11.224.0/26 -j DROP
iptables -I INPUT -s 106.11.224.64/26 -j DROP
iptables -I INPUT -s 106.11.224.128/26 -j DROP
iptables -I INPUT -s 106.11.224.192/26 -j DROP
iptables -I INPUT -s 106.11.222.64/26 -j DROP
iptables -I INPUT -s 106.11.222.128/26 -j DROP
iptables -I INPUT -s 106.11.222.192/26 -j DROP
iptables -I INPUT -s 106.11.223.0/26 -j DROP
echo "云盾已清理，任意键结束"
char=`get_char`
