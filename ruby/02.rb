
def sorted?(array)
  array == array.sort
end

def reverse_sorted?(array)
  array == array.sort.reverse
end

File.open("02_reports.txt", "r") do |file|
  safe_reports = 0
  unsafe_reports = 0
  file.each do |report|
    levels = report.split(" ")
    # puts levels
    levels.map!(&:to_i)

    unsafe = !(sorted?(levels) || reverse_sorted?(levels))
    unsafe_reports += 1 if unsafe
    if unsafe
      puts "Unsafe: #{levels} #{unsafe}"
      unsafe_reports += 1
      next
    end

    safe = levels.each_cons(2).all? do |level1, level2|
      diff = (level1 - level2).abs
      (diff >= 1) && (diff <= 3)
    end

    puts "Safe: #{levels} #{safe}"
    safe_reports += 1 if safe
  end

  puts "Safe Reports: #{safe_reports}"
  puts "Unsafe Reports: #{unsafe_reports}"
end
