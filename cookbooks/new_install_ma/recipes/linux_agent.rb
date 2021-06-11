#
# Cookbook:: new_install_ma
# Recipe:: linux_agent
#
# Copyright:: 2021, The Authors, All Rights Reserved.


# Installs McAfee Agent for Linux
# Requires YUM and/or APT repository to have Agent packages  
# See Readme for details

package 'Install MA' do
  case node[:platform]
  #debian package
  when 'ubuntu','debian'
    package_name 'maprovision' 
  
  #rpm package
  when 'redhat', 'centos'
    package_name 'MAProvision'

  end

end


