# frozen_string_literal: true

require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |test|
  test.pattern = Dir.glob('spec/**/*_spec.rb')
  test.rspec_opts = '--format html --out reports/rspec_results.html'
end

task default: :spec
