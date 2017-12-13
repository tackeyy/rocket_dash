Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'home#index'

  resource :users do
    resource :sign_up, controller: 'users/sign_up', only: %i[show create]
    resource :sign_in, controller: 'users/sign_in', only: %i[show create]
    resource :sign_out, controller: 'users/sign_out', only: %i[destroy]
  end

  resources :users do
    resources :activate, controller: 'users/activate', only: %i[index]
  end
end
