# Middleware for forcing all http response content types to return as 
# application/json. This should always be loaded in the config/application.rb
# file in the following way:
#   config.middleware.insert_before(ActionDispatch::Static, JSONContentTypeMiddleware)
#
# @author Brennick Langston
# @version 0.1.0


class JSONContentTypeMiddleware
  def initialize(app)
      @app = app
  end

  def call(env)
      env['CONTENT_TYPE'] = 'application/json' if env['CONTENT_TYPE'] == 'application/x-www-form-urlencoded'
      @app.call(env)
  end
end
