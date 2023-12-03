

#!/bin/bash

# 192.168.0.2 es la ip local. Cambiela para evitar el proxy.
no_proxy=»localhost,192.168.0.2,sld.cu»

rm -rv /var/www/html/ftp/ANTIVIRUS/act/upda*
rm -rv /var/www/html/ftp/ANTIVIRUS/act/var

date> $HOME/update-nod-fecha-ultima.txt

# En .rar de infomed
wget -T 50 -t 50 http://ftp.sld.cu/pub/antivirus/nod32/actualizaciones/update/update.rar -O /var/www/html/ftp/ANTIVIRUS/act/update.rar

# En .zip de uclv
#wget -T 50 -t 50 http://antivirus.uclv.edu.cu/update/nod32/eset_upd.x32.x64-uclv.zip -O /var/www/html/ftp/ANTIVIRUS/act/update.zip

#Cambiar propietario de carpeta al usuario seguro o equivalente
# para que pueda escribir en la carpeta.
chown -R seguro.seguro /var/www/html/ftp/ANTIVIRUS/act
cd /var/www/html/ftp/ANTIVIRUS/act/

rm -rv ./update

# SI esta en .rar descomentar.
unrar x ./update.rar

#——————-Lineas para uclv

#rm -rv ./var
#unzip -e ./update.zip
#mv -vf ./var/www/antivirus/update/nod32/eset_updvall ./update
#rm -rv ./var

#——————————————–
