def resolve_hostname_into_ip(hostname)
  ipv4_regex = /^([0-9]{1,3}\.){3}[0-9]{1,3}?$/
  search(
    :node,
    "fqdn:#{hostname}",
    filter_result: { ip: %w[network interfaces eth1 addresses] }
  ).first['ip'].keys
    .map(&:to_s)
    .select { |k| ipv4_regex.match k }.first
end

jboss_ip = resolve_hostname_into_ip node['jboss']['hostname']

log 'search result' do
  message jboss_ip.to_s
  level :warn
end

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
            ip: jboss_ip
  action :create_if_missing
  notifies :run, 'service[reload nginx]', :immediately
end

service 'reload nginx' do
  service_name 'nginx'
  action :reload
end
