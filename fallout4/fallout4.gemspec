# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fallout4/version'

Gem::Specification.new do |spec|
  spec.name          = "fallout4"
  spec.version       = Fallout4::VERSION
  spec.authors       = ["Jonathan Dade"]
  spec.email         = ["jonathandade@gmail.com"]

  spec.summary       = %q{Codes for making Fallout 4 easier}
  spec.description   = %q{Using some library code to gather and query. This set of tools is supposed to
                          make certain tasks in Fallout 4 less repetitive. Tasks like hacking computers.}
  spec.homepage      = "https://github.com/jondade/game-tools/fallout4"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  spec.files         = Dir['bin/*'] + Dir['lib/**/*'] + Dir['spec/*/*'] + Dir['exe/*'] + Dir['*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "guard-yard"
  spec.add_development_dependency "guard-rubocop"
  spec.add_development_dependency "guard-rspec"
end
