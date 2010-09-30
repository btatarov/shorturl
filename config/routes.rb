Shorturl::Application.routes.draw do

  root :to => 'main#index'
  match 'generate' => 'main#generate'
  match ':id' => 'main#redirect'

end
