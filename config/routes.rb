Rails.application.routes.draw do
  root "random_artifact#index"

  get "/random_artifact", to: "random_artifact#index"

  resource :messages do
    collection do
      post 'reply'
    end
  end
end
