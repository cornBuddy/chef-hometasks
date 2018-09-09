default['java']['install_flavor'] = 'openjdk'
default['java']['jdk_version'] = '6'
default['java']['java_home'] = '/usr/lib/jvm/java-1.6.0'

default['jboss']['core']['source'] = 'http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz'
default['jboss']['core']['tarball_dest'] = '/opt/jboss-as-7.1.1.Final.tar.gz'
default['jboss']['core']['dest'] = '/opt/jboss-as-7.1.1.Final/'
default['jboss']['core']['cwd'] = '/opt'
default['jboss']['modules']['source'] = 'http://repo1.maven.org/maven2/org/jboss/modules/jboss-modules/1.1.5.GA/jboss-modules-1.1.5.GA.jar'
default['jboss']['modules']['dest'] = '/opt/jboss-as-7.1.1.Final/jboss-modules.jar'
default['jboss']['entrypoint'] = "#{default['jboss']['core']['dest']}/bin/standalone.sh"
default['jboss']['service'] = '/usr/lib/systemd/system/jboss.service'
