#!/usr/bin/perl -w
# convertToPdf.pl --- Replace authors and create a PDF from HTML

use warnings;
use strict;
use v5.22;


my $temp = "output.html";
my $html = shift @ARGV;
my $pdf = shift @ARGV;
my $autoren = shift @ARGV;
my $autor1 = join(' ', (split /\s+/, $autoren)[0,1]);
my $autor2 = join(' ', (split /\s+/, $autoren)[3,4]);


open my $fh, '<', $html
    or die "Kann Datei nicht öffnen: $!";

open my $out, '>', $temp
    or die "Kann Datei nicht zum Schreiben öffnen: $!";


while (<$fh>) {
    chomp;

    s/XXautorenXX/$autoren/g;
    s/XXautor1XX/$autor1/g;
    s/XXautor2XX/$autor2/g;
    print $out $_;
}

close $fh;
close $out;


say "Generating PDF...";
system("wkhtmltopdf -B 20mm -L 25mm -R 20mm -T 20mm $temp $pdf");

unlink $temp;


__END__

=head1 NAME

convertToPdf.pl - Replace the name of the authors and create the pdf file

=head1 SYNOPSIS

convertToPdf.pl [options] html-file pdf-filename authors

  e.g: perl convertToPdf Storyboard.hmtl Storyboard.pdf 'Max Muster und Moritz Leuenberger'

=head1 DESCRIPTION

This script creates a new, temporary html file, replacing the names of the authors. Then it creates the pdf file from the html source and deletes the temporary html file.

=head1 AUTHOR

apt-ghetto

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2018 by apt-ghetto

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.2 or,
at your option, any later version of Perl 5 you may have available.

=head1 BUGS

None reported... yet.

=cut
