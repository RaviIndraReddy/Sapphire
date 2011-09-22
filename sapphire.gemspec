$:.push File.expand_path("../lib", __FILE__)
require "sapphire/version"

Gem::Specification.new do |s|
  s.name        = "sapphire"
  s.version     = Sapphire::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marcus Bratton"]
  s.email       = ["marcus.bratton@gmail.com"]
  s.homepage    = "http://github.com/MarcusTheBold/Sapphire/"
  s.summary     = "An automated web acceptance test framework for non-technical resources"
  s.description = "An automated web acceptance test framework for non-technical resources using selenium-wedriver."
  s.files       = Dir['lib/**/*.rb']
  s.has_rdoc    = false
  s.require_paths = ["lib"]
  s.default_executable = %q{sapphire}
  s.executables = ["sapphire"]
  s.add_dependency('selenium-webdriver')
  s.add_dependency('colorize')
  s.add_dependency('win32console')
end

