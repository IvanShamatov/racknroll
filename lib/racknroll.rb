require "racknroll/version"
require "racknroll/controller"
require "racknroll/router"


module Racknroll
  class Base 
    attr_reader :router

    def initialize
      @router = Router.new(self.class.routes)
    end

    def call(env) 
      ctrl, action, params = router.resolve(env)
      response = ctrl.send(action, params)
      [status, {}, [response]]
    end

    def self.get(path, *args)
      routes[path] = case 
        when args.has_key?(:to) then args[:to]
        else path
        end
    end
  end
end
