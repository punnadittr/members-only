Rails.application.routes.draw do
  root 'posts#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#delete'
  get     '/new_post', to: 'posts#new'
  post    '/new_post', to: 'posts#create'
end
