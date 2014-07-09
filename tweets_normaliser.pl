#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Std;

my $usage;
{
	$usage = <<"_USAGE_";
--------------HELP session-------------

This program takes as input a text file written in English using chatspeak terms and slang terms.
Based on the author's personal experience and on different online resources, slang terms are
detected and substituted with their correct English counterpart.
This process is fine-tuned to Twitter's tweets from which links and \@s are also removed as well as any abuse
of punctuation.

The output will be available under the name of 'normal_output.txt' 
in the same directory from which the program itself is launched.

Developed by Marco Milano at the University of Trento.
January 2011.

This program is free software. You may use it, modify it and redistribute it under the same terms as
Perl itself but please cite the authors.

Cheers

------------------------------------------
_USAGE_
}
my %opts = ();
getopts('h',\%opts);

if ($opts{h}) {
    print $usage;
    exit;
}

my $file = shift;
open NONNORM, $file or die $!;
open NORMALISED, ">normal_output.txt" or die $!;


print STDOUT "\nPlease wait while text is normalised...\n";
while (<NONNORM>) {
	
	s/\bRT\b//g; #removes RT symbol
	s/\bhttp:\/\/.+\b//g; #removes links with word ancor boundaries
	s/\bhtt.+\b//g;	
	s/\b@\b/at/g; #substitutes remaining @s with the correct preposition assuming that's the only use
	
	#American English abbreviations translation
	s/\bbtw\b/by the way/ig;
	s/\b&\b/and/ig;  
	
	s/\bcoo\b/cool/ig;
	s/\bdl\b/download/ig;
	s/\bgna\b/going to/ig;
	s/\bhella\b/very/ig;
	s/\bhr\b/hour/ig;
	s/\biam\b/I am/ig;
	s/\bima\b/I'm going to/ig;
	s/\bim\b/I am/g;
	s/\bimm\b/I'm/ig;
	s/\biono\b/I don't know/ig;
	s/\blames\b/lame people/ig;
	s/\bjk\b/just kidding/ig;
	s/\bkoo\b/cool/ig;
	s/\blol\b/I'm laughing out loud/ig;
	s/\bnm\b/nothing much/ig;
	s/\bomw\b/on my way/ig;
	s/\bcya\b/see you/ig;
	s/\bc u\b/see you/ig;
	s/\by'all\b/you all/ig;
	s/\bem\b/them/g;
	s/\b'em\b/them/ig;
	s/\bsmh\b/I'm shaking my head/ig;
	s/\bwassup\b/what's up/ig;
	s/\bsuttin\b/something/ig;
	s/\bwyd\b/what are you doing/ig;
	s/\bdiy\b/do it yourself/ig;
	s/\b'bro\b/brother/ig;
	s/\bbro\b/brother/ig;
	s/\bsis\b/sister/ig;
	s/\breadin\b/reading/ig;
	s/\bwots\b/what's/ig;
	s/\bwats\b/what's/ig;
	s/\bwot\b/what/ig;
	s/\bdis\b/this/ig;
	s/ 4 / for /ig; #very dangerous but statistically appropriate
	s/\basap\b/as soon as possible/ig;
	s/\bafk\b/away from the keyboard/ig;
	s/\btho\b/though/ig;
	s/\baka\b/also known as/ig;
	s/\babt\b/about/ig;
	s/\basa\b/as soon as/ig;
	s/\bi ll\b/I will/ig;
	s/\bb4\b/before/ig;
	s/\bcuzin\b/cousin/ig;
	s/\btmro\b/tomorrow/ig;
	s/\btheres\b/there is/ig;
	s/\baswell\b/as well/ig;
	s/\bdoin\b/doing/ig;
	s/\bgoin\b/going/ig;
	s/\bhav\b/have/ig;
	s/\bhavin\b/having/ig;
	s/\bthinkin\b/thinking/ig;
	s/\bstartin\b/starting/ig;
	s/\bsayin\b/saying/ig;
	s/\bbout\b/about/ig;
	s/\btryna\b/trying to/ig;
	s/\bw\/out\b/without/ig;
	s/\bw\/.* /with/ig;
	s/\boutta\b/out of/ig;
	s/\bgotta\b/have got to/ig;
	s/\bda\b/the/g;
	s/\bppl\b/people/ig;
	
	#British English abbreviations translation
	s/\blmao\b/I'm laughing my ass off/ig;
	s/\bffs\b/for fuck sake/ig;
	s/\b2moro\b/tomorrow/ig;
	s/\brofl\b/I'm rolling on the floor laughing/ig;
	s/\bwtf\b/what the fuck/ig;
	s/\bfuckin\b/fucking/ig;
	s/\bgod\b/God/ig;
	s/\bomg\b/oh my God/ig;
	s/\bomfg\b/oh my fucking God/ig;
	s/\bbruva\b/brother/ig;
	s/\bbrova\b/brother/ig;
	s/\bu\b/you/ig;
	s/\bi\b/I/g;
	s/\br\b/are/ig;
	s/\bu r\b/you are/ig;
	s/ ur / your /ig; #ambiguous. some users refer to 'you are', some others to 'your'.
	s/\burs\b/yours/ig;
	s/\bdat\b/that/ig;
		
	#Repetitions
	s/\bwoo+w\b/wow/ig;
	s/\bgoo+d\b/good/ig;
	s/\bsoo+\b/so/ig;
	
	#Punctuation and space
	s/\.\.\.+ ?/\.\.\. /g; 
	s/\?\?+ ?/\? /g; 
	s/\!\!+ ?/\! /g;
	s/^ +//g; #remove spaces at beginning of line - as consequence of removing @s
	s/  +/ /g;
	
	print NORMALISED $_;
	
}
print STDOUT "\nYou can now check the output at normal_output.txt\n\n";
