Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :mypages, only:[:index]
  resources :competition_infos, only:[:new, :create]
end
