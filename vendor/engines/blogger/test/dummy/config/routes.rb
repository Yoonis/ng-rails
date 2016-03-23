Rails.application.routes.draw do
  # mount engine in dummy Rails app for engine testing purposes. Engine is only accessible to dummy app via "/blogger" path.
  mount Blogger::Engine => "/blogger"
end
