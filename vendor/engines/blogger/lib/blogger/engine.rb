module Blogger
  class Engine < ::Rails::Engine
    # Isolated namespace prevents the main app and Blogger engine from conflicting.
    # Examples:
    # MODEL: rails g model article => Blogger::Article model + blogger_articles table
    # CONTROLLER: rails g controller Articles create read update destroy => Blogger::ArticlesController
    # VIEW: app/views/blogger/articles
    # ROUTES: 
      # <%= link_to "Blog articles", articles_path %> => renders either the main app's or the engine's articles_path, depending on which one the erb template was rendered from.
      # <%= link_to "Blog articles", blogger.articles_path %> => using the routing proxy method (blogger) always renders from the engine
      # <%= link_to "Home", main_app.root_path %> => using main_app helper always renders from the main app

    isolate_namespace Blogger
  end
end
