require 'spec_helper'

describe 'Iptables' do
  it 'Allow SSH' do
    expect(iptables).to have_rule('-A INPUT -p tcp -m tcp -m multiport --dports 22 -m comment --comment "allow world to ssh" -j ACCEPT')
  end
  it 'Allow HTTP/8080' do
    expect(iptables).to have_rule('-A INPUT -p tcp -m tcp -m multiport --dports 8080 -m comment --comment "http" -j ACCEPT')
  end
end
