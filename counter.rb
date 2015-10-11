MAX_BUFFERSIZE = 1024 * 1024

substring = ARGV[0]
file_name = ARGV[1]
fin = File.open(file_name, 'rb')

occurances_count = 0
upto = 0
file_buffer = fin.read(MAX_BUFFERSIZE)
while file_buffer
  buffer_start = 0

  while true
    location_found = file_buffer.index(substring, buffer_start)
    break if location_found.nil?

    occurances_count += 1
    buffer_start = location_found + 1
  end

  upto += MAX_BUFFERSIZE - substring.length
  fin.seek(upto)
  file_buffer = fin.read(MAX_BUFFERSIZE)
end

puts occurances_count
