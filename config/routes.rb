Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root 'top#index'
  resources :mypages, only:[:index]
  namespace :competition_result do
    resources :run_records
  end
  namespace :practice do
    resources :run_records
  end
  devise_for :users, controllers:{
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks#sns_login"
  }
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :competition_infos, only:[:new, :create, :index] do
    collection do
      get 'search'
    end
  end
  resources :user_comp_schedules, only:[:create]
  resources :boards, shallow: true do
    resources :comments, only:[:create, :edit, :update, :destroy]
  end
  resources :users, only:[:index, :show]
end
