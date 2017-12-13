Rails.application.routes.draw do
  namespace :users do
    get 're_send_activation_token/create'
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'home#index'

  resource :users, only: [] do
    resource :sign_up, controller: 'users/sign_up', only: %i[show create]
    resource :sign_in, controller: 'users/sign_in', only: %i[show create]
    resource :sign_out, controller: 'users/sign_out', only: %i[destroy]

    resources :activate, controller: 'users/activate', only: %i[show]
    resource :resend_activation_token, controller: 'users/resend_activation_token', only: %i[show create]
  end
end
