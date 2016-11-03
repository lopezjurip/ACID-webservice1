Rails.application.routes.draw do
  root to: redirect('/rest/login')

  namespace :rest do
    get 'login', to: 'login#index', format: 'html'
    post 'login', to: 'login#create', format: 'json'
  end
end
