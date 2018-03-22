Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :mypages, only:[:index]
  resources :competition_infos, only:[:new, :create]
  namespace :run_record do
    resources :practices, only:[:new, :create]
  end
  namespace :competition_result do
    resources :run_records, only:[:new, :create]
  end
end
