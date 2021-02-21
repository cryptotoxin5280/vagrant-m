# Vagrant-M
I created this set of Vagrant-driven DevOps scripts to help me quickly spin up development VMs on my personal workstations. I'm sharing it in the hopes it may help save others as much time as it has me.

Enjoy! :-)

-Mikayla (the 'M' in Vagrant-M)

---

## Script Features
* The Vagrant config contains 2 Ubuntu 18.04 VMs (Argo and Yamato*)
  * _Yamato VM is disabled in the config by default._

* The VMs are connected to the host and with each other via private network.
    * argo.gundam.local
    * yamato.gundam.local

* The host machine's host file is automatically updated with the aliases of the VMs.
 * _The user must install the Vagrant plug-ins as indicated in the pre-requisites._

* The host machine's SSH keys are automatically copied onto the VMs.
  * _This allows the VMs to access Git repos with the same SSH keys as the host._

* Ansible is automatically installed into both VMs.

* Git repos can be configured to automatically clone onto both VMs.
  * _This is done via Ansible playbook._

* The scripts will work on both Windows and Linux.

_* Yamato and Argo are references to the 1970's anime, [Space Battleship Yamato](https://en.wikipedia.org/wiki/Space_Battleship_Yamato)._

---

## Future Features (Coming Soon)
* Container support (podman)
* X-Server support
* Ability to run the Vagrantfile from anywhere

---

## Pre-Requisites

### Vagrant
Vagrant can be installed via one of the following methods.

#### Windows
[https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_x86_64.msi](https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_x86_64.msi)

#### Ubuntu Linux
```
sudo apt-get install vagrant
```

### SSH Key-Pair
An SSH key-pair is required to take advantage of the 'Clone Git Repo' Playbook. An SSH keypair can be generated with the following terminal commands.

#### Windows Command
```
ssh-keygen
```

#### Linux Command
```
ssh-keygen
```

### Vagrant Plug-Ins
Install some recommended Vagrant plug-ins with the following script.

#### Windows
```
scripts/install-vagrant-plugins.bat
```

#### Linux
```
scripts/install-vagrant-plugins.sh
```

---

## Installation
Download this repo into a Windows or Ubuntu user's home directory.

## Configuration
### Provisioning Ansible Playbook
Edit the 'playbooks/provision.yml' with the URL for your Git repo. _Follow the existing model and append the playbook with additional repos as required._

### Multiple VMs
A second VM is commented out in the Vagrantfile but can be easily commented back in. _Follow the model to add additional VMs to the configuration as needed._

---

## Usage
1. Open a terminal window.
2. Change into the root directory of the downloaded repo.
3. Launch Vagrant with the following command:
```
vagrant up
```
4. SSH into the Ubuntu VMs.
```
vagrant ssh [VM name (Argo or Yamato or other VM)]
```
5. The VMs can be accessed directly via any other terminal clients (SSH, PuTTY, etc.) with the following credentials:
```
login: vagrant
password: vagrant
```
