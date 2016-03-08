require 'spec_helper'

describe 'Tomcat' do
  it 'Tomcat Installed' do
    expect(package('tomcat')).to be_installed
  end
  it 'Tomcat Service Running' do
    expect(service('tomcat')).to be_running
  end
  it 'Listening on port 8080' do
    expect(port(8080)).to be_listening
  end
end
