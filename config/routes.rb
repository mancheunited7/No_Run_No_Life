Rails.application.routes.draw do
  root 'top#index'
  resources :mypages, only:[:index]
  resources :competition_infos, only:[:new, :create, :index]
  get 'competition_infos/search', to: 'competition_infos#search'
end
