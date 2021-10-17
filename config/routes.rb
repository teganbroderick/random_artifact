Rails.application.routes.draw do
    root "random_artifact#index"

    get "/random_artifact", to: "random_artifact#index"
end
