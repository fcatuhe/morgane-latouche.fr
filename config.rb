# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :livereload

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

set :markdown_engine, :kramdown

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
page '/index.html', layout: 'home'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

helpers do
  def url_for(path_or_resource, options = {})
    super(path_or_resource, options).delete_suffix('.html')
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css

  require 'terser'
  activate :minify_javascript, compressor: Terser.new

  activate :asset_hash
end

# Default variables
config[:robots_content] = 'noindex, nofollow'
config[:robots_partial] = 'robots_staging'

# Environment specific configuration, variables and overrides
configure :development do
  require 'rack/middleman/optional_html'
  use ::Rack::OptionalHtml, {}

  config[:base_url] = ENV.fetch('BASE_URL', 'http://localhost:4567')
end

configure :staging do
  config[:base_url] = ENV.fetch('BASE_URL', 'https://fcatuhe.github.io/morgane-latouche')
end

configure :production do
  config[:base_url] = ENV.fetch('BASE_URL', 'https://morgane-latouche.fr')
  config[:robots_content] = 'index, follow'
  config[:robots_partial] = 'robots_production'
end
