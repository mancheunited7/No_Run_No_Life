Rails.application.routes.draw do
  root 'top#index'
  resources :mypages, only:[:index]
  resources :competition_infos, only:[:new, :create, :index]
end
