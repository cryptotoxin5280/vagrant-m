Vagrant.configure(2) do |config|

  # Common Config (Applies to ALL VMs)

  # Select Provider
  config.vm.provider "hyperv"
  
  # Configure Network
  config.ssh.forward_agent = true

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

  # Run 
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "autonomy/ansible/playbooks/autonomy-install-depends.yml"
  end

  # VM-1 (Argo)
  config.vm.define "Argo" do |argo|
    config.vm.box = "hashicorp/bionic64"
	config.vm.network "private_network"
	config.vm.hostname = "argo.gundam.local"
  end

  # VM-2 (Yamato)
  # config.vm.define "Yamato" do |yamato|
    # config.vm.box = "hashicorp/bionic64"
    # config.vm.hostname = "yamato.gundam.local"
	# config.vm.network "private_network", ip: "172.16.0.102"
  # end

end