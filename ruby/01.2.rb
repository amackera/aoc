File.open("locations.txt", "r") do |file|
  list = []
  hash = {}

  # Read the file line by line
  file.each do |line|
    first, second = line.split(" ")
    list << first.to_i
    hash[second.to_i] = hash.fetch(second.to_i, 0) + 1
  end

  total_similarity = list.sum { |n| n * hash.fetch(n, 0) }

  puts "Total Similarity: #{total_similarity}"
end
