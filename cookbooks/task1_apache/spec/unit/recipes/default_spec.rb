require 'chefspec'

shared_examples 'shared' do |params|
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform: params[:platform],
                                        version: params[:params])
    runner.converge(described_recipe)
  end

  let(:package_name) { chef_run.node['apache']['package_name'] }

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'installs package' do
    expect(chef_run).to install_package package_name
  end

  it 'enables the service' do
    expect(chef_run).to enable_service package_name
  end

  it 'starts the service' do
    expect(chef_run).to start_service package_name
  end
end

describe 'task1_apache::default' do
  params = { platform: 'ubuntu', version: '16.04' }
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: params[:platform],
                                          version: params[:version])
      runner.converge(described_recipe)
    end

    it 'uses "apache2" as package name' do
      expect(chef_run.node['apache']['package_name']).to eq('apache2')
    end

    include_examples 'shared', params
  end

  context 'When all attributes are default, on CentOS 7.4.1708' do
    params = { platform: 'centos', version: '7.4.1708' }
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: params[:platform],
                                          version: params[:params])
      runner.converge(described_recipe)
    end

    it 'uses "httpd" as package name' do
      expect(chef_run.node['apache']['package_name']).to eq('httpd')
    end

    include_examples 'shared', params
  end
end
