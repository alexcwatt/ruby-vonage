module Vonage
  class Error < StandardError; end
  
  class AuthenticationError < Error; end
  class NetError < Error; end
  class InvalidPhoneNumber < Error; end

  class ResponseError < Error
    def initialize(res)
      @res = res
    end

    def to_s
      @res.to_s
    end

    def code
      @res.code.to_i
    end

    def inspect
      @res.inspect.to_s
    end
  end
end
