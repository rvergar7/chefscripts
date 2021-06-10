#
# Cookbook:: new_install_ma
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#

package 'Install MA' do
  case node[:platform]
  when 'ubuntu','debian'
    package_name 'maprovision'

  when 'redhat', 'centos'
    package_name 'MAProvision'

  end

end


