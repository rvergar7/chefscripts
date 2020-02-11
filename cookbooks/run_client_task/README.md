# run_client_task

Step 1:

You will need to setup a service account in ePO with the appropriate permissions to perform these actions. I do not recommend using an administrator account. Setup an account with only the required permissions.




Step 2:

Change the variables epo, epo_port, svc_user, svc_password to reflect your environment setup.




Step 3:

Use the ePO Web API to find the parameters for the client task you wish to run with this cookbook. 

Here is an example of how to accomplish this: https://docs.mcafee.com/bundle/epolicy-orchestrator-web-api-reference-guide/page/GUID-C2771B41-22E7-443E-8383-707BBA0AD61E.html

You will need to run the following command and gather the parameters for the client task: curl -k -u <epo_user>:<password> https://<epo ip>:<epo_port>/remote/clienttask.find?searchText=<task_name>

Edit productId and objectId to the parameters you gathered.




Step 4:

You may wish to edit the default settings for the client task run. The default values are below:

retryAttempts = "1"
retryIntervalInSeconds = "30"
abortAfterMinutes = "5"
useAllAgentHandlers = "1" # boolean
stopAfterMinutes = "20" # set this value longer if running a scan so that it can complete
randomMinutes = "0"
timeoutInHours = "48" # Mark server task as failed if systems have not responded


Step 5:

Deploy

