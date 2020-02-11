#
# Cookbook:: update_dat
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
# NOTE: REQUIRES UNZIP TO BE INSTALLED ON LINUX ENDPOINT

# Get the temp directory irrespective of OS
require 'tmpdir'
temp = Dir.tmpdir()

#set the installation directory where we will store the files
installer_directory = "#{temp}/McAfee/dat"
extract_directory = "#{installer_directory}/extract"

# Clean up, just in case something has been left over, we want to delete before & after
directory "#{installer_directory}" do
 recursive true
 action :delete
end

# Create a McAfee folder to store files
directory "#{extract_directory}" do
  action :create
  recursive true
end

# Get the OS Platform
os_platform = "#{node['platform']}"

# Set the installation source and options based on OS Platform
if os_platform == "windows"
    
   # Set the installation source
   installer_source = "V3_3978dat.exe"
   installer_options = ""
   
   # Move the file into the directory we created
   cookbook_file "#{installer_directory}/#{installer_source}" do
    source "#{installer_source}"
    action :create
   end
   
   # Update the DAT
   windows_package "McAfee V3 DAT Update" do
     source            "#{installer_directory}/#{installer_source}"
     options           "#{installer_options}"
     installer_type    :custom
     action            :install
   end
   
elsif os_platform == "centos"

  # Set the installation source
  installer_source = "avvepo9528dat.zip"
  installer_options = ""
  
  # Move the file into the directory we created
  cookbook_file "#{installer_directory}/#{installer_source}" do
    mode "755"
    source "#{installer_source}"
    action :create
  end
  
  # Extract the DAT
  bash 'mcafee_dat_update' do
    cwd   "#{installer_directory}"
    code <<-EOH
      unzip #{installer_source} -d #{extract_directory}
      cd #{extract_directory}
      unzip avvdat*.zip
      EOH
  end
  
  # Update the DAT, KB88234
  bash 'mcafee_dat_update_part_two' do
    cwd   "#{extract_directory}"
    code <<-EOH
      function version { echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; }
      DATVERSION="$(find #{extract_directory} -name 'avv*.zip' | grep -o '[[:digit:]]*')"
      ENSVERSION="$(/opt/McAfee/ens/tp/bin/mfetpcli --version | grep -o '[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*')"
      if [ $(version $ENSVERSION) -ge $(version "10.6.5") ]; 
        then
          mkdir /var/McAfee/ens/tp/engine/dat/${DATVERSION}
          cd /var/McAfee/ens/tp/engine/dat
          chmod 600 ${DATVERSION}
          cp #{extract_directory}/*.dat /var/McAfee/ens/tp/engine/dat/${DATVERSION}
          chmod 600 /var/McAfee/ens/tp/engine/dat/${DATVERSION}/*
          sed -i "s@<MajorDATVersion>[^<>]*<@<MajorDATVersion>${DATVERSION}<@" /var/McAfee/ens/tp/prefs.xml
          /opt/McAfee/ens/tp/init/mfetpd-control.sh restart
        else
          mkdir /opt/isec/ens/threatprevention/var/engine/dat/${DATVERSION}
          cd /opt/isec/ens/threatprevention/var/engine/dat
          chmod 600 ${DATVERSION}
          cp #{extract_directory}/*.dat /opt/isec/ens/threatprevention/var/engine/dat/${DATVERSION}
          chmod 600 /opt/isec/ens/threatprevention/var/engine/dat/${DATVERSION}/*
          sed -i "s@<MajorDATVersion>[^<>]*<@<MajorDATVersion>${DATVERSION}<@" /opt/isec/ens/threatprevention/var/prefs.xml
          /opt/isec/ens/threatprevention/bin/isectpdControl.sh restart
      fi
      EOH
  end

end

# Clean up
directory "#{installer_directory}" do
 recursive true
 action :delete
end
