#!/usr/bin/ruby
# encoding: utf-8

#  PC/NPC Background Generator
#  Cobbled together by Georgina Duy (2011) guuthulhu@gmail.com
#
#  Permission granted for personal use. For commercial use please contact the author

# ABOUT
# ===========
# This Ruby scritp will generate various details to assist in fleshing out a PC or NPC for TRPGs.
# It essentially just rolling a d10 off various tables and putting the data together.
# output will be printed to a file.



require 'rubygems'
require 'getoptlong' 

opts = GetoptLong.new( 
	[ "--peeps", "-p", GetoptLong::REQUIRED_ARGUMENT ],		# Number of backgrounds to generate
	[ "--modern", "-m", GetoptLong::NO_ARGUMENT ],			# Generate for a Modern setting
	[ "--fantasy", "-f", GetoptLong::NO_ARGUMENT ],  		# Generate for a Fantasy setting
	[ "--cyberpunk", "-c", GetoptLong::NO_ARGUMENT ],		# Generate for a Cyberpunk setting
	[ "--mixed", "-x", GetoptLong::NO_ARGUMENT ]			# Generate for a Mixed setting
)


def d10(dice)
	roll = 0
	dice.times {
		roll += rand(10) +1
	}
	return roll
end

# ==========================================================================================
# =========================================================================================

modern = false
fantasy = false
cyberpunk = false
mixed = false
background = 0
$seed=Time.new.to_i


opts.each do |opt, arg|
	if opt == '--modern' then
		modern = true
		puts "Modern selected"
	elsif opt == '--fantasy'
		fantasy = true
		puts "Fantasy selected"
	elsif opt =='--cyberpunk'
		cyberpunk = true
		puts "Cyberpunk selected"
	elsif opt == 'mixed'
		mixed = true
		puts "Mixed selected"
	elsif	opt == '--peeps'
		backgrounds = arg.to_i
	end
end

srand($seed)

if(!File.exist?('output')) then
	Dir.mkdir('output')
end