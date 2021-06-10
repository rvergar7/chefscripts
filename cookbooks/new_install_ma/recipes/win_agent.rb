#
# Cookbook:: new_install_ma
# Recipe:: win_agent
#
# Copyright:: 2021, The Authors, All Rights Reserved.

install_path = '//10.209.10.102/vm/installs'
install_exe = 'FramePkg.exe'
install_options = '/INSTALL=AGENT /SILENT'

windows_package 'McAfee Agent' do
  source "#{install_path}/#{install_exe}"
  installer_type :custom
  options install_options
  action :install
end

