# Sucht in den input und output tabellen ob bereits einträge für die ip bestehen. (Warum? Da in der HAW default config schon Regeln dazu bestehen und man so duplikate spart)
# Wenn ja, dann werden diese ersetzt.
# Wenn nein, werden neue Einträge an Position 1 eingefügt. (Damit keine andere Regel ggf. vorgreifen kann)
linenumberIN=$(sudo /usr/sbin/iptables -L INPUT --line-numbers| grep 172.16.1.0/24 | cut -d ' ' -f1)
echo "linenumber input: " $linenumberIN
if [[ -z $linenumberIN ]] ; then
    sudo /usr/sbin/iptables -I INPUT 1 -s 172.16.1.0/24 -j DROP
else 
    sudo /usr/sbin/iptables -R INPUT $linenumberIN -s 172.16.1.0/24 -j DROP
fi

linenumberOUT=$(sudo /usr/sbin/iptables -L OUTPUT --line-numbers| grep 172.16.1.0/24 | cut -d ' ' -f1)
echo "linenumber output: " $linenumberOUT
if [[ -z $linenumberOUT ]] ; then
    sudo /usr/sbin/iptables -I OUTPUT 1 -s 172.16.1.0/24 -j DROP
else    
    sudo /usr/sbin/iptables -R OUTPUT $linenumberOUT -d 172.16.1.0/24 -j DROP
fi