Rails.application.routes.draw do
  # home
  get "home" => "home#top"
  get "home/enterName" => "home#enterName"
  get "home/menu/:nickname" => "home#menu"
  get "home/question/:qNum/:nickname" => "home#question"
  get "home/q1/:nickname" => "home#q1" #erase
  get "home/q2/:nickname" => "home#q2" #erase
  get "home/log" => "home#log"
  post "home/confirm/:qNum/:nickname" => "home#confirm"
  post "home/confirm/:nickname" => "home#confirm" #erase
  post "home/reset" => "home#reset"
  post "home/nickname" => "home#nickname"
  
  # lock
  get "lock/enterName" => "lock#enterName"
  get "lock/room/:nickname" => "lock#room"
  get "lock/getCount" => "lock#getCount"
  get "lock/system" => "lock#system"
  post "lock/nickname" => "lock#nickname"
  post "lock/reset" => "lock#reset"

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
