Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks#sns_login"
  }
  root 'top#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :mypages, only:[:index]
  resources :competition_infos, only:[:new, :create, :index] do
    collection do
      get 'search'
    end
  end
end
