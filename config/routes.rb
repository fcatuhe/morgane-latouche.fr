Rails.application.routes.draw do
  get "/.well-known/*", to: ->(_env) { [ 204, {}, [] ] }

  get "/404", to: "pages#show", slug: "404", as: :not_found

  root "pages#show", slug: "index"
end
