# Inspired by https://github.com/rails/rails/pull/37918
module HeadHelpers
  def title
    [ current_page.data.title.presence, "Morgane Crec'hmine Latouche Thérapeute Réflexologue à Cancale" ].compact.join(' · ')
  end

  def description
    current_page.data.description || "Vous accompagner vers un mieux-vivre grâce à la réflexologie plantaire thérapeutique"
  end
end
