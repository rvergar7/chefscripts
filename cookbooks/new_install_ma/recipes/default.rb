#
# Cookbook:: new_install_ma
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'windows'
  include_recipe 'new_install_ma::win_agent'
  include_recipe 'new_install_ma::win_ens'
  include_recipe 'new_install_ma::win_mar'
  
else
  include_recipe 'new_install_ma::linux_agent'
  include_recipe 'new_install_ma::linux_ens'
  
end