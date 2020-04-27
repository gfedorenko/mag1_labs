Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :databases do
      resources :tables do
        resources :headers do
          resources :fields
        end
        resources :rows do
          resources :cells
        end
      end
    end

    get '/tables_intersection', to: 'tables#intersection'
  end

end
