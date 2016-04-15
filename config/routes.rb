Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'static_pages#home'
  get 'about' , to: 'static_pages#about'
  get 'terms' , to: 'static_pages#terms'

  resources :articles
  resources :videos
end
