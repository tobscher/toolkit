$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "toolkit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "toolkit"
  s.version     = Toolkit::VERSION
  s.authors     = ["Tobias Haar"]
  s.email       = ["tobias.haar@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Toolkit."
  s.description = "TODO: Description of Toolkit."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.14"

  s.add_development_dependency "sqlite3"
end
