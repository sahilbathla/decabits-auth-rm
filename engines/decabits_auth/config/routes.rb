DecabitsAuth::Engine.routes.draw do
  resources :account_registrations
  post '/account/login', to: 'account_logins#login'
end
