require 'spec_helper'

describe 'Webapp' do
  it 'Index.html Exists' do
    expect(file('/var/www/nginx/chefcore/index.html')).to be_file
  end
  it 'Index.html Owned by nginx' do
    expect(file('/var/www/nginx/chefcore/index.html')).to be_owned_by 'nginx'
  end
end
