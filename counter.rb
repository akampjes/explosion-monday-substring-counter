def count_occurances_in_buffer(substring, buffer)
  occurances = 0
  buffer_start = 0

  # reduce?
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
  seek_to = 0
  file_buffer = fin.read(max_buffersize)
  while file_buffer
    
    buffer_start = 0
    while true
      location_found = file_buffer.index(substring, buffer_start)
      if location_found.nil?
        break
      else
        last_location = location_found
      end

      buffer_start = location_found + substring.length
      occurances_count += 1
    end

    last_match_end = seek_to + last_location + substring.length
    new_buf_start = seek_to + max_buffersize - substring.length + 1

    if last_match_end > new_buf_start
      seek_to = last_match_end
    else
      seek_to = new_buf_start
    end

    fin.seek(seek_to)
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
