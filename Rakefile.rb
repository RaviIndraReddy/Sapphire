require 'rubygems'
require 'bundler'
require 'rake'
require 'albacore'
require 'fileutils'

Bundler::GemHelper.install_tasks


ABSOLUTE_PATH = File.expand_path(File.dirname(__FILE__))
ZIP_FILE_PREFIX = "Sapphire"
RELEASE_BUILD_NUMBER = ENV["BUILD_NUMBER"] || "1.0.0.0"
BUILDS_DIR = File.join(ABSOLUTE_PATH,'builds')
PACKAGE_DIR = File.join(ABSOLUTE_PATH,'report')
REPORTS_DIR = "C:/Reports/"


task :regression do
  FileUtils.rm_rf(REPORTS_DIR, :verbose => true) if File.directory?(REPORTS_DIR)
  Dir.mkdir REPORTS_DIR if !File.directory?(REPORTS_DIR)
  system("sapphire " + ABSOLUTE_PATH + "/Tests/BasicPage/TestPlans/Regression.rb")
  Rake::Task["zip"].execute
end

desc "Create a binary zip"
zip do |zip|
  puts "CREATING ZIP"
  FileUtils.rm_rf(BUILDS_DIR, :verbose => true) if File.directory?(BUILDS_DIR)
  Dir.mkdir BUILDS_DIR if !File.directory?(BUILDS_DIR)
  file = "sapphirereport.zip"
  File.delete(file) if File.exists?(file)

  zip.output_path = BUILDS_DIR
  zip.directories_to_zip REPORTS_DIR
  zip.output_file = file

  puts "ZIP CREATION COMPLETE"
end
