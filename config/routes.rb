Rails.application.routes.draw do
  get "home" => "home#top"
  get "home/enterName" => "home#enterName"
  get "home/menu/:nickname" => "home#menu"
  get "home/q1/:nickname" => "home#q1"
  get "home/q2/:nickname" => "home#q2"
  get "home/log" => "home#log"
  post "home/confirm/:nickname" => "home#confirm"
  post "home/reset" => "home#reset"
  post "home/nickname" => "home#nickname"
  get "home/:q/:nickname" => "home#menu"

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
