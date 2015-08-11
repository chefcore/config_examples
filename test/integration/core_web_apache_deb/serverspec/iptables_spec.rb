require 'spec_helper'

describe 'Iptables' do
  it 'Allow SSH' do
    expect(iptables).to have_rule('-A ufw-user-input -p tcp -m tcp --dport 22 -j ACCEPT')
  end
  it 'Allow HTTP' do
    expect(iptables).to have_rule('-A ufw-user-input -p tcp -m tcp --dport 80 -j ACCEPT')
  end
end
