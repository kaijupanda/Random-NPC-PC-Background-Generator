#!/usr/bin/ruby
# encoding: utf-8

#  PC/NPC Background Generator
#  Cobbled together by Georgina Duy (2011) guuthulhu@gmail.com
#
#  Permission granted for personal use. For commercial use please contact the author

# ABOUT
# ===========
# This Ruby scritp will generate various details to assist in fleshing out a PC or NPC for TRPGs.

# HOW TO RUN IT
# =============
#
#

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