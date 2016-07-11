Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :resumes
  end

  resources :career_posts do
  end

  resources :companies do
  end

  root to: "career_posts#index"

end
