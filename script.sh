#!/bin/bash

link=https://github.com/prometheus/node_exporter/releases/download/v1.11.1/node_exporter-1.11.1.linux-amd64.tar.gz
zelda=${link##*/}
mipha=${zelda%.tar.gz}
terrako=node_exporter

touch test
mv test /usr/local/bin/test 2>/dev/null
if [ $? -ne 0 ]; then
    echo "I don't have permission to make the suite of install."
    echo "I'm stop the script, sorry."
    rm test
else
    echo -e "\e[33mI start the script.\e[0m"
    rm /usr/local/bin/test
    sleep 3
    echo -e "\e[33mI download.\e[0m" $zelda
    wget $link 
    tar -xzf $zelda
    rm $zelda
    echo -e "\e[33mI wish you read the license file before, because, I remove this file to win a space storage\e[0m"
    echo -e "\e[33mmake directory for the node_exporter file\e[0m"
    mkdir /usr/local/bin/node_exporter
    mv $mipha/$terrako /usr/local/bin/node_exporter
    rm -rf $mipha
    echo -e "\e[33mcreate user for the node_exporter\e[0m"
    /usr/sbin/useradd --no-create-home node_exporter_$HOSTNAME
    echo -e "\e[33mcreate the systemd file for start the node_exporter\e[0m"
    echo "[Unit]
Description=node_Exporter
After=network.target

[Service]
User=node_exporter_$HOSTNAME
Group=node_exporter_$HOSTNAME
ExecStart=/usr/local/bin/node_exporter/node_exporter
Restart=on-failure

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/node_exporter.service
    echo "see the result, it's work !"
    systemctl daemon-reload
    systemctl enable node_exporter
    systemctl start node_exporter
fi
