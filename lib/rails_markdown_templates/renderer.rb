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

require 'English'
require 'json'
require 'redcarpet'
require 'yaml'

module RailsMarkdownTemplates
  # Custom Redcarpet HTML renderer for Markdown with a metadata block
  class Renderer < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants

    attr_accessor :metadata

    def initialize(options={})
      super RailsMarkdownTemplates.redcarpet_options.merge(options)
      @metadata = {}
    end

    # Get HTML tag(s) for the metadata
    def metadata_tags
      metadata.map do |k,v|
        "<meta name=\"#{k}\" content=\"#{v}\" />"
      end.join("\n").html_safe
    end

    # Get JSON for the metadata
    def metadata_json
      metadata.to_json.html_safe
    end

    # Render before any other elements
    def doc_header
      nil
    end

    # Rendered after all the other elements
    def doc_footer
      nil
    end

    # Preprocess the whole document before the rendering process
    def preprocess(full_document)
      # Extract and store metadata block from start of document
      #
      # N.B. Implementation "borrowed" from Metadown:
      #
      #  https://github.com/steveklabnik/metadown
      full_document =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
      self.metadata = YAML.load($1) if $1

      # Return the document without the leading metadata block
      $POSTMATCH or full_document
    end

    # Postprocess the whole document after the rendering process
    #
    # N.B. Cannot use postprocess: SmartyPants is using the single callback
    # slot
    #  def postprocess(full_document)
    #    full_document
    #  end
  end
end
