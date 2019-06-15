Rails.application.routes.draw do
  resources :users, only: [:create, :index] do
    collection do
      post 'login'
    end
  end 
end
