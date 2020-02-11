# update_dat

Updates an endpoint's DAT on Windows or RHEL/CentOS

Step 1: 

Navigate to: https://www.mcafee.com/enterprise/en-us/downloads/security-updates.html




Step 2: 

For Windows Endpoints running ENS, the V3_XXXXdat.exe will need to be downloaded and placed in the cookbook's files/windows directory.

For Linux Endpoints running ENS for Linux Threat Prevention, the "V2 DAT Package For Use with McAfee ePO" zip file will need to be downloaded and placed in the cookbook's /files/centos directory. 




Step 3: 

Edit line 35 "installer_source" of the cookbook's recipe (/recipes/default.rb) to reflect the full file name of the V3 DAT for Windows endpoints.

Edit line 55 "installer source" of the cookbook's recipe (/recipes/default.rb) to reflect the full file name of the V2 DAT for Linux endpoints.




Step 4: 

Deploy





