package 'Install Nginx' do
  package_name 'nginx'
end

service 'Enable Nginx' do
  service_name 'nginx'
  action :enable
end

service 'Start Nginx' do
  service_name 'nginx'
  action :start
end

template 'Configure Nginx' do
  path '/etc/nginx/conf.d/jenkins.conf'
  source 'jboss.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables port: node['jboss']['port'],
            ip: node['jboss']['ip']
  action :create_if_missing
  notifies :run, 'reload nginx', :immediately
end

service 'reload nginx' do
  service_name 'nginx'
  action :reload
end
