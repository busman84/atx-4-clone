require 'open-uri'
# opens URL as though it were a file

kittens = open('http://placekitten.com/')
# opens URL in preparation for our GET request

response_status = kittens.status
response_body = kittens.read[559, 441]
# READ from the site
# specific character numbers to control the input we get back
# those characters give us the ascii cat image

puts response_status
puts response_body
