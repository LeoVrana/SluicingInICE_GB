@files = <*>;

foreach $file (@files){
	open(F, $file) or die("File $file can't be opened!\n"); # die for debug
	open(O, ">Output" . $file . ".txt") or die ("Output file can't be opened!\n");
	print "Working on $file\n";
	$wordcount = 0;
	$count = 1;
	$line = 1;	
	while (<F>){
		@words = split(' ', F);
		$_ =~ s/\<ICE.+?\>//g;
		$wordcount += @words;
		if ($_ =~ / wh(o|at|ere|en|y)\s?(\.|\!|\<,,?\>\s?\n?)/) {
			print O $count . "\t" . "line " . "$oldline" . "\t" . $file . "\t" . $old . "PRECEDES:\n";
			print O $count . "\t" . "line " . "$line" . "\t" . $file . "\t" . $_ . "\n\n";
			$count += 1;
		} elsif ($_ =~ / how\s?(\.|\?|\!)/ ){
			print O $count . "\t" . "line " . "$oldline" . "\t" . $file . "\t" . $old . "PRECEDES:\n";
			print O $count . "\t" . "line " . "$line" . "\t" . $file . "\t" . $_ . "\n\n";
			$count += 1;			
		}
		$old = $_;
		$oldline = $line;
		$line++;
	}
	print "Word total: $wordcount\n";
	close(F);
}


 
