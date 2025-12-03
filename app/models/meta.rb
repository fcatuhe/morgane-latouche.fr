class Meta < ActiveSupport::CurrentAttributes
  SITE_TITLE = "Morgane Latouche Réflexologue Cancale".freeze
  DEFAULT_DESCRIPTION = "Réflexologue diplômée, je vous accompagne vers un mieux-vivre grâce à la réflexologie plantaire thérapeutique. Cabinet à Cancale, Bretagne.".freeze
  DEFAULT_IMAGE = "og_image.jpg".freeze
  AUTHOR = "Morgane Crec'hmine Latouche".freeze
  SITE_NAME = "Morgane Crec'hmine Latouche".freeze

  attr_writer :title, :description

  def title
    [ @title, SITE_TITLE ].compact_blank.join(" · ")
  end

  def description
    @description.presence || DEFAULT_DESCRIPTION
  end

  def image
    DEFAULT_IMAGE
  end

  def author
    AUTHOR
  end

  def site_name
    SITE_NAME
  end

  def robots_content
    "index, follow"
  end
end
