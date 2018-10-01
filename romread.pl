#! /usr/bin/perl
open(infile,"<soft/tbenchsoft/armrom.dat");
open(outfile,">soft/tbenchsoft/temp.dat");

@lines=  <infile>;
$start = 0;
$end   = 0;
foreach $line(@lines)
{
	if($start == 1 && $end  ==  1)
	{
		break;
	}elsif ($start == 0 && $end == 0)
	{
		if($line =~ /Contents/)
		{
			$start  = 1;
			print  "start detected\n";
		}
	}elsif ($start == 1 && $end == 0)
	{
		if($line =~ /Contents/)
		{
			$end  = 1;
			print  "End detected\n";
		}
		else
		{
		   @words = split(/ /,$line);
		   print outfile  @words[2] . "\n";
		   print outfile  @words[3] . "\n";
		   print outfile  @words[4] . "\n";
		   print outfile  @words[5] . "\n";
        	}

	}
}
close(infile);
close(outfile);
