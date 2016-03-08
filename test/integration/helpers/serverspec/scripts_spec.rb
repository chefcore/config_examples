require 'spec_helper'

describe 'Scripts' do
  it 'Node Info Script Created', if: linux? do
    expect(file('/usr/bin/nodeinfo')).to exist
  end
  it 'Node Info Script Created', if: windows? do
    expect(file('C:/Windows/System32/nodeinfo.cmd')).to exist
  end
end
