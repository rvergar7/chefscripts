#
# Cookbook:: move_system_to_group
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

# Set the parameters for moving the system to the specified system tree group
# These parameters are given by the ePO Web API
# You will need to find the parameters for the group you are trying to move to
# by using system.findGroups [searchText]
parentGroupId = ""

# This is the ePO API URL and parameters
# system.move names parentGroupId [autoSort] - Moves systems to the specified destination group.
# NOTE: The default setting for [autoSort] disables auto sorting so system will be moved permanently.
# Set [autoSort] to 1 ex. &autoSort=1 in order to enable system tree sorting. If this is set, the system
# will be resorted if resorting of the system tree is initiated.
uri = URI.parse("https://#{epo}:#{epo_port}/remote/system.move?names=#{hostname}&parentGroupId=#{parentGroupId}")
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
