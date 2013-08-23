Dummy::Application.routes.draw do
  match '/large_12', to: 'shared_views#large_12'
  match '/buttons', to: 'application#buttons'
  match '/type', to: 'application#type'

  root to: 'application#show'
end
