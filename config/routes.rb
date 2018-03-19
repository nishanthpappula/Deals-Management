Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'users#home'

  get 'users/login', to: 'users#login'

  get 'users/logout', to: 'users#logout'


  get 'users/signin', to: 'users#signin'

  get 'users/logout', to: 'users#logout'

  get 'users/admin', to: 'users#admin'

  get 'users/admin_login', to: 'users#admin_login'

  get 'users/admin_dashboard', to: 'users#admin_dashboard'

  post 'users/accept', to: 'users#accept'

  post 'users/reject', to: 'users#reject'
  
   get 'users/users_dashboard', to:'users#users_dashboard'



  resources :users

  get 'uploads/show_uploads', to:'uploads#show_uploads'

  get 'uploads/deals', to:'uploads#deals'

  get 'uploads/admin_crud', to: 'uploads#admin_crud'
  
  post 'uploads/reject',to: 'uploads#reject'

  post 'uploads/delete',to: 'uploads#delete'

  resources :uploads

end
