# Copyright 2015 Simon Dawson <spdawson@gmail.com>

# This file is part of rails_markdown_templates.
#
# rails_markdown_templates is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# rails_markdown_templates is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with rails_markdown_templates. If not, see
# <http://www.gnu.org/licenses/>.

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_markdown_templates/version'

Gem::Specification.new do |s|
  s.authors       = ["Simon Dawson"]
  s.email         = ["spdawson@gmail.com"]
  s.description   = %q{A gem for using Markdown as a Rails template language}
  s.summary       = %q{Markdown template handling for Rails}
  s.homepage      = "https://github.com/spdawson/rails_markdown_templates"

  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.name          = "rails_markdown_templates"
  s.require_paths = ["lib"]
  s.version       = RailsMarkdownTemplates::VERSION
  s.license       = "GPL-3.0"

  s.add_dependency "redcarpet", "~> 3.0"

  s.add_development_dependency "rake", "~> 0"
end
