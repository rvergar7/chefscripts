#
# Cookbook:: new_install_ma
# Recipe:: win_ens
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# Installs McAfee Endpoint Security for Windows
# Requires remote repository to store the setupEP executable 
# Maintains Idempotency and will update only if minor version changes.
# 	will not update with new patch version


# change install_path to point to location of setupEP.exe 
install_path = '//10.209.10.102/vm/installs/ENS'


install_exe = 'setupEP.exe'

# remove unwanted package
# tp = Threat Prevention -- required
# atp = Adaptive Threat Protection
# fw = firewall
# wc = Web Control
install_options = 'ADDLOCAL="tp,atp,fw,wc"'

windows_package 'McAfee Endpoint Security Platform' do
  source "#{install_path}/#{install_exe}"
  installer_type :custom
  options install_options
  action :install
end
