#
# Cookbook:: install_ens
# Recipe:: default
# Author:: Raphael Vergara (McAfee)
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Get the temp directory irrespective of OS
require 'tmpdir'
temp = Dir.tmpdir()

#set the installation directory where we will store the files
installer_directory = "#{temp}/McAfee/ens"

# Get the OS Platform
os_platform = "#{node['platform']}"

# Clean up, just in case something has been left over, we want to delete before & after
directory "#{installer_directory}" do
  recursive true
  action :delete
end

# Create a McAfee folder to store files
directory "#{installer_directory}" do
  action :create
  recursive true
end

# Set the installation source and options based on OS Platform
if os_platform == "windows" 
  
  # Move the ens installation files into the directory we created
  remote_directory "#{installer_directory}" do
    source "#{os_platform}" # <-- this is the platform directory in files/default/
    action :create
    recursive true                                                                      
  end 

  # Set the installation source
  installer_source = "setupEP.exe"

  # Set the installation options
  # See the following for command-line options: https://docs.mcafee.com/bundle/endpoint-security-10.6.0-installation-guide-unmanaged-windows/page/GUID-9F48833E-D043-42F8-AAFE-B3144BC947E0.html
  # Here we have set to install the Firewall, Threat Prevention, and Web Control
  installer_options = "ADDLOCAL=\"fw,tp,wc\" /qn"

  # Install McAfee ENS for Windows
  windows_package "McAfee Endpoint Security" do
    source            "#{installer_directory}/#{installer_source}"
    options           "#{installer_options}"
    installer_type    :custom
    action            :install
  end
    
 elsif os_platform == "centos"
  
  # Move the ens installation files into the directory we created
  remote_directory "#{installer_directory}" do
    source "#{os_platform}" # <-- this is the platform directory in files/default/
    files_owner 'root'                                                                 
    files_group 'root'
    files_mode '0755'
    action :create
    recursive true                                                                      
  end 
  
  # Set the installation source
  installer_source = "install-mfetp.sh"
  installer_options = "silent"

  # Install McAfee ENS for Linux
  bash 'mcafee_ens' do
    cwd   "#{installer_directory}"
    code <<-EOH
      for f in *.tar.gz; do tar -zxvf "$f"; done
      ./#{installer_source} #{installer_options}
      EOH
  end

 end

#Clean up
directory "#{installer_directory}" do
  recursive true
  action :delete
end
