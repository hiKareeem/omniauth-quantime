# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-quantime/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kareem Albaba"]
  gem.email         = ["kareem@quanti.me"]
  gem.description   = %q{OmniAuth strategy for Quantime using OAuth2}
  gem.summary       = %q{OmniAuth strategy for Quantime using OAuth2}
  gem.homepage      = "https://github.com/kalbaba/omniauth-quantime"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-quantime"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Quantime::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
