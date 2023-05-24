Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  resources :characteristics
  resources :features
  resources :ministers
  resources :places do
    resources :parishioners
  end
  resources :parishioners do
    resources :visits
  end
  resources :streets
  resources :visits
  root "streets#index"
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]
end
