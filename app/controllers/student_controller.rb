class StudentController < ApplicationController
  def index
    #require 'ox'

    response = Typhoeus.get("https://eu.bmstu.ru/modules/contingent/service/xml/students/?search[uuid]=67b8a137-8636-4c20-9649-00000001d83b", ssl_verifypeer: false)
    body = response.body.force_encoding("UTF-8")
    @student = Ox.parse(body)

    #@response.force_encoding("UTF-8")!
=begin
    require 'net/https'

    url = URI.parse('https://eu.bmstu.ru/modules/contingent/service/xml/students/?search[uuid]=67b8a137-8636-4c20-9649-00000001d83b')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Get.new(url.request_uri)
    @res = http.request(req)
=end
  end
end
