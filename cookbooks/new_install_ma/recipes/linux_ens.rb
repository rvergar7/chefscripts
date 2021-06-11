#
# Cookbook:: new_install_ma
# Recipe:: linux_ens
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#

# Installs McAfee Endpoint Security Threat Prevention for Linux
# Requires YUM and/or APT repository to have ENS packages  
# See Readme for details


package 'Install ENS' do
  case node[:platform]
  when 'ubuntu','debian'
    package_name 'mcafeetp'

  when 'redhat', 'centos'
    package_name 'McAfeeTP'

  end

end

