# frozen_string_literal: true

require 'toys-core'

module ConfigToys
	## Define toys for benchmark
	class Template
		include Toys::Template

		attr_reader :config_dir

		def initialize(config_dir:)
			@config_dir = config_dir
		end

		on_expand do |template|
			tool :config do
				tool :check do
					desc 'Check config files'

					to_run do
						check_editor_environment_variable

						# require "#{context_directory}/config/config"

						require 'example_file'
						ExampleFile.all(template.config_dir).each(&:actualize_regular_file)
					end

					private

					def check_editor_environment_variable
						return unless ENV['EDITOR'].to_s.empty?

						abort '`EDITOR` environment variable is empty, see README'
					end
				end
			end
		end
	end
end
