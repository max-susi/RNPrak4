# erst sicherstellen das alle anderen verbindungen zugelassen werden (zweiter Aufgabenteil)
sudo /usr/sbin/iptables -I INPUT 1 -j ACCEPT
sudo /usr/sbin/iptables -I OUTPUT 1 -j ACCEPT
# anschliesend eingehende tcp Verbindungen durch vorranstellen in der Tabelle verbieten.
sudo /usr/sbin/iptables -I INPUT 1 -d 172.16.1.0/24 -p tcp -m state --state NEW -j DROP