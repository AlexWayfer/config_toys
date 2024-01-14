# frozen_string_literal: true

require_relative 'lib/config_toys/version'

Gem::Specification.new do |spec|
	spec.name          = 'config_toys'
	spec.version       = ConfigToys::VERSION
	spec.authors       = ['Alexander Popov']
	spec.email         = ['alex.wayfer@gmail.com']

	spec.summary       = 'Toys template for applications configuration.'
	spec.description   = <<~DESC
		Toys template for applications configuration.
	DESC
	spec.license = 'MIT'

	spec.required_ruby_version = '>= 2.7', '< 4'

	github_uri = "https://github.com/AlexWayfer/#{spec.name}"

	spec.homepage = github_uri

	spec.metadata = {
		'bug_tracker_uri' => "#{github_uri}/issues",
		'changelog_uri' => "#{github_uri}/blob/v#{spec.version}/CHANGELOG.md",
		'documentation_uri' => "http://www.rubydoc.info/gems/#{spec.name}/#{spec.version}",
		'homepage_uri' => spec.homepage,
		'rubygems_mfa_required' => 'true',
		'source_code_uri' => github_uri,
		'wiki_uri' => "#{github_uri}/wiki"
	}

	spec.files = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt', 'CHANGELOG.md']

	spec.add_runtime_dependency 'example_file', '~> 0.5.0'
	spec.add_runtime_dependency 'toys-core', '~> 0.15.3'
end
