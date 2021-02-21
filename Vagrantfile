Vagrant.configure(2) do |config|

  # Common Config (Applies to ALL VMs)
  # config.vm.network "public_network"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provider "hyperv"
  # config.ssh.forward_agent = true
  
 
  # Disable StrictHostKeyChecking
  config.vm.provision :shell,
    inline: "echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config"
 
  # Copy SSH keypair
  config.vm.provision :file,
    source: "../.ssh/id_rsa",
	destination: ".ssh/id_rsa"
  config.vm.provision :file,
    source: "../.ssh/id_rsa.pub",
	destination: ".ssh/id_rsa.pub"
  config.vm.provision :shell,
	inline: "sudo chmod 600 .ssh/id_rsa"
  
  # Install Ansible & Run Provisioning Playbook
  config.vm.provision :shell, inline: "sudo apt-get update"
  config.vm.provision :shell, inline: "sudo apt-get install -y ansible"
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbooks/provision.yml"
  end

  # VM-1 (Argo)
  config.vm.define "Argo" do |argo|
    config.vm.box = "hashicorp/bionic64"
    config.vm.hostname = "argo.gundam.local"
  end

  # VM-2 (Yamoto)
  # config.vm.define "Yamoto" do |yamoto|
    # config.vm.box = "hashicorp/bionic64"
    # config.vm.hostname = "yamoto.gundam.local"
  # end

end