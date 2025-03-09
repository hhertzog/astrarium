# frozen_string_literal: true

require_relative "lib/astrarium/version"

Gem::Specification.new do |spec|
  spec.name          = "astrarium"
  spec.version       = Astrarium::VERSION
  spec.authors       = ["Hannah Hertzog"]
  spec.email         = ["hhertzog@gmail.com"]

  spec.summary       = "A Ruby gem for calculating astrological planetary positions and house cusps using Swiss Ephemeris."
  spec.description   = "Astrarium calculates planetary signs & longitudes, house cusps & longitudes, and planet-to-house placements using swe4r (Swiss Ephemeris wrapper)."
  spec.homepage      = "https://github.com/hhertzog/astrarium"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"]      = spec.homepage
  spec.metadata["source_code_uri"]   = "https://github.com/hhertzog/astrarium"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{\A(?:bin/|test/|spec/|features/|\.git|\.github|appveyor|Gemfile)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependencies
  spec.add_dependency "swe4r", "~> 0.0.2"
end
