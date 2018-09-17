describe package 'nginx' do
  it { should be_installed }
end

describe port 80 do
  it { should be_listening }
  its('processes') { should include 'nginx' }
end
