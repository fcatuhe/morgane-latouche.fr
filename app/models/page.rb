Page = Decant.define(dir: "content/pages", ext: "html.erb") do
  frontmatter :title
  frontmatter :description

  def initialize(...)
    super
    Meta.title = title
    Meta.description = description
  end
end
