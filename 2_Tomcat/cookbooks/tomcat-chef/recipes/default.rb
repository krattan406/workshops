
package 'java-1.7.0-openjdk-devel'

group 'tomcat'

user 'tomcat' do
	manage_home false
	shell '/bin/nologin'
	group 'tomcat'
	home '/opt/tomcat'
end


remote_file 'apache-tomcat-8.5.20.tar.gz' do
  source 'https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz'
end

directory '/opt/tomcat' do
	 mode '0777'
	group 'tomcat'
end

execute 'tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'


execute "manage permissions conf" do
  command "chgrp -R tomcat /opt/tomcat/conf && chmod g+r /opt/tomcat/conf/*"
end

directory '/opt/tomcat/conf' do
	mode '0777'
end

execute "manage permissions bin" do
  command "chgrp -R tomcat /opt/tomcat/bin && chmod g+r /opt/tomcat/bin"
end

directory '/opt/tomcat/bin' do
	mode '0777'
end

execute 'chmod -R g+r /opt/tomcat/conf/*'

execute 'chown some files: work, temp, logs' do
  command 'chown -R tomcat /opt/tomcat/work /opt/tomcat/temp /opt/tomcat/logs'
end


template '/etc/systemd/system/tomcat.service' do
	source 'tomcat.service.erb'
end

execute 'systemctl daemon-reload'

service 'tomcat' do
	action [:start, :enable]
end




