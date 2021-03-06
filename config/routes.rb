Rails.application.routes.draw do
  # Root
  root 'static_pages#home'

  # Backend
  namespace :backend do
    resources :users
    resources :trials
    resources :memberships
  end

  # Front end
  resources :trials,
            :memberships, only: [:new, :create, :index]
  get '/memberships/thank-you', to: 'memberships#confirmation'
  get '/trial-membership/thank-you', to: 'trials#confirmation'

  #get  '/signup',  to: 'users#new'
  #post '/signup',  to: 'users#create'

  # Sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # Classes
  get '/classes',                     to: 'static_pages#classes'
  get '/classes/ab-solution',         to: 'static_pages#ab_solution'
  get '/classes/bootcamp',            to: 'static_pages#bootcamp'
  get '/classes/boxing',              to: 'static_pages#boxing'
  get '/classes/circuit-training',    to: 'static_pages#circuit_training'
  get '/classes/cycle-fit',           to: 'static_pages#cycle_fit'
  get '/classes/cycle-pump',          to: 'static_pages#cycle_pump'
  get '/classes/hiit',                to: 'static_pages#hiit'
  get '/classes/kettle-x-fit',        to: 'static_pages#kettle_x_fit'
  get '/classes/lbt',                 to: 'static_pages#lbt'
  get '/classes/mma',                 to: 'static_pages#mma'
  get '/classes/pilates',             to: 'static_pages#pilates'
  get '/classes/pilates-hiit',        to: 'static_pages#pilates_hiit'
  get '/classes/pumped',              to: 'static_pages#pumped'
  get '/classes/rig-assault',         to: 'static_pages#rig_assault'
  get '/classes/strength-and-conditioning',             to: 'static_pages#strength_and_conditioning'
  get '/classes/total-body',          to: 'static_pages#total_body'
  get '/classes/trx',                 to: 'static_pages#trx'
  get '/classes/ultimate-endurance',  to: 'static_pages#ultimate_endurance'

  get '/facilities',                  to: 'static_pages#facilities'
  get '/timetables',                  to: 'static_pages#timetables'

  # Contact
  get '/contact',                     to: 'messages#new', as: 'new_message'
  post '/contact',                    to: 'messages#create', as: 'create_message'

  # Letter opener path for development only
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
