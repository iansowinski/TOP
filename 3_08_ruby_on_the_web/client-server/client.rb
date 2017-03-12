require 'socket'

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)
s.puts("/index.html")
puts s.read
s.close
