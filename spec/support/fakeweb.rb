require 'fakeweb'
FakeWeb.allow_net_connect = false

def fake_post path, response
  FakeWeb.register_uri(:post, 'https://my.vonagebusiness.com', body: response)
end

def fake_get path, response
  FakeWeb.register_uri(:get, 'https://my.vonagebusiness.com', body: response)
end
