# Erst aufgabe3a.sh ausführen, damit alles über das Netz blockiert wird.
# Anschliesend die Regel die für input und output für port 51000 voranstellen. 
./aufgabe3A.sh
sudo /usr/sbin/iptables -I INPUT 1 -s 172.16.1.0/24 -p tcp --dport 51000 -j ACCEPT
sudo /usr/sbin/iptables -I OUTPUT 1 -d 172.16.1.0/24 -p tcp --sport 51000 -j ACCEPT
