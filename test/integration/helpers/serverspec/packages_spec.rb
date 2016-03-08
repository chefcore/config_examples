require 'spec_helper'

describe 'Install Packages', if: linux? do
  if redhat?
    it 'VIM' do
      expect(package('vim-enhanced')).to be_installed
    end
  elsif debian? || ubuntu?
    it 'VIM' do
      expect(package('vim')).to be_installed
    end
  end
  it 'WGET' do
    expect(package('wget')).to be_installed
  end
  it 'Locate' do
    expect(package('mlocate')).to be_installed
  end
end
