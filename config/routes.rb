Rails.application.routes.draw do
  root 'top#index'
  resources :mypages, only:[:index]
end
