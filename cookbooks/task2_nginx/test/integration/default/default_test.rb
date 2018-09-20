describe package 'nginx' do
  it { should be_installed }
end

describe service 'nginx' do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command 'nginx -t' do
  its('exit_status') { should eq 0 }
end

describe port 80 do
  it { should be_listening }
  its('processes') { should include 'nginx' }
end
