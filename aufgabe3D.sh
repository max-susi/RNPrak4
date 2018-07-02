# Ping wird per icmp Protokoll uebertragen. Es erwerden alle einkommenden Verbindungen mit dem icmp Protokoll aus dem netzwerk 172.16.1.0/24 verworfen.
sudo /usr/sbin/iptables -I INPUT 1 -s 172.16.1.0/24 -p icmp --icmp-type 8 -j DROP