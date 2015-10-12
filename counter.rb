def count_occurances_in_buffer(substring, buffer)
  occurances = 0
  buffer_start = 0

  while true
    location_found = buffer.index(substring, buffer_start)
    break if location_found.nil?

    buffer_start = location_found + 1
    occurances += 1
  end

  occurances
end

def count_occurances_in_file(substring, fin, max_buffersize)
  occurances_count = 0
  file_buffer = fin.read(max_buffersize)
  while file_buffer
    occurances_count += count_occurances_in_buffer(substring, file_buffer)

    file_buffer = fin.read(max_buffersize)
  end

  occurances_count
end


if __FILE__ == $0
  MAX_BUFFERSIZE = 1024 * 1024

  substring = ARGV[0]
  file_name = ARGV[1]
  fin = File.open(file_name, 'rb')

  puts count_occurances_in_file(substring, fin, MAX_BUFFERSIZE)
end
