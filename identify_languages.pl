#!/usr/bin/perl
use strict;
use warnings;

#my $text = shift;
open TEXT, "<output_full.txt" or die $!;
open OUTPUTENG, ">output_eng.txt" or die $!;
open OUTPUTLANGS, ">output_otherlangs.txt" or die $!;

print STDOUT "\nPlease wait while I try to identify languages\n\n";
while (<TEXT>) {
	
	my $input = $_;
		
	#IDENTIFY ENGLISH
	if ( $input =~ /\bthe\b|\bof\b|\band\b|\bto\b|\bthat\b|\bit\b|\bbe\b|\bfor\b|\bwho's\b|\bfuck\b|\bas\b|\bby\b|\bon\b|\bnot\b|\bwith\b|'s\b|\bare\b|\bwas\b|\bhave\b|\bthis\b|\bwhich\b|\byou\b|\bbut\b|\bwrote\b|\bfrom\b|\bhas\b|\bthere\b|\bcan\b|\bwill\b|\ball\b|\bthey\b|\bbeen\b|\bmay\b|\bwho\b|\btheir\b|\bwork\b|\babout\b|\bhad\b|\bwhat\b|\bsome\b|\bother\b|\balso\b|\bonly\b|\bwhen\b|\btime\b|\bwere\b|\byour\b|\bthan\b|\btwo\b|\bwould\b|\blike\b|\bout\b|\bsuch\b|\bthem\b|\binto\b|\bwell\b|\bfirst\b|\bthese\b|\bany\b|\bpeople\b|\bsaid\b|\bthen\b|\bthose\b|\blife\b|\bwhere\b|\beven\b|\bglass\b|\bcould\b|\bbeing\b|\bhow\b|\bnow\b|\bvery\b|\bthough\b|\bmany\b|\bover\b|\bway\b|\bworld\b|\bmake\b|\bmuch\b|\bbetween\b|\bafter\b|\bmost\b|\bstate\b|\bboth\b|\bstill\b|\bshould\b|\bmade\b|\bown\b|\bnew\b|\bcourse\b|\balways\b|\bwithout\b|\bsay\b|\btoo\b|\bend\b|\blong\b|\bunder\b|\btake\b|\bgood\b|\bperhaps\b|\bthink\b|\bdoes\b|\bjust\b|\blast\b|\bbecause\b|\bget\b|\bthrough\b|\bhere\b|\bnever\b|\bold\b|\bsince\b|\bless\b|\bhowever\b|\bright\b|\banother\b|\boften\b|\bmust\b|\bsomething\b|\bitself\b|\bmight\b|\bwhile\b|\bagainst\b|\bcan't\b|\bdid\b|\bdidn't\b|\bdon't\b|\bgoing\b|\bgot\b|\bhe's\b|\bI'll\b|\bI'm\b|\bit's\b|\bknow\b|\blook\b|\bmean\b|\bokay\b|\bone\b|\breally\b|\bsee\b|\btell\b|\bthat's\b|\bup\b|\bwant\b|\bwhy\b|\byou're\b|ation\b|ing\b|ed\b|\blmao\b/i)
	{print OUTPUTENG $input;}
	
	#NOT ENGLISH LANGUAGES
	elsif ($input =~ (/ di | che | per | non | l'| dell'| sono | nel | gli | alla | delle | anche | ma | era | all'| essere | quest. | cui | nella | d'| dalla | suo | ad | dal | due | sua | suo | degli | poi | tra | ai | alle | pu� | sul | anni | perch� | stato | prima | solo | tutt. | sempre | aveva | hanno | fatto | nell'| erano | dopo | cos� | senza | possiamo | avere | avanti | grande | tanto | troppo | posto | ogni | quell. | sulla | quest. | altr. | giorno | ciao | meglio | vieni | grazie | prego | guarda | molto | volt. | fare | cosa | cose | suoi | qualche | proprio | fra | invece | dove | posso | dire | tuo | tua | vuoi | qualcosa | sai | stai | loro | nuovo | piace | certo | poi | po' | c'� | gi� | fuori | parte | davvero | dispiace | subito | sicuro | giusto | basta | quindi | appena | vorrei | presto | potrebbe | volta | sarebbe | cazzo | oggi | adesso |zione |aggio |mento |mente /i) |
	(/ les | des | du | une | est | pour | dans | pas | au | sur | sont | ou | avec | aux | d'un | cette | d'une | ont | ses | mais | comme | tout | nous | fait | �t� | aussi /i) |
	(/ der | und | ist | des | eine | ein | mit | das | f�r | dem | sich | auf | als | auch | wird | oder | aus | wurde | werden | sind | einer | nicht | durch | nach | bei | zur | einem | einen | sie | bis | �ber | dass | wie | eines | nur /i) |
	(/ meg | vagy | volt | m�r | kell | m�g | �s | mint | azt | akkor | lehet | mert | minden | olyan | szerint | pedig | ezt | �gy | ut�n | �gy /i) |
	(/ het | ik | dat | een | hij | niet | zijn | op | voor | naar | talen | uit | vrije | dan | aan | ook /i) |
	(/ bir | olmak | bu | i�in | ben | demek | �ok | yapmak | gibi | daha | almak | kendi | gelmek | ile | vermek | sonra | kadar | yer | insan | degil | istemek | yil | �ikmak | g�rmek | g�n | biz | gitmek | sey | ara | bilmek | zaman | �ocuk | iki | bakmak | �alismak | i�inde | b�y�k | yok | baslamak | yol | kalmak | neden | konu | yapilmak | iyi | kadin | ev | ise | diye | bulunmak | s�ylemek | g�z | gerekmek | d�nya | bas | durum | yan | ge�mek | onlar | yeni | �nce | baska | girmek | �lke | yemek | hi� | nasil | b�t�n | karsi | bulmak | b�yle | yasamak | d�s�nmek | ayni | i� | ancak | kisi | bunlar | veya | ilk | g�re | sekil | �nemli | y�z | g�stermek | etmek | getirmek | kullanmak | ��nk� | taraf | simdi | adam | onun | diger | artik | �zerinde | dogru | durmak | kiz | t�m | �ekmek | konusmak | anlamak | bazi | baba | hayat | sadece | k���k |lar /i) |
	(/ y | por | qu� | los | para | est� | bien | pero | yo | eso | las | aqu� | m�s | esto | todo | esta | vamos | muy | hay | ahora | algo | estoy | nos | nada | cuando | este | est�s | as� | puedo | c�mo | quiero |\xbf.+\x3f/i) |
	(/ b�t | �e | kter� | m�t | j� | jeho | ale | svuj | jako | moci | rok | tak | tento | co | kdy� | v�echen | u� | jak | aby | nebo /i) |
	(/ je | pa | bi | ni | ga | �e | tako | tudi | bil | mu | bilo | kot | �e | iz | kaj | bo | vse | bila | kakor | pri | kar | jih | kako | samo /i) |
	(/ yang | dan | dari | pada | uang | dengan | adalah | dalam | ini | sebagai | untuk | bumi | negara | nilai | halaman | atau | tahun | lebih /i) |
	(/ ny | amin | ary | eo | faha | misy | tan� /i) |
	(/ og | til | kj� | eller | � | kan | tt | nho | ogs� | ble /i) |
	(/ och | har | fr� | att | ett | g� | j� | andra | ven | vill | m�nga | m�ste | n�got | allt | fick | skall | mellan | �ven | n�gra | varit | sitt | kom | fram | ju | sj�lv | bland | annat | redan | inom | v�l | samma | denna | enligt | f�tt | b�de | tror /i) |
	(/ em | dia | uma | os | quem | com | sobre |\xE3\x6F/i) |
	(/[\xE1-\xE9][\xB8-\xBF]/) |
	(/[\xEC-\xED][\x91-\x9F]/) |
	(/\xD9[\x81-\xAF]/) |
	(/\xD0[\xB1-\xBF]/) | 
	(/\xE3[\x81-\x89]/) | 
	(/\xD7[\x91-\x99]/) |
	(/\xE0[\xA4-\xA5]/) |
	(/\xCE[\xB1-\xBF]/) |
	(/\xE1\x83/) | 
	(/\xE0\xA6/) |
	(/\xD4[\xB1-\xBF]/) |
	(/\xE0[\xB8-\xB9]/) )
	
	{print OUTPUTLANGS $input;}

	 }
