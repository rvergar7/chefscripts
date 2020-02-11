#
# Cookbook:: run_client_task
# Recipe:: default
# Author:: Raphael Vergara (McAfee)
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'socket'
require "net/http"
require "uri"

# Get the hostname of the current machine
hostname = Socket.gethostname

# ePO IP or Hostname for API
epo = ""
epo_port = ""

# Set the credentials of the service account used to interact with ePO API
svc_user = ""
svc_password = ""

# Set the parameters of the client task
# These parameters are given by the ePO Web API
# You will need to find the parameters for the client task you are trying to run
# by using clienttask.find [searchText]
# curl -k -u ga:ga https://192.168.0.71:8443/remote/clienttask.find?searchText=On-Demand
productId = ""
objectId = ""

# These are the options for the task that will be ran
# The values below are the default values shown in the "Run Client Task Now" in ePO
retryAttempts = "1"
retryIntervalInSeconds = "30"
abortAfterMinutes = "5"
useAllAgentHandlers = "1" # boolean
stopAfterMinutes = "20" # set this value longer if running a scan so that it can complete
randomMinutes = "0"
timeoutInHours = "48" # Mark server task as failed if systems have not responded

# This is the ePO API URL and parameters
uri = URI.parse("https://#{epo}:#{epo_port}/remote/clienttask.run?names=#{hostname}&productId=#{productId}&taskId=#{objectId}&retryAttempts=#{retryAttempts}&retryIntervalInSeconds=#{retryIntervalInSeconds}&abortAfterMinutes=#{abortAfterMinutes}&useAllAgentHandlers=#{useAllAgentHandlers}&stopAfterMinutes=#{stopAfterMinutes}&randomMinutes=#{randomMinutes}&timeoutInHours=#{timeoutInHours}")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

# We have to set SSL Verify None because ePO uses a self-signed certificate
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# Make the request with authentication
request = Net::HTTP::Get.new(uri.request_uri)
request.basic_auth("#{svc_user}", "#{svc_password}")
response = http.request(request)

# Print the response code
p response.code
