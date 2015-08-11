require 'spec_helper'

describe 'Apache2' do
  it 'Apache Installed' do
    expect(package('apache2')).to be_installed
  end
  it 'Apache Service Running' do
    expect(service('apache2')).to be_running
  end
  it 'Listening on port 80' do
    expect(port(80)).to be_listening
  end
end
