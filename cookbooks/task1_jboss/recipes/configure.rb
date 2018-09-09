template 'systemdify jboss' do
  path node.default['jboss']['service']
  source 'jboss.service.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables java_home: node.default['java']['java_home'],
            jboss_home: node.default['jboss']['core']['dest'],
            entrypoint: node.default['jboss']['entrypoint']
  action :create_if_missing
  notifies :run, 'execute[daemon-reload]', :immediately
end

execute 'daemon-reload' do
  command 'systemctl daemon-reload'
end

service 'Enable jboss service' do
  service_name 'jboss'
  action :enable
end

service 'Start jboss service' do
  service_name 'jboss'
  action :start
end
