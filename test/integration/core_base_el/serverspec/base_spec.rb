require 'spec_helper'

describe 'Base OS' do
  it 'Assigned 33.33.33.20 to eth1' do
    expect(interface('eth1')).to have_ipv4_address('33.33.33.20')
  end
  # it 'Chef Client Version - 12.4.0' do
  #   expect(command('knife -v').stdout).to contain(/12.4.0/)
  # end
  it 'OS Version - CentOS 6.6' do
    expect(command('cat /etc/redhat-release').stdout).to contain(/6.6/)
  end
  it 'Package Installed - VIM' do
    expect(package('vim-enhanced')).to be_installed
  end
  it 'Package Installed - HTOP' do
    expect(package('htop')).to be_installed
  end
  it 'Package Installed - Locate' do
    expect(package('mlocate')).to be_installed
  end
end
