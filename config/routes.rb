Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get "/about" => "pages#about"

  resources :users 

  #routes about user profile
  resources :resumes, only: [:create, :update, :new]
  get "/my_resume" => "resumes#my_resume"
  get "/edit_my_resume" => "resumes#my_resume"
  get "/fav_companies" => "profile#fav_companies"
  get "/fav_jobs" => "profile#fav_jobs"
  get "/fav_articles" => "profile#fav_articles"
  get "/account" => "profile#account"


  resources :users 

  resources :career_posts

  resources :companies do
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
