Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  resource :users do
    resource :sign_up, controller: 'users/sign_up', only: %i[show create]
    resource :sign_in, controller: 'users/sign_in', only: %i[show create]
    resource :sign_out, controller: 'users/sign_out', only: %i[destroy]
  end
end
