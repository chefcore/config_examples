require 'spec_helper'

describe 'Webapp' do
  it 'Index.html Exists' do
    expect(file('/var/www/tomcat/chefcore.war')).to be_file
  end
  it 'Index.html Owned by tomcat' do
    expect(file('/var/www/tomcat/chefcore.war')).to be_owned_by 'tomcat'
  end
end
