# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'borderlands2/version'

Gem::Specification.new do |spec|
  spec.name          = 'borderlands2'
  spec.version       = Borderlands2::VERSION
  spec.authors       = ['Jonathan Dade']
  spec.email         = ['jonathandade@gmail.com']

  spec.summary       = 'A gem with some tools for Borderlands 2'
  spec.description   = 'This gem provides some tools like a route finder for \
                        the game Borderlands 2.'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either
  # set the 'allowed_push_host'to allow pushing to a single host
  # or delete this section to allow pushing to any host.
  unless spec.respond_to?(:metadata)
    raise 'RubyGems 2.0 or newer is required to protect against public gem \
    pushes.'
  end
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'TODO: Set to \
    "http://mygemserver.com"'
  end

  spec.files = `git ls-files -z`.split("\x0").reject { |f|
    f.match(%r{^(test|spec|features)/})
  }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
