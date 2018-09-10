Rails.application.routes.draw do
  get "tree/:name", to: "tree#show"
end
