class UpcaseAll
  def initialize(app)
    @app = app
  end

  def call(env)
    code, headers, body = @app.call(env)
    body.each { |part| part.upcase! }
    [code, headers, body]
  end
end

class RackToRuby
  def initialize(app)
    @app = app
  end

  def call(env)
    code, headers, body = @app.call(env)
    body.each { |part| part.gsub! /Rack/i, "Ruby" }
    [code, headers, body]
  end
end

class AddInfo
  def initialize(app)
    @app = app
  end

  def call(env)
    code, headers, body = @app.call(env)
    body.first.prepend "Path info is: #{env['PATH_INFO']}<br>\n"
    body.first.prepend "Access from: #{env['REMOTE_ADDR']}<br>\n"
    [code, headers, body]
  end
end

App = lambda do |env|
  [200, { "Content-Type" => "text/html" },  ["Hello, Rack world!"]]
end

# use RackToRuby
# use UpcaseAll
use AddInfo
run App
