# typed: false
require_relative './test'

class Nexmo::HostsTest < Nexmo::Test
  def api_host
    'api-sg-1.nexmo.com'
  end

  def rest_host
    'rest-nexmo-com-xxx.curlhub.io'
  end

  def authorization
    basic_authorization
  end

  def test_custom_api_host
    secrets = Nexmo::Secrets.new(config.merge(api_host: api_host))

    uri = %r{\Ahttps://#{api_host}/}

    stub_request(:get, uri).with(request).to_return(response)

    assert_kind_of Nexmo::Secrets::ListResponse, secrets.list
  end

  def test_custom_rest_host
    account = Nexmo::Account.new(config.merge(rest_host: rest_host))

    uri = %r{\Ahttps://#{rest_host}/}

    stub_request(:get, uri).with(query: api_key_and_secret).to_return(response)

    assert_kind_of Nexmo::Response, account.balance
  end
end
