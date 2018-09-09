case node[:platform]
when 'redhat', 'centos'
  default['apache']['package_name'] = 'httpd'
when 'ubuntu', 'debian'
  default['apache']['package_name'] = 'apache2'
end
