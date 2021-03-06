require 'spec_helper'

describe package('kibana'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('kibana'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe port(5601) do
  it { should be_listening }
end
