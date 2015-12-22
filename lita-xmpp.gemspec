Gem::Specification.new do |spec|
  spec.name          = 'lita-xmpp'
  spec.version       = '2.0.0.exp'
  spec.authors       = ['Markus Frosch']
  spec.email         = ['markus@lazyfrosch.de']
  spec.description   = %q{XMPP/Jabber adapter for Lita.}
  spec.summary       = %q{XMPP/Jabber adapter for the Lita chat robot.}
  spec.homepage      = 'https://github.com/lazyfrosch/lita-xmpp'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'adapter'}

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.4.3'
  spec.add_runtime_dependency 'xmpp4r', '>= 0.5.6'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.0.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'
end
