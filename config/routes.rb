Rails.application.routes.draw do
  root 'top#index'
  resources :mypages, only:[:index]
  resources :competition_infos, only:[:new, :create, :index] do
    collection do
      get 'search'
    end
  end
end
