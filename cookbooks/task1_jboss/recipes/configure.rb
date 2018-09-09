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
end

service 'Enable jboss service' do
  service_name 'jboss'
  action :enable
end

service 'Start jboss service' do
  service_name 'jboss'
  action :start
end
