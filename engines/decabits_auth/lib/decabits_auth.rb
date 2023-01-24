require "decabits_auth/version"
require "decabits_auth/engine"

module DecabitsAuth
  class Engine < ::Rails::Engine
    isolate_namespace DecabitsAuth
    mattr_accessor :author_class

    def self.author_class
      @@author_class.constantize
    end

  end
end
