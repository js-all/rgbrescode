echo "quit" > finput
kill $(cat pid/server)
kill $(cat pid/py)
kill $(cat pid/tail)
rm finput
