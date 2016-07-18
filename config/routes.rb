Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get "/about" => "pages#about"

  

  # about user profile
  resources :users, only: [:show, :update]
  resources :resumes, only: [:create, :update, :new]
  get "/my_resume" => "resumes#my_resume"
  get "/edit_my_resume" => "resumes#edit_my_resume"
  get "/fav_companies" => "users#fav_companies"
  get "/fav_jobs" => "users#fav_jobs"
  get "/fav_articles" => "users#fav_articles"
  get "/account" => "users#account"

  resources :career_posts

  resources :companies do
    member do
      post :fav
      post :un_fav
    end

  	resources :jobs, :controller => "jobs"
  end

  namespace :admin do
    resources :career_posts
    resources :companies do
      resources :jobs
    end
  end

  root to: "pages#index"

end
