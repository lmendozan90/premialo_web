Rails.application.routes.draw do
  resources :rewards

  root "rewards#index"
end
