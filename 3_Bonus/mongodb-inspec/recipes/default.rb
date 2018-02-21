#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.



yum_repository 'mongodb' do
	description "MongoDB Repository"
	baseurl "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/"
	gpgcheck false
	enabled true
	action :create
end

package 'mongodb-org' do
	:install  
end

execute 'mongodb-systemctl-daemon-reload' do
     command 'systemctl daemon-reload'
     action :nothing
   end

execute 'chkconfig' do
	command 'sudo mongo'
	live_stream true
 ignore_failure true
 end
