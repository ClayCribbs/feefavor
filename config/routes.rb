Rails.application.routes.draw do
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

  namespace :lawyer, as: '', path: '' do
    resources :lawyers, only: [ :index ]
  end

   ######  ######## ######## ##    ## ######## ########
  ##    ## ##       ##       ##   ##  ##       ##     ##
  ##       ##       ##       ##  ##   ##       ##     ##
   ######  ######   ######   #####    ######   ########
        ## ##       ##       ##  ##   ##       ##   ##
  ##    ## ##       ##       ##   ##  ##       ##    ##
   ######  ######## ######## ##    ## ######## ##     ##

  namespace :seeker, as: '', path: '' do
    resources :seekers, only: [ :index ]
  end

     ###    ########  ##     ## #### ##    ##
    ## ##   ##     ## ###   ###  ##  ###   ##
   ##   ##  ##     ## #### ####  ##  ####  ##
  ##     ## ##     ## ## ### ##  ##  ## ## ##
  ######### ##     ## ##     ##  ##  ##  ####
  ##     ## ##     ## ##     ##  ##  ##   ###
  ##     ## ########  ##     ## #### ##    ##

  namespace :admin do
    resources :seekers, only: [ :index ]
    resources :lawyers, only: [ :index ]
    resources :document_search_types, except: [ :destroy ]
  end

  root 'public/pages#landing'
end
