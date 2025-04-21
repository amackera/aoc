File.open("locations.txt", "r") do |file|
  list1 = []
  list2 = []

  # Read the file line by line
  file.each do |line|
    pair = line.split(" ")
    list1 << pair[0]
    list2 << pair[1]
  end

  # Sort the lists so we can compare them
  list1.sort!
  list2.sort!

  # Compare the lists
  list2_index = 0
  total_distance = 0

  list1.each do |n|
    pair = [n, list2[list2_index]]
    diff = (pair[0].to_i - pair[1].to_i).abs
    total_distance += diff
    list2_index += 1
  end
end
