Shadmin::Application.routes.draw do
  devise_for :admins, path: 'admin'
  # root 'welcome#index'
end
