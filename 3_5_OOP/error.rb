begin
  puts 10/0
rescue
  begin
    10 / 0
    puts "you caused a fucking error maaaaaan!"
  rescue => xx
    puts xx.class
    puts xx
    puts "error in error, wtf!"
  end
end
