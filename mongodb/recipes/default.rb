#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# add yum clean all.
# yum update 


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


#service mongod start

service 'mongod' do
	#supports : restart  => true
	action [:enable, :start]
end	


execute 'chkconfig' do
	#command 'mongo --host 127.0.0.1:27017'
	command 'sudo mongo' 
	action :run
	live_stream true
ignore_failure true
end





