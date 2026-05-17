# node_exporter-script-installer
un script pour installer node exporter sur sa machine 
**compatible et testé seulement sur machine Linux amd64**


Juste un bête script pour installer un node exporter avec : 
- un compte dédié pour le node_exporter
- un fichier systemd pour le démarrer en même temps que la machine
- _des phrases marrantes_


Le script demande des permissions élevées pour : 
- copier un fichier dans /usr/local/bin/
- mettre le fichier systemd pour le node_exporter


Je le mettrais à jour pour les nouvelles versions de node_exporter, pour l'instant j'ai juste fait un script fonctionnel, qui ne vient pas chercher la dernière version automatiquement

_ps : non, je ne suis pas un fan particulier des jeux de chez Nintendo_



## TUTO

sur la machine, nous écrivons 3 commandes : 

wget https://raw.githubusercontent.com/Anto23fr/node_exporter-script-installer/refs/heads/main/script.sh
chmod +x script.sh
./script.sh

_En ayant les bonnes permissions_

resultat : 
<img width="2115" height="1471" alt="image" src="https://github.com/user-attachments/assets/ee6b92ca-87ce-4560-9571-46600dc03dbd" />



futur : 
quelques objectifs pour ce script si un jour j'ai le temps 

- prend automatiquement la dernière version
- prend automatiquement la bonne version pour votre machine
- plus parlant ?
