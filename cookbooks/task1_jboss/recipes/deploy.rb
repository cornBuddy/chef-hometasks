directory 'Create deploy dir' do
  path node['jboss']['deploy_dir']
  action :create
  recursive true
end

cookbook_file node['jboss']['artifact_path'] do
  source node['jboss']['artifact_name']
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file "#{node['jboss']['artifact_path']}.dodeploy" do
  mode '0644'
  owner 'root'
  group 'root'
  action :create
end
