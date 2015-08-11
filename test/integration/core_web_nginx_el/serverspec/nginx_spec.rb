require 'spec_helper'

describe 'Nginx' do
  it 'Nginx Installed' do
    expect(package('nginx')).to be_installed
  end
  it 'Nginx Service Running' do
    expect(service('nginx')).to be_running
  end
  it 'Listening on port 80' do
    expect(port(80)).to be_listening
  end
end
