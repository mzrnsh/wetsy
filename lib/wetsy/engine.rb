module Wetsy
	class Engine < ::Rails::Engine
	  initializer "configure assets of normalize-rails", :group => :all do |app|
	    app.config.assets.precompile += %w( wetsy/*.scss )
	  end
	end
end