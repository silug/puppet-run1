require 'spec_helper'

describe 'run1' do
  on_supported_os.each do |os, os_facts|
    context "on #{os} with defaults for all parameters" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('run1') }
      it { is_expected.to contain_package('run1').with_ensure('installed') }
    end
  end
end
