def sorted?(array)
  array == array.sort
end

def reverse_sorted?(array)
  array == array.sort.reverse
end

def safety_report(report, direction)
  report.each_cons(2).map do |a, b|
    diff = (b - a) * direction
    (diff >= 1) && (diff <= 3)
  end
end

File.open("02_reports.txt", "r") do |file|
  safe_reports = 0
  unsafe_reports = 0
  almost = 0
  file.each_with_index do |line, i|
    report = line.split(" ")
    report.map!(&:to_i)
    direction = (report[1] < report[0]) ? -1 : 1
    safety = safety_report(report, direction)
    if safety.all?
      safe_reports += 1
      next
    end

    unsafe_index = safety.index(false)
    modified_report1 = report.dup
    modified_report1.delete_at(unsafe_index)

    safety1 = safety_report(modified_report1, direction)
    if safety1.all?
      safe_reports += 1
      next
    end

    modified_report2 = report.dup
    modified_report2.delete_at(unsafe_index + 1)
    safety2 = safety_report(modified_report2, direction)
    if safety2.all?
      safe_reports += 1
      next
    end

    if safety.count(false) < 3
      puts report.to_s
      puts safety.to_s
      puts modified_report1.to_s
      puts safety1.to_s
      puts modified_report2.to_s
      puts safety2.to_s
      puts "\n"
      almost += 1
    end
    unsafe_reports += 1
  end

  puts "Safe Reports: #{safe_reports}"
  puts "Unsafe Reports: #{unsafe_reports}"
  puts "almost: #{almost}"
end
