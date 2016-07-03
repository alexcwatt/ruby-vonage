require "vonage/version"

module Vonage

  class Client
    include HTTParty
    base_uri 'https://my.vonagebusiness.com'

    include Authentication
    include Http

    include Rest

    attr_accessor :login, :password, :cookies

    def initialize login, password
      @login = login
      @password = password

      @cookies = CookieHash.new
    end
  end
end
