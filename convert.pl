use warnings;
use strict;

print <<EOH;
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"> 
<head> 
  <title>The Consul</title> 

  <link rel="stylesheet" type="text/css" media="screen, projection, print" 
   href="http://www.w3.org/Talks/Tools/Slidy2/styles/slidy.css" /> 
  <script src="http://www.w3.org/Talks/Tools/Slidy2/scripts/slidy.js" 
   charset="utf-8" type="text/javascript"></script> 
  <style type="text/css">
    div.toolbar { visibility: hidden }
    div.slide { position:relative; top:50%; transform: translateY(-50%); }
    <!-- your custom style rules --> 
  </style> 
  
</head>
<body style="background:#000; color:#fff; text-align:center">
EOH

local $/ = "\n--\n";
while (<>) {
    chomp;

    my $chunk = $_;
    $chunk =~ s/^\s*//gm;
    $chunk =~ s/\s*$//gm;
    my @characters = split /^[A-Z ]+$/m, $chunk;
    print <<EOH;
<div class="slide">
EOH
    @characters = map { s/^\s+//gm; $_ } @characters;
    @characters = grep { /\S/ } @characters;
    my $prefix = (@characters > 1) ? "-" : "";
    foreach my $char (@characters) {
#	$char =~ s/^\s+//gm;
	#	next unless $char =~ /\S/;
	
	print <<EOH
<h1>$prefix $char</h1>
EOH
    }
    print <<EOH;
</div>
EOH
	    
}
print <<EOH;
</body>
</html>
EOH
