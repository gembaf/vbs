Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #-- main
  root to: 'main#index'

  #-- ragnarok
  namespace :ragnarok do
    root to: 'main#index'
    get 'medallions' => 'medallions#index'
  end
end

