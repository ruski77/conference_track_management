ConferenceTrackManagement::Application.routes.draw do

  match 'upload' => 'upload_talks#upload', :as => 'upload', :via => :post

  root :to => 'upload_talks#index'

end
