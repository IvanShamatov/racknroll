class App < Racknroll::Base
  get "/hello", to: "hello#index"
  get "/wildcard/:wild", to: "wild#any"
  get "/other"
end


class HelloController < Racknroll::Controller
  def index
    render 'Hello World'
  end
end

class WildController < Racknroll::Controller
  def any
    render "#{params[:wild]}"
  end
end

class OtherController < Racknroll::Controller
  def index
  end
end