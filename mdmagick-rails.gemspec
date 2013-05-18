# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mdmagick-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sean Kay"]
  gem.email         = ["f.sean.kay@gmail.com"]
  gem.description   = "MDMagic for Rails"
  gem.summary       = "Gemified MDMagic"
  gem.homepage      = "https://github.com/seankay/mdmagic-rails"
  gem.licenses      = ["MIT"]

  gem.files         = Dir["{app,lib,vendor}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  gem.test_files    = Dir["test/**/*"]
  gem.name          = "mdmagick-rails"
  gem.require_paths = ["lib"]
  gem.version       = MDMagick::Rails::VERSION

  gem.add_dependency "railties", ">= 3.2", "< 5.0"

  gem.add_development_dependency "activesupport"
  gem.add_development_dependency "sass-rails"
  gem.add_development_dependency "tzinfo"
end
