Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: "users/sessions" }
  devise_scope :user do
    post '/users', to: 'users/registrations#create'
    get '/users/password', to: 'devise/passwords#new'
    get '/users', to: 'devise/registrations#new'
  end
  root to: 'pages#index'

  resources :categories, except:[:show] do
    resources :tasks, shallow: true
  end

end
