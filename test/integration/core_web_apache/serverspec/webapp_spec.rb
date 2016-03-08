require 'spec_helper'

describe 'Webapp' do
  it 'Index.html Exists' do
    expect(file('/var/www/html/chefcore/index.html')).to be_file
  end
  it 'Index.html Owned by apache' do
    expect(file('/var/www/html/chefcore/index.html')).to be_owned_by 'apache'
  end
end
