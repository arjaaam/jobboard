Rails.application.routes.draw do
 root 'jobs#index'
  get    '/',  to: 'jobs#new'
  get    '/show',  to: 'jobs#show'
  post    '/create',  to: 'jobs#create'
  post    '/createuser',  to: 'users#create'
 resources :jobs
 resources :categories
 resources :users
 #resources :active_storage_blobs
 #resources :active_storage_attachments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
