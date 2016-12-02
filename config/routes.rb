Rails.application.routes.draw do
  #root "users#sign_in"
  #devise_for :users
  resources :users  do
    get 'report', :on => :collection
  end
#  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations' },path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
    resources :achievements
  root 'publications#index'
  resources :publications
  resources :buys do
    get 'report', :on => :collection
    get 'result_report', :on => :collection
  end
  resources :qualifications
  resources :comments do
    resources :answers
  end
  resources :ofrecimientos do
    get 'accept', :on => :collection
  end
end
