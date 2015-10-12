def count_occurances_in_file(substring, fin, max_buffersize)
  occurances_count = 0
  seek_to = 0
  file_buffer = ''
  
  # define these now, optimization yo
  buffer_start = 0
  substr_len = substring.length
  last_match_end = 0
  new_buf_start = 0
  last_location = nil
  location_found = 0

  while fin.read(max_buffersize, file_buffer)
    buffer_start = 0

    while true
      location_found = file_buffer.index(substring, buffer_start)
      break if !location_found
      last_location = location_found
      buffer_start = location_found + substr_len
      occurances_count += 1
    end

    last_match_end = seek_to + (last_location || 0) + substr_len
    new_buf_start = seek_to + max_buffersize - substr_len + 1

    if last_match_end > new_buf_start
      seek_to = last_match_end
    else
      seek_to = new_buf_start
    end

    fin.seek(seek_to)
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
