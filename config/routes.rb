Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #-- main
  root to: 'main#index'

  #-- ragnarok
  get 'ragnarok' => 'ragnarok#index'
  get 'ragnarok/medallions' => 'ragnarok#medallions'
  get 'ragnarok/items' => 'ragnarok#items'
  get 'ragnarok/units' => 'ragnarok#units'
  get 'ragnarok/search' => 'ragnarok#search'
end

