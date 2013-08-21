Dummy::Application.routes.draw do
  match '/large_12', to: 'shared_views#large_12'
  match '/buttons', to: 'application#buttons'

  root to: 'application#show'
end
