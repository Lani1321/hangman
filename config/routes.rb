Rails.application.routes.draw do
  get 'games/new'

  get 'games/show'

  get 'games/update'

  get 'games/destroy'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
