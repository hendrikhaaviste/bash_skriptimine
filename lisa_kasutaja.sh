#!/bin/bash
#
#kasutaja lisamise skript
#
#Skript lisab antud nimega kasutaja süsteemi ning loob vastava sisuga kodukataloogi
#
#Kasutusjuhend, kui midagi valesti käivitub või unustab kasutajanime edasi anda käsurea
#kaudu parameetrite arv on $# sees olev number, meie korral 1 parameeter,
#kui parameeter pole lisatud tuleb juhendada kasutajat
if [ $# -ne 1 ]; then
	echo "Kasutusjuhend: $0 kasutajanimi"
else
 #defineerime vajaliku muutuja kasutajanime salvestamiseks
 #kuna andmed edastatakse käsurealt skripti parameetrina, siis need on $1 $2 jne
 #kasutajanimi on esimene parameeter, seega tuleb kasutada $1 muutujat
  kasutajanimi=$1
 #kasutame kasutaja lisamise käsku vajaliku võtmetega
  useradd $kasutajanimi -m -s /bin/bash
  kasu_tulemus=$?
 #kontrollime, kas käsu tulemus on korras
 #$? - viimase käsu väljund staatus, 0 kui korras, muu on probleem
  if [ $kasu_tulemus -eq 0 ]; then
    echo "Kasutaja nimega $kasutajanimi on lisatud süsteemi"
    cat /etc/passwd | grep $kasutajanimi
    ls -la /home/$kasutajanimi
  else
    echo "Probleem kasutaja $kasutajanimi lisamisega"
    echo "Probleemi kood on $kasu_tulemus"
  fi
#skripti õige kasutamise kontrolli lõpp
fi
