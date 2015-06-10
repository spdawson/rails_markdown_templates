# RailsMarkdownTemplates

The `rails_markdown_templates` gem allows the use of Markdown as a Rails
template language. A leading metadata block is parsed, and the metadata
made available via a `content_for` block with a customisable key. Embedded
Ruby may be used in Markdown templates.

## Installation

### Rails with Bundler

Add the following line to the Gemfile of the application.
```ruby
gem 'rails_markdown_templates'
```
Then run
```sh
bundle
```

### Manual installation

Run the following command.
```sh
gem install rails_markdown_templates
```

## Rails configuration

Create the file `config/initializers/rails_markdown_templates.rb`, containing
the following code.
```ruby
# Hook up the Markdown template handler
ActionView::Template::Handlers::Markdown.metadata_content_key = :metadata
ActionView::Template.register_template_handler :md,
  ActionView::Template::Handlers::Markdown
```

## Embedded Ruby handling

Markdown templates may contain standard erb tags.

## Metadata handling

Markdown templates may optionally have a leading YAML metadata block; for
example
```md
---
title: This is the title
description: This is some sort of page
keywords: page, some, sort, whatever
author: Bob Dylan
---

# A document

Here is part of the document; a very meaningful part.
```

The `metadata_content_key` attribute defines the name of the content block
into which metadata will be placed. Metadata can be retrieved in Rails views
using a yield call:
```ruby
<%= yield :metadata %>
```

## License

Copyright 2015 Simon Dawson <spdawson@gmail.com>

rails_markdown_templates is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

rails_markdown_templates is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with rails_markdown_templates. If not, see
<http://www.gnu.org/licenses/>.
