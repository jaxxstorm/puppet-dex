require 'spec_helper'

describe 'dex' do

  RSpec.configure do |c|
    c.default_facts = {
      :architecture           => 'x86_64',
      :operatingsystem        => 'CentOS',
      :osfamily               => 'RedHat',
      :operatingsystemrelease => '7.1.1503',
      :kernel                 => 'Linux',
      :fqdn                   => 'test',
      :ipaddress              => '192.168.5.10',
    }
  end

  context 'defaults' do
    it { should compile }
  end

  context 'should install dex package' do
    it { should contain_package('dex').with(:ensure => 'latest') }
  end

  context 'should install custom package' do
    let(:params) {{ 'package_name' => 'test_dex' }}
    it { should contain_package('test_dex').with(:ensure => 'latest') }
  end

  context 'configuration setup' do
    it { should contain_file('/etc/dex').with(:ensure => 'directory') }
    it { should contain_file('dex config.json').with(:ensure => 'present', :path => '/etc/dex/config.json').that_requires('File[/etc/dex]') }
  end

end
