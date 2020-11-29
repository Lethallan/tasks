Rails.application.routes.draw do
  root 'projects#index'

  resources :projects, only: :index do
    resources :todos, shallow: true, except: %i[index destroy]
  end
end
