require 'rest-client'
require 'json'
require_relative '../config/configuration'
require_relative '../data_helper'

class RubyRestTeamB
  def initialize
    @config = Configuration.new
    @base_url = @config.get('url')
    @token = @config.get('account/token')
    @header = {'X-TrackerToken' => @token}
  end

  def get_request (url)
    response = nil
    begin
      response = RestClient.get "#{@base_url}" % url, @header
    rescue RestClient::ExceptionWithReponse => err
      response = err.response
    end
    response.code
    body = JSON.parse(response.body.to_s)
    [response.code, body]
  end

  def post_request(url, json)
    response = nil
    begin
      response = RestClient.post "#{@base_url}" % url, json, @header
      rescue RestClient::ExceptionWithResponse => err
        response = err.response
    end
    response.code
    body = JSON.parse(response.body.to_s)
    [response.code, body]
  end

  def put_request(url, json)
    response = nil
    begin
      response = RestClient.put "#{@base_url}" % url, json, @header
    rescue RestClient::ExceptionWithResponse => err
      response = err.response
    end
    response.code
    body = JSON.parse(response.body.to_s)
    [response.code, body]
  end


  def delete_request(url)
    response = nil
    begin
      response = RestClient.delete "#{@base_url}" % url, @header
    rescue RestClient::ExceptionWithReponse => err
      response = err.response
    end
    response.code
  end
end