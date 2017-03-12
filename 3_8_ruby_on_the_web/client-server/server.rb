require 'socket'
require 'json'

server = TCPServer.open(2000)
loop do
    Thread.new(server.accept) do |client|
        puts "connected!"
        loop do
            request = client.read_nonblock(256)
            method = request.split[0]
            print 1
            path = request.split[1][1..-1]
            print 2
            post_data = JSON.parse(request.split("\r\n\r\n")[1])
            print 3
            if File.exist?(path)
                client.print "HTTP/1.0 200 OK\r\n\r\n"
                if method == 'GET'
                    client.print(File.read(path))
                elsif method == 'POST'
                    print 4
                    data = "<li>Name: #{post_data['name']}</li>\n<li>Email: #{post_data['email']}</li>"
                    client.print(File.read(path).gsub("<%= yield %>", data))
                end
            else 
                client.puts "404 NOT FOUND!"
            end
            #client.puts "Closing the connection. Cya!"
            client.close
        end
    end
end