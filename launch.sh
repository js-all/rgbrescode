break1=0
while ((break1 != 1)); do
	openrgb --server &> server.logs 2>&1 &
	echo $! > pid/server
	break2=0
	while ((break2 != 1)); do
		sleep 0.5
		grep "Server failed to start" server.logs
		if [ $? = 0 ]; then
			break2=1	
		fi
		lsof -i :6742 -S > /dev/null
		if [ $? = 0 ]; then
			break2=1
			break1=1
		fi
	done
done
sleep 1
if [ -e finput ]; then
	rm finput
fi
mkfifo finput
# cat > finput &
# echo $! > pid/cat
tail -f finput | python3.9 -u main.py 2>&1 | tee pyd.logs &
#tail -f finput > >(python3.9 main.py &> pyd.logs) &
echo $! > pid/py
jobs -x echo %2 > pid/tail
