require 'spec_helper'

describe 'Base' do
  it 'Chef Client Version - 12.5.1' do
    expect(command('knife -v').stdout).to contain(/12\.5\.1/)
  end
end
