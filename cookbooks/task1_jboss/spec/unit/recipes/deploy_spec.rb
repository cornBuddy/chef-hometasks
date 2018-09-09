require 'chefspec'

describe 'task1_jboss::deploy' do
  context 'When all attributes are default, on CentOS 7.4.1708' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos',
                                          version: '7.4.1708')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'copies artifact to remote' do
      dest = chef_run.node['jboss']['artifact_path']
      expect(chef_run).to create_cookbook_file(dest)
    end

    it 'marks artifact as deployable' do
      dest = chef_run.node['jboss']['artifact_path']
      expect(chef_run).to create_file("#{dest}.dodeploy")
    end
  end
end
