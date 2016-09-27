require 'rubygems'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rake/extensiontask'

SUPPORT_DIR = 'plugins/providers/xhyve/support'.freeze
DHCPD_PARSER = "#{SUPPORT_DIR}/dhcpd_leases.rb".freeze

# Immediately sync all stdout so that tools like buildbot can
# immediately load in the output.
$stdout.sync = true
$stderr.sync = true

# Load all the rake tasks from the "tasks" folder. This folder
# allows us to nicely separate rake tasks into individual files
# based on their role, which makes development and debugging easier
# than one monolithic file.
task_dir = File.expand_path("../tasks", __FILE__)
Dir["#{task_dir}/**/*.rake"].each do |task_file|
  load task_file
end

Rake::ExtensionTask.new('vmnet_mac') do |ext|
  ext.ext_dir = 'ext/vmnet_mac'
  ext.lib_dir = SUPPORT_DIR
end

file DHCPD_PARSER => "#{SUPPORT_DIR}/dhcpd_leases.y" do |t|
  sh "racc -o #{t.name} #{t.prerequisites.first}"
end

Rake::Task['compile'].prerequisites << DHCPD_PARSER

task default: "test:unit"
