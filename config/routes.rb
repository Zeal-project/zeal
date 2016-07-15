Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get "/about" => "pages#about"

  resources :users do
    resources :resumes do
      collection do
        get 'my_resume'
      end
    end
  end

  resources :users 

  resources :career_posts

  resources :companies do
  	resources :jobs, :controller => "jobs"
  end

  root to: "pages#index"

end
