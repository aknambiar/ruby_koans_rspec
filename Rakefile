require 'rake'
require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color --deprecation-out dump --require rspec/legacy_formatters --require ./support/koans_formatter.rb --format KoansFormatter]
  t.pattern = "spec/**/path_to_enlightenment.rb"
end
