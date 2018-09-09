cookbook_file node.default['jboss']['artifact_path'] do
  source node.default['jboss']['artifact_name']
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file "#{node.default['jboss']['artifact_path']}.dodeploy" do
  mode '0644'
  owner 'root'
  group 'root'
  action :create
end
