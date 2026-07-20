# frozen_string_literal: true

require_relative "lib/num_decouverte_personnalite/version"

Gem::Specification.new do |spec|
  spec.name = "num_decouverte_personnalite"
  spec.version = NumDecouvertePersonnalite::VERSION
  spec.authors = ["stephaneworkspace"]
  spec.email = ["stephane@bressani.dev"]

  spec.summary = "Utilitaire pour la numérologie"
  spec.description = "Etude de la personnalite numérologique"
  spec.homepage = "https://github.com/stephaneworkspace/num_decouverte_personnalite"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"
  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "source_code_uri" => spec.homepage,
    "changelog_uri" => "#{spec.homepage}/blob/main/CHANGELOG.md"
  }
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/ .rubocop.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
