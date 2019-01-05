require 'rack'

app = Proc.new do |new|
  [ 200,
    {'Content-Type' => 'text/plain'},
     ["Welcome aboard!\n"]
  ]
end

Rack::Handler::WEBrick.run app
