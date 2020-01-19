Rails.application.routes.draw do
  resources :managerposts
  authenticate :user, lambda { |u| u.has_role? :admin } do
      begin
        mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
      rescue
        redirect_to new_user_session_path
      end
  end
  resources :posts do
    # post 'comments', to:'comments#create'
    resources :comments, only: [:create, :destroy]
  end
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
