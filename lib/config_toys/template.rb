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
						require 'example_file'
						ExampleFile.all(template.config_dir).each(&:actualize_regular_file)
					end
				end
			end
		end
	end
end
