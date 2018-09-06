include_recipe 'java'

remote_file 'Downloading JBoss7' do
  path '/opt/jboss-as-7.1.1.Final.tar.gz'
  source 'http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz'
  owner 'root'
  group 'root'
  mode '0644'
end

bash 'Untar JBoss7' do
  cwd '/opt'
  code 'tar -xvzf /opt/jboss-as-7.1.1.Final.tar.gz'
  creates '/opt/jboss-as-7.1.1.Final/'
end

remote_file 'Downloading JBoss7 modules' do
  path '/opt/jboss-as-7.1.1.Final/jboss-modules.jar'
  source 'http://repo1.maven.org/maven2/org/jboss/modules/jboss-modules/1.1.5.GA/jboss-modules-1.1.5.GA.jar'
  owner 'root'
  group 'root'
  mode '0644'
end

bash 'Run JBoss7' do
  cwd '/opt/jboss-as-7.1.1.Final/bin'
  code 'sh /opt/jboss-as-7.1.1.Final/bin/standalone.sh -Djboss.bind.address=127.0.0.1'
end
