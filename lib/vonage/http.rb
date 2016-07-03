module Vonage
  module Http
    
    def get action, params = {}, num_retries = 0
      options = {query: params, headers: {'Cookie': @cookies.to_cookie_string}}
      check_response self.class.get(action, options)

    rescue Vonage::AuthenticationError => e
      handle_expired_cookies :get, action, params, num_retries, e
    
    rescue SocketError, Interrupt, EOFError, SystemCallError, Timeout::Error => e
      raise Vonage::NetError.new(e)
    end
    
    def parse_cookies resp
      cookie_hash = HTTParty::CookieHash.new
      resp.get_fields('Set-Cookie').each { |c| cookie_hash.add_cookies(c) }
      cookie_hash
    end

    protected
    
    def handle_expired_cookies method, action, params, num_retries, e
      raise e unless num_retries == 0
      
      reauthenticate
      
      send(method, object, path, params, 1)
    end
    
    def check_response http_response
      case http_response.code
      when 400
        throw Vonage::InvalidPhoneNumber
      when 403
        throw Vonage::AuthenticationError if http_response.include?("USER NOT LOGGED IN")
        throw Vonage::Error
      when (401..600)
        throw Vonage::Error("Status Code: #{http_response.code}")
      end
      
      http_response
    end
    
  end
end
