require 'chefspec'

describe 'task1_jboss::install' do
  context 'When all attributes are default, on CentOS 7.4.1708' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos',
                                          version: '7.4.1708')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes recipe "java"' do
      expect(chef_run).to include_recipe 'java'
    end

    it 'downloads jboss' do
      tarball = chef_run.node['jboss']['core']['tarball_dest']
      expect(chef_run).to create_remote_file_if_missing tarball
    end

    it 'downloads jboss modules' do
      tarball = chef_run.node['jboss']['modules']['dest']
      expect(chef_run).to create_remote_file tarball
    end
  end
end
