Rails.application.routes.draw do
  #root "users#sign_in"
  #devise_for :users
  resources :users
#  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations' },path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
    resources :achievements
  root 'publications#index'
  resources :publications
end
