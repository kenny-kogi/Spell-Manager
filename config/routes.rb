Rails.application.routes.draw do

  get '/add_to_book/:id', to: 'books#add_to_book', as: 'add_to_book'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :spells
  resources :books
  resources :spell_books, only: [:new, :create, :destroy]
end
