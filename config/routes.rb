Rails.application.routes.draw do
  get 'profile/edit_profile'
  post 'profile/edit_profile'
  get 'password/reset_password'
  get 'account/signup'
  post 'account/signup'
  get 'account/login'
  post 'account/login'
  get 'account/dashboard'
  get 'password/forget_password'
  post 'password/forget_password'
  post 'password/reset_password'
  get 'account/logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
