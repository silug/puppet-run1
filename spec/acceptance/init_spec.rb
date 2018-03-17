require 'spec_helper_acceptance'

describe 'run1' do
  context 'default parameters' do
    it 'applies with no errors' do
      # Run twice to test idempotency
      apply_manifest('class { run1: }', 'catch_failures' => true)
      apply_manifest('class { run1: }', 'catch_changes' => true)
    end
  end
end
