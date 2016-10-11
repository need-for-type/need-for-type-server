Rails.application.routes.draw do
  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        get :highscores, to: 'highscores#index'
        post :highscores, to: 'highscores#create'
      end
    end
  end
end
