# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simple_struct', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jared Grippe"]
  gem.email         = ["jared@deadlyicon.com"]
  gem.description   = %q{SimpleStruct is a lighter weight struct then ruby's standard struct.}
  gem.summary       = %q{SimpleStruct is a lighter weight struct then ruby's standard struct.}
  gem.homepage      = "https://github.com/deadlyicon/simple_struct"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "simple_struct"
  gem.require_paths = ["lib"]
  gem.version       = SimpleStruct::VERSION
end
