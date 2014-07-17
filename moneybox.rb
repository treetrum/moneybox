$filename = "data.txt"
$balance = -1

# ------- #
# Methods #
# ------- #
def refresh_screen()
	system "clear" or system "cls"
end

def add
	puts "How much would you like to add? "
	amt = gets.chomp.to_f
	$balance += amt
	puts "Succesfully added $#{amt.round(2)} to your balance.\nYour new balance is $#{balance.round(2)}"
end

def subtract
	puts "How much would you like to subtract? "
	amt = gets.chomp.to_f
	$balance += amt
	puts "Succesfully subtracted $#{amt.round(2)} to your balance.\nYour new balance is $#{balance.round(2)}"
end

# If $filename does not exist create it and initialise it with $0.00
if !File.exist?($filename)
	File.open($filename, "w") { |file| file.write("0") }
end

# Read and display from file
refresh_screen
file = File.open($filename, "r") {|file| $balance = file.gets.to_f }
puts "You have $#{$balance.round(2)}"

# Ask if the user would like to add or subtract balance? or Save & Quit.
response = nil

while response != 'q'
	puts "Would you like to Add or Subtract (a/s) or quit? (q)"
	response = gets.chomp.to_s
	if response == "a" {add}
	elsif response == "s" {subtract}
	else {puts "Error, that is not a valid response."}
end

# Save and quit