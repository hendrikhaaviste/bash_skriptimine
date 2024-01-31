#!/bin/bash
#
#kasutajate lisamise skript
if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 failinimi"
else
  failinimi=$1 #muidu faili nimi on määramata
  if [ -f $failinimi -a -r $failinimi ]; then
    echo "Fail on korras"
    for nimi in $(cat $failinimi)
    do
	#Kui fail on kättesaadav, siis on sisu nähtav ja nüüd echo asemel tuleb
	#kutsuda vajalik skript
	#echo $nimi
      sh lisa_kasutaja.sh $nimi #sellega laseme lisa_kasutaja skripti tööle
    done
  else
    echo "Probleem failiga $failinimi"
  fi
#parameetrite kontrolli lõpp
fi
