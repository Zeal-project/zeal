Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
  end

  resources :career_posts do
  end

  root to: "career_posts#index"

end
