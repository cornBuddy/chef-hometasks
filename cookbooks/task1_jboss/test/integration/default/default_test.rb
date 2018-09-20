describe port(8000), :skip do
  it { should be_listening }
  its('processes') { should include 'jboss' }
end
