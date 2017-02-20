Rails.application.routes.draw do
  root 'static_pages#home'

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
  get '/classes/s-and-c',             to: 'static_pages#s_and_s'
  get '/classes/total-body',          to: 'static_pages#total_body'
  get '/classes/trx',                 to: 'static_pages#trx'
  get '/classes/ultimate-endurance',  to: 'static_pages#ultimate_endurance'

  get '/facilities',                  to: 'static_pages#facilities'
  get '/memberships',                 to: 'static_pages#memberships'
  get '/contact',                     to: 'static_pages#contact'

  #get '/classes/:class', to: 'classes#show'
end
