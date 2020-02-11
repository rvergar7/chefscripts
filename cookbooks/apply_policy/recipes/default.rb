#
# Cookbook:: apply_policy
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

# Set the parameters of the policy
# These parameters are given by the ePO Web API
# You will need to find the parameters for the policy you are trying to set
# by using policy.find [searchText]
productId = ""
typeId = ""
objectId = ""

# This is the ePO API URL and parameters
uri = URI.parse("https://#{epo}:#{epo_port}/remote/policy.assignToSystem?names=#{hostname}&productId=#{productId}&typeId=#{typeId}&objectId=#{objectId}")
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
