module Racknroll
  class Router
    class NotFoundError < StandardError; end
    attr_reader :routes

    def initialize(routes)
      @routes = routes
    end

    def resolve(path)
      if routes.has_key?(path)
        ctrl_name, action_name = routes[path].split("#")
        [Object.const_get("#{ctrl_name.capitalize}Controller").new, action_name.to_sym]
      else 
        raise NotFoundError, "#{path} not found"
      end
    end
  end
end