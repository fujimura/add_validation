# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/active_model', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'add_validation/version'

Gem::Specification.new do |gem|
  gem.name          = "add_validation"
  gem.version       = ActiveModel::AddValidation::VERSION
  gem.authors       = ["Fujimura Daisuke"]
  gem.email         = ["me@fujimuradaisuke.com"]
  gem.description   = %q{Add validation to ActiveModel from instance}
  gem.summary       = %q{Add validation to ActiveModel from instance}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib/active_model"]

  gem.add_dependency "activesupport", '>= 3.2.8'
  gem.add_dependency "activemodel", '>= 3.2.8'
  gem.add_development_dependency "rake"
  gem.add_development_dependency "activerecord"
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "pry"
end
