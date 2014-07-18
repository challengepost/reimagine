Dummy::Application.routes.draw do
  get '/large_12', to: 'shared_views#large_12'
  get '/buttons', to: 'application#buttons'
  get '/type', to: 'application#type'
  get '/forms', to: 'application#forms'
  get '/tabs', to: 'application#tabs'
  get '/pagination', to: 'application#pagination'

  root to: 'application#show'
end
