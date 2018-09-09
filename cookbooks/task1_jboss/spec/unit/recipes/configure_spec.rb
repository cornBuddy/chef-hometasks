require 'chefspec'

describe 'task1_jboss::configure' do
  context 'When all attributes are default, on CentOS 7.4.1708' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos',
                                          version: '7.4.1708')
      runner.converge(described_recipe)
    end
    let(:template) { chef_run.template('systemdify jboss') }


    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates jboss.service' do
      service = chef_run.node['jboss']['service']
      config = {
        java_home: chef_run.node['java']['java_home'],
        jboss_home: chef_run.node['jboss']['core']['dest'],
        entrypoint: chef_run.node['jboss']['entrypoint']
      }
      expect(chef_run).to create_template_if_missing(service)
        .with(variables: config)
    end

    it 'sends a notification to reload daemon' do
      expect(template).to notify('execute[daemon-reload]').immediately
    end

    it 'enables jboss service' do
      expect(chef_run).to enable_service 'jboss'
    end

    it 'starts jboss service' do
      expect(chef_run).to start_service 'jboss'
    end
  end
end
