#
# Cookbook:: new_install_ma
# Recipe:: win_ens
#
# Copyright:: 2021, The Authors, All Rights Reserved.

install_path = '//10.209.10.102/vm/installs/ENS'
install_exe = 'setupEP.exe'
install_options = 'ADDLOCAL="tp,atp,fw,wc"'

windows_package 'McAfee Endpoint Security Platform' do
  source "#{install_path}/#{install_exe}"
  installer_type :custom
  options install_options
  action :install
end
