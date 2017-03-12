require 'socket'
require 'json'

def browse(host)
    port = 2000
    host = host[7..-1] if host.include?('http://')
    host = host.split('/')
    path = "/" + host[1..-1].join('/')
    host = host[0]
    #request = "GET #{path} HTTP/1.0\r\n\r\n"
    post_data = {:name=>"Erik the Red", :email=>"erikthered@theodinproject.com"}
    request = "POST #{path} HTTP/1.0 #{post_data.length}\r\n\r\n" + post_data.to_json
    socket = TCPSocket.open(host, port)
    socket.print(request)
    response = socket.read
    headers, body = response.split("\r\n\r\n")
    print body
end

loop do
    browse(gets.chomp)
end