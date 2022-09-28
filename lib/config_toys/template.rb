# frozen_string_literal: true

require 'toys-core'

require 'example_file'

module ConfigToys
	## Define toys for benchmark
	class Template
		include Toys::Template

		attr_reader :config_dir

		def initialize(config_dir: -> { "#{context_directory}/config" })
			@config_dir = config_dir.is_a?(Proc) ? instance_exec(&config_dir) : config_dir
		end

		on_expand do |template|
			tool :config do
				tool :initialize do
					desc 'Initialize config files'

					to_run do
						ExampleFile.all(template.config_dir).each(&:initialize_regular_file)
					end
				end

				alias_tool :init, :initialize

				tool :check do
					desc 'Check config files'

					self::ADDITIONAL_CHOICES = {
						skip: -> { puts "#{@regular_basename} remains unchanged" },
						quit: -> { exit }
					}.freeze

					self::SEPARATOR = <<~SEPARATOR

						---

					SEPARATOR

					to_run do
						ExampleFile.all(template.config_dir).each_with_index do |example_file, index|
							example_file.choices.merge! self.class::ADDITIONAL_CHOICES
							example_file.question_prefix = self.class::SEPARATOR if index.positive?
							example_file.actualize_regular_file
						end
					end
				end
			end
		end
	end
end
