Rails.application.routes.draw do
  root "fights#index"

  resources :fighters
  resources :fights
end
