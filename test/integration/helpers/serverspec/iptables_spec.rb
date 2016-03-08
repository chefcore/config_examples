require 'spec_helper'

describe 'Iptables', if: linux? do
  it 'Default INPUT DROP' do
    expect(iptables).to have_rule('DROP').with_chain('INPUT')
  end
  it 'Default FORWARD DROP' do
    expect(iptables).to have_rule('DROP').with_chain('FORWARD')
  end
  it 'Default OUTPUT ACCEPT' do
    expect(iptables).to have_rule('ACCEPT').with_chain('OUTPUT')
  end
  it 'Allow - SSH 22 TCP' do
    expect(iptables).to have_rule(
      '-p tcp -m tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT').with_chain('INPUT')
  end
  it 'Allow - ESTABLISHED,RELATED' do
    expect(iptables).to have_rule('-m state --state RELATED,ESTABLISHED -j ACCEPT').with_chain('INPUT')
  end
  it 'Allow - Loopback' do
    expect(iptables).to have_rule('-i lo -j ACCEPT').with_chain('INPUT')
  end
  it 'Allow - ICMP anywhere' do
    expect(iptables).to have_rule('-p icmp -m icmp --icmp-type 8 -j ACCEPT').with_chain('INPUT')
  end
  it 'Allow - Rsync anywhere' do
    expect(iptables).to have_rule('-p tcp -m tcp --dport 873 -m state --state NEW,ESTABLISHED -j ACCEPT').with_chain('INPUT')
  end
end
