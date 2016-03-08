require 'spec_helper'

describe 'OS', if: redhat? do
  if rhel6?
    it 'Enterprise Linux Server 6' do
      expect(file('/etc/redhat-release').content).to match(/release 6/)
    end
  elsif rhel7?
    it 'Enterprise Linux Server 7' do
      expect(file('/etc/redhat-release').content).to match(/release 7/)
    end
  end
end
