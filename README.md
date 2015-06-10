# RailsMarkdownTemplates

## Synopsis

The `rails_markdown_templates` gem allows the use of Markdown as a Rails
template language. A leading metadata block is parsed, and the metadata
made available as HTML `<meta />` tags via a `content_for` block with a
customisable key. Embedded Ruby may be used in Markdown templates.

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

No configuration is necessary to get started. By default, the keys for the
`content_for` blocks are `:metadata_tags` and `:metadata_json`; if you wish
to change these, then create a file in the
`config/initializers` directory, containing code such as the following.

```ruby
# Set the metadata content keys for the Markdown template handler
RailsMarkdownTemplates.metadata_tags_key = :my_metadata_tags
RailsMarkdownTemplates.metadata_json_key = :my_metadata_json
```

## Embedded Ruby handling

Markdown templates may contain standard erb tags.

## Metadata handling

Markdown templates may optionally have a leading YAML metadata block; for
example:

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

The `metadata_tags_key` and `metadata_tags_json` attributes define the names
of the content blocks into which metadata will be placed. Metadata can be
retrieved in Rails views using `yield` calls; for example:

```html
<head>
  <!-- Output meta tags -->
  <%= yield :metadata_tags %>

  <!-- Use metadata in JavaScript -->
  <script>
    var metadata = <%= yield :metadata_json %>;
  </script>
</head>
```

The call to `yield` the `:metadata_tags` content block will output HTML
`<meta />` tags: one for each metadata item present in the original YAML
metadata block.

The call to `yield` the `:metadata_json` content block will output the
metdata as JSON. This will typically be useful as a mechanism by which
metadata may be made available to JavaScript.

> There is a restriction, however: you cannot `yield` the metadata content
> block from within the markdown template in which the metadata is defined.
>
> This is because the ERB tags are evaluated *before* the template is
> handed off to the Markdown parser.

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
