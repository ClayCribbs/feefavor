Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  namespace :public, as: '', path: '' do
    get 'landing' => 'pages#landing'
  end

  root 'public/pages#landing'
end
