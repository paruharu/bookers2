Rails.application.routes.draw do

  devise_for :users
  root to: 'home#top'
  get '/home/about', to: 'home#about'
  patch '/users/:id', to: 'users#update' 
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  
  resources :books, only: [:new, :create, :index, :show, :destroy] do
end

resources :users, only: [:show, :index, :edit]

end
