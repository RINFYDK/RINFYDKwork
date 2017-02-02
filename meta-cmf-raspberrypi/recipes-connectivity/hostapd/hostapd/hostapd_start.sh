wlan0=$(iwconfig wlan0|grep 802.11a)
#echo "output =  $wlan0"
#echo "wlan0=" ${#wlan0}
xxx=${#wlan0}
#echo "xxx="$xxx
killall hostapd
sleep 15
if [ $xxx != 0 ]; then
#	echo "11111111111111"
#echo "wlan0=" ${#wlan0}
	sed -i 's/interface=wlan0/interface=wlan1/g' /etc/hostapd0.conf
	sed -i 's/interface=wlan1/interface=wlan0/g' /etc/hostapd1.conf
	hostapd -B /etc/hostapd0.conf /etc/hostapd1.conf
else
	echo "2222222222222222"
	sed -i 's/interface=wlan1/interface=wlan0/g' /etc/hostapd0.conf 
	sed -i 's/interface=wlan0/interface=wlan1/g' /etc/hostapd1.conf
	wlan=$(iwconfig wlan1)
#	echo "wlan =  $wlan"
	if [ ${#wlan} == 0 ]; then
	echo "3333333333333333"
		hostapd -B /etc/hostapd0.conf
	else
#	echo "444444444444444"
		hostapd -B /etc/hostapd0.conf /etc/hostapd1.conf
	fi
fi
