Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :neighborhoods do
    resources :parks
  end
get "find/random", to: "neighborhoods#random"
get "find/search", to: "neighborhoods#search"
end
