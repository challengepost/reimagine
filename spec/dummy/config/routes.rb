Dummy::Application.routes.draw do
  match '/large_12', to: 'shared_views#large_12'
  match '/alerts', to: 'application#alerts'
  match '/buttons', to: 'application#buttons'
  match '/colors', to: 'application#colors'
  match '/forms', to: 'application#forms'
  match '/lists', to: 'application#lists'
  match '/logos', to: 'application#logos'
  match '/pagination', to: 'application#pagination'
  match '/tabs', to: 'application#tabs'
  match '/typography', to: 'application#typography'

  root to: 'application#typography'
end
