include_recipe 'java'

remote_file 'Downloading JBoss7' do
  path node['jboss']['core']['tarball_dest']
  source node['jboss']['core']['source']
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
end

bash 'Untar JBoss7' do
  cwd node['jboss']['core']['cwd']
  code "tar -xvzf #{node['jboss']['core']['tarball_dest']}"
  creates node['jboss']['core']['dest']
end

remote_file 'Downloading JBoss7 modules' do
  path node['jboss']['modules']['dest']
  source node['jboss']['modules']['source']
  owner 'root'
  group 'root'
  mode '0644'
end
