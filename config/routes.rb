Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      resources :users, only: [:create, :show] do
        collection do
          post "login"
        end
      end
      resources :accounts, only: [:create, :show, :update, :destroy] do
        collection do
          post "set_balance"
        end
      end
      resources :categories, only: [:create, :index] do
        collection do
          post "chart"
        end
      end
      resources :incomes, only: [:create, :show] do
        collection do
          post "find"
        end
      end
      resources :expenses, only: [:create, :show] do
        collection do
          post "find"
        end
      end
      resources :cycles, only: [:create, :show] do
        collection do
          post "current"
          post "complete_cycle"
        end
      end
    end
  end

  # * adjust the api with proper api structure (namespaces, folder etc)

  # * maybe search and implement for api authentication with some sort of api keys

  # * maybe definde the default value for the descriptions to "no description provided", so if the user doesn't provide one the field is filled with something instead of just being blank

  # * add validation to the models where its necessary

  # * think about the use of the joined table with the accounts and cycles, if its not going to change anything just remove it

end
