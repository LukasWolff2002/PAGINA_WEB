Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check



  # Defines the root path route ("/")
  # root "posts#index"
  root "trello#index"

  resources :trello
  resources :work_teams do
    resources :boards
    member do
      get 'add_users'
      patch 'update_users'
    end
  end
  resources :boards do
    #member do
   #   patch 'move'
    #end
    resources :tasks do 
      member do
        patch 'move'
      end
    end
  end
  resources :users
  resources :tasks

end