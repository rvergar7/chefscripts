#
# Cookbook:: new_install_ma
# Recipe:: win_mar
#
# Copyright:: 2021, The Authors, All Rights Reserved.

install_path = '//10.209.10.102/vm/installs/MAR'
if node['kernel']['os_info']['os_architecture'] == "64-bit"
  install_exe = 'MARSetup_x64.exe'
else
  install_exe = 'MARSetup_x86.exe'
end

install_options = '/install /quiet /norestart'

windows_package 'McAfee Active Response' do
  source "#{install_path}/#{install_exe}"
  installer_type :custom
  options install_options
  action :install
end
