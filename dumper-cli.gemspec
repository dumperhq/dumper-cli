# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dumper/cli/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'dumper-cli'
  spec.version       = Dumper::Cli::VERSION
  spec.authors       = ['Kenn Ejima']
  spec.email         = ['kenn.ejima@gmail.com']

  spec.summary       = %q{CLI for Dumper.io Agent}
  spec.description   = %q{CLI for Dumper.io Agent}
  spec.homepage      = 'https://github.com/kenn/dumper-cli'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor', '~> 0.19'
  spec.add_runtime_dependency 'rainbow', '~> 2.2'
  spec.add_runtime_dependency 'net-ntp', '~> 2.1'
  spec.add_runtime_dependency 'ipaddress', '~> 0.8.3'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
end
