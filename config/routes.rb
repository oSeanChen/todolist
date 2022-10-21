Rails.application.routes.draw do

  get '/' ,to: 'pages#index'

  resources :categories
end
