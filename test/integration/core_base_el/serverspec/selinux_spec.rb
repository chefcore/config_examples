require 'spec_helper'

describe 'SELinux' do
  it 'Disabled' do
    expect(file('/etc/selinux/config').content).to match(/SELINUX=disabled/)
  end
end
