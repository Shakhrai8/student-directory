lines = [
  "lines = [",
  "__PRINT_OWN_SOURCE_CODE__",
  "]",
  "",
  "lines.each do |line|",
  "  if line == '__PRINT_OWN_SOURCE_CODE__'",
  "    lines.each { |l| puts '  ' << l.inspect << ',' }",
  "  else",
  "    puts line",
  "  end",
  "end",
]
lines.each do |line|
  if line == '__PRINT_OWN_SOURCE_CODE__'
    lines.each { |l| puts '  ' << l.inspect << ',' }
  else
    puts line
  end
end