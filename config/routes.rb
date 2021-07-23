Rails.application.routes.draw do

  root 'spell_books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
  resources :spells
  resources :spell_books
end
