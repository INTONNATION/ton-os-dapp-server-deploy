
## Description

Tons OS Dapp server installation.

## System requirements

<table>
  <tr>
   <td><strong>Configuration</strong>
   </td>
   <td><strong>CPU (cores)</strong>
   </td>
   <td><strong>RAM (GiB)</strong>
   </td>
   <td><strong>Storage (GiB)</strong>
   </td>
   <td><strong>Network (Gbit/s)</strong>
   </td>
   </td>
   <td><strong>OS</strong>
   </td>
  </tr>
  <tr>
   <td>Recommended
   </td>
   <td>24
   </td>
   <td>192
   </td>
   <td>2000
   </td>
   </td>
   <td>Ubuntu 20.04 LTS
   </td>
   <td>1
   </td>
  </tr>
</table>

## Prerequisites

1. 1 server with public IP address
2. Public DNS A entry for DApp server pointed to server Public IP (A entry should be specified in DAPP_HOST variable): 
3. Ansible installed. Required version - 2.9.6

## Quick start

1. Clone repository and navigate to ansible directory:
```
git clone https://github.com/INTONNATION/ton-os-dapp-server-deploy 
cd ansible
```
2. Configure variables in ansible/group_vars/dappserver.
3. For remote installation using ssh key specify remote server ip or hostname in hosts file:
```
[dappserver]
131.17.89.33
```
and run:
```
ansible-playbook -u root -i hosts --private-key <path to SSH private key> run.yml -t install
```
4. For local installation add "localhost ansible_connection=local" to hosts file:
```
[dappserver]
localhost ansible_connection=local
```
and run:
```
ansible-playbook -u root -i hosts run.yml -t install
```

## TONOS CLI examples

To configure tonos-cli to use your DApps Server endpoint you can use this command:
```
tonos-cli config --url http://<DAPP_HOST>
```
This command will create tonlabs-cli.conf.json in the current directory. Then you are ready to use your Dapp server. 

## Technology stack

*   **Ansible** - tool which automates all configuration
*   **Docker** - builds images and hosts TON-OS-DApp-Server containers
*   **Gelf** - logging driver is a convenient format that is understood by a number of tools
*   **Docker-compose** - describes TON-OS-DApp-Server 
*   **ELK** - collects logs from all the Docker containers
*   **Prometheus** - scrapes metrics from TON-OS-DApp-Server components
*   **Prom-exporters** - expose metrics which prometheus collect (q-server,ton-node,arangodb,etc)
*   **Alertmanager** - responsible for alerts and notifications
*   **Alertmanager-bot** - application which receive web-hook and send alerts to Telegram

## Maintainers

INTONNATION team - [Telegram chat](https://t.me/intonnationpub)
