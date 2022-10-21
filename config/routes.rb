Rails.application.routes.draw do
  get 'pages/index'
  get '/' ,to: 'pages#index'
end
