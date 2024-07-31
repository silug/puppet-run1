# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'run1' do
  context 'default parameters' do
    it 'applies with no errors' do
      # Run twice to test idempotency
      apply_manifest('class { run1: }', 'catch_failures' => true)
      apply_manifest('class { run1: }', 'catch_changes' => true)
    end

    describe yumrepo('steve-run1') do
      it { is_expected.to exist }
      it { is_expected.to be_enabled }
    end

    describe package('run1') do
      it { is_expected.to be_installed }
    end

    describe file('/usr/bin/run1') do
      it { is_expected.to be_file }
      it { is_expected.to be_executable }
    end

    describe command('/usr/bin/run1 /bin/true') do
      its(:exit_status) { is_expected.to eq 0 }
    end
  end
end
