Rails.application.routes.draw do
  resources :requests
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }

  ########  ##     ## ########  ##       ####  ######
  ##     ## ##     ## ##     ## ##        ##  ##    ##
  ##     ## ##     ## ##     ## ##        ##  ##
  ########  ##     ## ########  ##        ##  ##
  ##        ##     ## ##     ## ##        ##  ##
  ##        ##     ## ##     ## ##        ##  ##    ##
  ##         #######  ########  ######## ####  ######

  namespace :public, as: '', path: '' do
    get 'landing' => 'pages#landing'
  end

  ##          ###    ##      ## ##    ## ######## ########
  ##         ## ##   ##  ##  ##  ##  ##  ##       ##     ##
  ##        ##   ##  ##  ##  ##   ####   ##       ##     ##
  ##       ##     ## ##  ##  ##    ##    ######   ########
  ##       ######### ##  ##  ##    ##    ##       ##   ##
  ##       ##     ## ##  ##  ##    ##    ##       ##    ##
  ######## ##     ##  ###  ###     ##    ######## ##     ##

  namespace :requestor, as: '', path: '' do
    resources :requestors, only: [ :index ]
  end

   ######  ######## ######## ##    ## ######## ########
  ##    ## ##       ##       ##   ##  ##       ##     ##
  ##       ##       ##       ##  ##   ##       ##     ##
   ######  ######   ######   #####    ######   ########
        ## ##       ##       ##  ##   ##       ##   ##
  ##    ## ##       ##       ##   ##  ##       ##    ##
   ######  ######## ######## ##    ## ######## ##     ##

  namespace :searcher, as: '', path: '' do
    resources :searchers, only: [ :index ]
  end

     ###    ########  ##     ## #### ##    ##
    ## ##   ##     ## ###   ###  ##  ###   ##
   ##   ##  ##     ## #### ####  ##  ####  ##
  ##     ## ##     ## ## ### ##  ##  ## ## ##
  ######### ##     ## ##     ##  ##  ##  ####
  ##     ## ##     ## ##     ##  ##  ##   ###
  ##     ## ########  ##     ## #### ##    ##

  namespace :admin do
    resources :searchers, only: [ :index ]
    resources :requestors, only: [ :index ]
    resources :request_types, except: [ :destroy ]
  end

  root 'public/pages#landing'
end
