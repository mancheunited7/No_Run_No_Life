Rails.application.routes.draw do
  get 'mypages/index'

  root 'top#index'

end
