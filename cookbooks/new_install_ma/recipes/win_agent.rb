#
# Cookbook:: new_install_ma
# Recipe:: win_agent
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# Installs McAfee Agent for Windows
# Requires remote repository to store the FramePkg executable 
# Maintains Idempotency but will not upgrade the package if McAfee AGENT is already installed


# change install_path to point to location of FramePkg.exe 
install_path = '//10.209.10.102/vm/installs'



install_exe = 'FramePkg.exe'
install_options = '/INSTALL=AGENT /SILENT'

windows_package 'McAfee Agent' do
  source "#{install_path}/#{install_exe}"
  installer_type :custom
  options install_options
  action :install
end

