module Vonage
  module Rest

    include Http

    def click_to_call phone_number
      get "/presence/rest/clicktocall/#{phone_number}"
    end
  end
end
