# decabits-auth-rm
Reusable Module for Authentication purpose

Before publising of gem (Current stage)
In order to include decabits_auth gem in your application, following steps need to be taken

1. Create rails app 
2. In the gemfile of rails app --- Paste : gem 'decabits_auth', path: '../engines/decabits_auth' (Path depends where the particular code is placed). After publishing of gem, no path is required.
3. Mount your engine on rails app ----- Add mount DecabitsAuth::Engine, at: "/decabits_auth" in the config/routes.rb of main application
4. For adding migrations of gem, Add rails decabits_auth:install:migrations
5. Then run rails db:migrate.

6. Gem is successfully installed in your application

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Routes 

1. For signup ---- /decabits_auth/account_registrations
2. For login ------ /decabits_auth/account/login


