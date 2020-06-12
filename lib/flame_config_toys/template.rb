# frozen_string_literal: true

require 'toys-core'

module FlameConfigToys
	## Define toys for benchmark
	class Template
		include Toys::Template

		attr_reader :application

		def initialize(application:)
			@application = application
		end

		on_expand do |template|
			tool :config do
				tool :check do
					desc 'Check config files'

					to_run do
						check_editor_environment_variable

						# require "#{context_directory}/config/config"

						example_files(template.application).each(&:actualize_regular_file)
					end

					private

					def example_files(application)
						require 'example_file'
						ExampleFile.all application.config[:config_dir]
					end

					def check_editor_environment_variable
						return unless ENV['EDITOR'].to_s.empty?

						abort '`EDITOR` environment variable is empty, see README'
					end
				end
			end
		end
	end
end
