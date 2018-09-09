package 'Install Apache' do
  package_name node.default['apache']['package_name']
end

service 'Enable Apache service' do
  service_name node.default['apache']['package_name']
  action :enable
end

service 'Start Apache service' do
  service_name node.default['apache']['package_name']
  action :start
end
