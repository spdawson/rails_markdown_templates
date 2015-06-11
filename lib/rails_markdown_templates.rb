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

require 'rails_markdown_templates/core'
require 'rails_markdown_templates/renderer'
require 'rails_markdown_templates/version'

module RailsMarkdownTemplates
  mattr_accessor :metadata_tags_key, :metadata_json_key, :redcarpet_options
  @@metadata_tags_key = :metadata_tags
  @@metadata_json_key = :metadata_json
  @@redcarpet_options = {
    no_intra_emphasis: true,
    tables: true,
    fenced_code_blocks: true,
    autolink: true,
    disable_indented_code_blocks: true,
    strikethrough: true,
    lax_spacing: true,
    space_after_headers: true,
    superscript: true,
    underline: true,
    highlight: true,
    quote: true,
    footnotes: true
  }
end
