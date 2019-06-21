Rails.application.routes.draw do
  resources :users, only: [:create, :show] do
    collection do
      post 'login'
    end
  end 

  resources :accounts, only: [:create, :show] 
  resources :categories, only: [:create, :show] 
  resources :incomes, only: [:create, :show] 
  resources :expenses, only: [:create, :show] 



 
  
end
