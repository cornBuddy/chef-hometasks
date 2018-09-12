default['jboss']['hostname'] = 'jboss'
default['jboss']['port'] = 8000
# TODO: find with search
default['jboss']['ip'] = search(
  :node,
  "fqnd:#{node['default']['hostname']}",
  :filter_result => { 'ip' => ['network', 'interfaces', 'eth1', 'addresses'] }
)
