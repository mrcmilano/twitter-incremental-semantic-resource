#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Std;

my $usage;
{
	$usage = <<"_USAGE_";
--------------HELP session-------------

Be sure the input FILE is in the form of Twitter's stream.
This script takes as input a line from the official Twitter's stream,
it extracts the text (aka tweets) and parses it to identify the language it was written in.
*Identification of languages is not 100% guaranteed. Correctness of output depends on quality of text.*

3 files are generated during the process and will be found at the end of the processing 
in the same directory from which this script was launched:

* output_full.txt	==> every tweet from the stream
* output_eng.txt	==> every English tweet (hopefully)
* output_otherlangs.txt	==> tweets not in English 


***********CREDITS***********
Program written by Marco Milano - University of Trento, Italy. 
Thanks to Fabio Celli (fabio.celli\@unitn.it) for his language identification script: 'SLIde'.
Thanks to Ama\xc3\xa7 Herdagdelen (amac\@herdagdelen.com) for his support and in particularly:
for having downloaded and made available a reliable Twitter corpus.

WARNING: TWITTER USERS AREN'T AUTOMATICALLY FILTERED OUT. YOU MUST COMPLY WITH THIS REQUEST FROM TWITTER.

Copyright 2011 Marco Milano\xc2\xa9 & Universit\xc3\xa0 Degli Studi Di Trento\xc2\xae .
You can use, modify and redistribute the program as you like but please cite the authors.
*****************************
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
my @lines = ();
my $text = ();


open FILE, $file or die $!;
open OUTPUT, ">output_full.txt" or die $!;

print STDOUT "\nExtracting text(tweets) from Twitter's stream...\n";

while (<FILE>) {
	
	my $input = $_;
	@lines = split "\t", $input;
	$text = "$lines[3]\n"; 
	print OUTPUT $text;
	}
	
close FILE;

print STDOUT"\nIdentifying languages... Hold on, it may take a while.\n";

do 'identify_languages.pl';

print STDOUT "\nLanguages (hopefully) correctly identified. All tweets have been processed and classified.\nCheck output* files for 
details.\n\n";
