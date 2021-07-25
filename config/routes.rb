Rails.application.routes.draw do

  root 'spells#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :spells
  resources :books
  resources :spell_books, only: [:new, :create, :destroy]
end
