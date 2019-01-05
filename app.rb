require_relative 'time_controller'

class App
  def call(env)
    response = Rack::Response.new
    response['Content-Type'] = 'text/plain'

    case env['REQUEST_PATH']
    when '/time'
      req = Rack::Request.new(env)
      response.status = 200
      response.body = [parse_time(req.params['format'])]
      response.finish
    else
      response.status = 400
      response.body = ["Unknown request"]
      response.finish
    end
  end

  private

  def parse_time(data)
    begin
      TimeController.new(data).parse_date
    rescue ArgumentError => error
      error
    end
  end
end
