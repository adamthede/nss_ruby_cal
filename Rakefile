#!/usr/bin/env ruby
# -*- ruby -*-

require 'rake/clean'
require 'rake/testtask'

Rake::TestTask.new() do |t|
  t.pattern = "test/test_*.rb"
end

desc "Run tests"
task :default => :test

=begin
task :default => :test

task :test_all do
  ruby 'test/test*.rb'
end

task :test do
  ENV['EARLY_ESCAPE'] = 'true'
  ruby 'test/test*.rb'
end
=end
