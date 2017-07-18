require 'spec_helper'

describe 'run1' do
  on_supported_os.each do |os, facts|
    context 'on #{os} with defaults for all parameters' do
      it { is_expected.to compile }
      it { is_expected.to contain_class('run1') }
      it { is_expected.to contain_package('run1').with_ensure('installed') }
    end
  end
end
