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

require 'redcarpet'
require 'rails_markdown_templates/renderer'

module ActionView
  module Template::Handlers
    # Rails template handler for markdown
    class Markdown
      class_attribute :default_format
      self.default_format = Mime::HTML

      def self.erb
        @erb ||= ActionView::Template.registered_template_handler :erb
      end

      # @param template [ActionView::Template]
      # @return [String] Ruby code that when evaluated will return the
      #   rendered content
      def self.call(template)
        # Evaluate embedded Ruby
        compiled_source = erb.call(template)

        <<-RUBY_CODE
markdown = Redcarpet::Markdown.new(RailsMarkdownTemplates::Renderer)
output = markdown.render(begin;#{compiled_source};end)
content_for(RailsMarkdownTemplates.metadata_tags_key,
            markdown.renderer.metadata_tags)
content_for(RailsMarkdownTemplates.metadata_json_key,
            markdown.renderer.metadata_json)
output
        RUBY_CODE
      end
    end
  end
end

# Register the Markdown template handler
ActionView::Template.register_template_handler :md,
  ActionView::Template::Handlers::Markdown
