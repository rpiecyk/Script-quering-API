## Dockerized script quering macaddress.io for Company Name

This repository was created for the purpose of getting **company name** via https://macaddress.io/ web page by providing device **MAC address** to the script.

##### Security

For safety purpose it is worth to considered  making  docker to run in the rootless mode or to use port mapping in the future - in case of eventual breach into container. It allows for possibility of escaping namespace into the docker's host. Whereas container should run for an instance it is a good practice.
It is also recommended to add some Mandatory Access Control rules with use of AppArmor or SELinux.
As of now due to time constrains this functionality **will be skipped**.

In case of passing parameters such as **token** to the dockerfile it is recommended to use external file or vault.
It allows to avoid passing confidential data in a clear text which for example could be looked up in filesystem (ps) after eventual container breach.
In this case external file has been used.

##### Usage

Script **modify_token.sh** allows for provided token to be stored in the **env_file** file.
By default **env_file** is empty and ***it is mandatory*** to add the needed token ***before*** executing the dockerfile.

`./modify_token.sh ${YOUR_TOKEN}`

To run dockerized script use **init.sh** script:

`./init.sh ${MAC-ADDRESS}`
