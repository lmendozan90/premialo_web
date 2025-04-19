Rails.application.routes.draw do
  resources :companies do
    resources :rewards
  end

  root "rewards#index"
end
