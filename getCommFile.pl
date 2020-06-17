#!C:/Perl/bin/perl -w
require "cgi-lib.pl";

MAIN:
{
    if(&ReadParse(*input))
    {
        open(FILE,"communication");
        $/ = EOF123;
        $file = <FILE>;
        close(FILE);
        print <<ABCDE;
Content-type:text/html; charset=utf-8;


ABCDE
        print $file;
    }
}