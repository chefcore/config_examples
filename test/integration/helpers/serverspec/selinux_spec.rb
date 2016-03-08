require 'spec_helper'

describe 'SELinux', if: linux? do
  it 'Disabled', if: redhat? do
    expect(file('/etc/selinux/config').content).to match(/SELINUX=disabled/)
  end
end
