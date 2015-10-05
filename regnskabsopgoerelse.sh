#! /bin/bash
EUR2DKK=7.46341366

lejlighed=1299
taxi=`echo 2*27*$EUR2DKK|bc`
ROSconMathias=`echo 1235.07|bc`

#BM: bc kan ikke håndtere /2 så jeg ganger med 0.5 for de delte udgifter
morten_lagtud=`echo 0.5*$lejlighed+0.5*$taxi+$ROSconMathias|bc`
echo "Morten: $morten_lagtud DKK"


tog=`echo 116.00*$EUR2DKK|bc` #taget fra billeten du kan bare indtaste hvad der nu er blevet hævet
mathias_lagtud=`echo 0.5*$tog|bc`
echo "Mathias: $mathias_lagtud DKK"



#Konklussion
if (( $(echo "$morten_lagtud > $mathias_lagtud" |bc -l) ));
then
	echo "Mathias skylder $(echo $morten_lagtud-$mathias_lagtud | bc)"
else
	echo "Morten shylder $(echo $morten_lagtud-$mathias_lagtud | bc)"
fi
