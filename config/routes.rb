Rails.application.routes.draw do
  root 'top#index'
  resources :mypages, only:[:index]
  resources :competition_infos, only:[:new, :create]
  namespace :competition_result do
    resources :run_records, only:[:new, :create]
  end
  namespace :practice do
    resources :run_records, only:[:new, :create]
  end
  devise_for :users, controllers:{
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks#sns_login"
  }

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :mypages, only:[:index]
  resources :competition_infos, only:[:new, :create, :index] do
    collection do
      get 'search'
    end
  end
end
