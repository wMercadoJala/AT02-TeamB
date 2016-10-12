class MeDetailsGet
  def self.call_and_return_response(client, method)
    end_point = '/me'
    code, body = client.get_request(end_point)
  end
end