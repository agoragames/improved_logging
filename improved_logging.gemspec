# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "improved_logging/version"

Gem::Specification.new do |s|
  s.name        = "improved_logging"
  s.version     = ImprovedLogging::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Czarnecki"]
  s.email       = ["dczarnecki@agoragames.com"]
  s.homepage    = "https://github.com/agoragames/improved_logging"
  s.summary     = %q{Adds improved logging capabilities to the ActiveSupport::BufferedLogger class}
  s.description = %q{Adds improved logging capabilities to the ActiveSupport::BufferedLogger class}

  s.rubyforge_project = "improved_logging"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('activesupport', '~> 3.0.9')
  s.add_dependency('i18n', '~> 0.5.0')
  
  s.add_development_dependency('rake', '~> 0.9.2')
  s.add_development_dependency('rspec', '~> 2.6.0')
end
