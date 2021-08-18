Rails.application.routes.draw do

  get '/add_to_book/:id', to: 'spells#add_to_book', as: 'add_to_book'
  get '/add_spell/:id', to: 'books#add_spell', as: 'add_spell'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :spells
  resources :books
  resources :spell_books, only: [:create, :destroy]
end
