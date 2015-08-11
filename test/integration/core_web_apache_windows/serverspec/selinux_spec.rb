require 'spec_helper'

# describe 'Selinux' do
#   it 'Selinux Disabled' do
#     expect(selinux).to be_disabled
#   end
# end

# SELinux should be disabled
describe selinux do
  it { should be_disabled }
end
