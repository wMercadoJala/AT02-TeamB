require_relative '../../../src/helpers/rest_client/api_rest_client'

class Projects
  def self.project_post(client,json)
    url='projects/'
    code, body = client.post_request(url, json)
    [code, body]
  end
end