#!/bin/bash
#
#kasutajate lisamise skript
if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 failinimi"
else
  failinimi=$1 #muidu faili nimi on määramata
  if [ -f $failinimi -a -r $failinimi ]; then
    echo "Fail on korras"
    for rida in $(cat $failinimi)
    do
	#Kui fail on kättesaadav, siis on sisu nähtav ja nüüd echo asemel tuleb
	#kutsuda vajalik skript
      kasutajanimi=$(echo "$rida" | cut -f1 -d:)
      sh lisa_kasutaja.sh $kasutajanimi
      echo "$rida" | chpasswd #antud rida võimaldab kasutajale määrata parooli
    done
  else
    echo "Probleem failiga $failinimi"
  fi
#parameetrite kontrolli lõpp
fi
