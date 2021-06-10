#
# Cookbook:: new_install_ma
# Recipe:: ens_install
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#

package 'Install ENS' do
  case node[:platform]
  when 'ubuntu','debian'
    package_name 'mcafeetp'

  when 'redhat', 'centos'
    pacakage_name 'McAfeeTP'

  end

end

