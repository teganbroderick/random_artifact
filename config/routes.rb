Rails.application.routes.draw do
  root 'homepage#index'

  namespace :api do
    namespace :v1 do
      get 'random_artifact/index'
    end
  end
  
  resource :messages do
    collection do
      post 'reply'
    end
  end
end
