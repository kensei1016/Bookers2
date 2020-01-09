Rails.application.routes.draw do
  get 'books/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end
