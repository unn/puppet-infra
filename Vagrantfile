Vagrant::Config.run do |config|
  #config.vm.define :db do |web_config|
  #  web_config.vm.box = "debian-60"
  #  web_config.vm.forward_port 3306, 4568
  #  web_config.vm.host_name = "db1"
  #  #web_config.vm.share_folder "shared", "/opt/shared", "~/Downloads"
  #  web_config.vm.provision :puppet do |puppet|
  #    puppet.manifests_path = "manifests"
  #    puppet.manifest_file = "nodes.pp"
  #    puppet.module_path = "modules"
  #    #puppet.options = "--verbose --debug"
  #  end
  #end

  config.vm.define :web do |web_config|
    web_config.vm.box = "debian-60"
    web_config.vm.forward_port 80, 4567
    web_config.vm.host_name = "web1"
    web_config.vm.network :hostonly, "172.31.31.44"
    #web_config.vm.share_folder "shared", "/opt/shared", "~/Downloads"
    web_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "nodes.pp"
      puppet.module_path = "modules"
      #puppet.options = "--verbose --debug"
    end
  end
end