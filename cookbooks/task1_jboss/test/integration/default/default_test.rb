describe port 8080 do
  it { should be_listening }
  its('processes') { should include 'jboss' }
end

describe package 'java-1.6.0-openjdk' do
  it { should be_installed }
end

describe service 'jboss' do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command '/opt/jboss-as-7.1.1.Final/bin/jboss-cli.sh -c "deployment-info --name=jsp-servlet-example.war"' do
  its('exit_status') { should eq 0 }
end

# app should be deployed
