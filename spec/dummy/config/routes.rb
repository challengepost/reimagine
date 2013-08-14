Dummy::Application.routes.draw do
  match '/large_12', to: 'shared_views#large_12'

  root to: 'application#show'
end
