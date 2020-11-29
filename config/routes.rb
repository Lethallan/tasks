Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :todos, shallow: true, except: :index
  end
end
