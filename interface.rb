require_relative 'dealroom'

name = nil

while name != ""
  puts "Type the name of a company"
  name = gets.chomp
  info = scrape_for(name)
  puts "- Name: #{info[:name]}"
  puts "- Description: #{info[:description]}"
  puts "- Website: #{info[:website]}"
  puts "- Launch date: #{info[:launch]}"
  puts "- Employees: #{info[:employees]}"
  puts "- Growth stage: #{info[:stage]}"
  puts "- Ownership: #{info[:ownership]}"
  puts "- Firm valuation: #{info[:valuation]}"
  puts "- Address: #{info[:address]}"
  puts "*******************************************"
end
