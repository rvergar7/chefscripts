# apply_policy

Step 1:

You will need to setup a service account in ePO with the appropriate permissions to perform these actions. I do not recommend using an administrator account. Setup an account with only the required permissions.




Step 2:

Change the variables epo, epo_port, svc_user, svc_password to reflect your environment setup.




Step 3:

Use the ePO Web API to find the parameters for the policy you wish to apply with this cookbook. 

Here is an example of how to accomplish this: https://docs.mcafee.com/bundle/epolicy-orchestrator-web-api-reference-guide/page/GUID-C2771B41-22E7-443E-8383-707BBA0AD61E.html

You will need to run the following command and gather the parameters for the policy: curl -k -u <epo_user>:<password> https://<epo ip>:<epo_port>/remote/policy.find?searchText=<policy_name>

Edit productId, typeId, and objectId to the parameters you gathered.




Step 4:

Deploy
