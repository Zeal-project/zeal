Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/about" => "pages#about"
  get "/index" => "pages#index"
  get "/search_result" => "pages#search_result"


  # about user profile
  resources :users, only: [:show, :update]
  resources :resumes, only: [:create, :update, :new]
  get "/my_resume" => "resumes#my_resume"
  get "/edit_my_resume" => "resumes#edit_my_resume"
  get "/fav_companies" => "users#fav_companies"
  get "/fav_jobs" => "users#fav_jobs"
  get "/fav_career_posts" => "users#fav_career_posts"
  get "/account" => "users#account"
  get "viewed_history" => "users#viewed_history"

  resources :career_posts do
    member do
      post :fav
      post :un_fav
      post :recommend
    end
  end

  resources :companies do
    member do
      post :fav
      post :un_fav
      post :write_comment
      get "/comments" => "companies#comments"
    end

  	resources :jobs, :controller => "jobs" do
      member do
        post :fav
        post :un_fav
      end
    end
  end


  namespace :admin do
    resources :career_posts
    resources :companies do
      resources :jobs
    end
  end

  namespace :hr_sys do
    get "/index" => "recruit#index"
    get "/candidates" => "recruit#candidates"
    get "/interview_list" => "recruit#interview_list"
    get "/offered_candidates" => "recruit#offered_candidates"
  end

  root to: "pages#index"

end
