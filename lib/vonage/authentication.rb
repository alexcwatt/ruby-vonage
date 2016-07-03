module Vonage
  module Authentication

    def authenticate
      params = {login: @login, password: @password}
      get_response = get "/appserver/rest/user/null", params

      @cookies = parse_cookies(get_response)
    end
    
    def authenticated?
      !@cookies.empty?
    end
    
    def reauthenticate
      @cookies = CookieHash.new
      authenticate
    end
    
  end
end
