Vagrant::Config.run do |config|
  config.vm.define :web do |web_config|
    web_config.vm.box = "debian-60"
    web_config.vm.forward_port 80, 4567
    web_config.vm.host_name = ENV['VAGRANT_HOSTNAME'] || "localhost"
    web_config.vm.share_folder "shared", "/opt/shared", "~/Downloads"
    web_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "nodes.pp"
      puppet.module_path = "modules"
    end
  end
end