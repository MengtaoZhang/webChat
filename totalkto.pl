#!C:/Perl/bin/perl -w
require "cgi-lib.pl";

MAIN:
{
    if(&ReadParse(*input))
    {
        open(INFO,"information");

        print qq(Content-Type: text/html; charset=utf-8;\n\n
        <html><head><meta charset="utf-8"></head><body>);

        $/="\n";
        while($info = <INFO>)
        {
            

            $info =~ /Company = ([^;]*);/;
            
            $company=$1;

            $info =~ /Name = ([^;]*);/;
            
            $name=$1;

            $info =~ /Email = ([^;]*);/;
            
            
            $email=$1;
            $random=rand;

            print qq(<a href="comm.pl?company=$company&name=$name&email=$email&random=$random">Company: $company, Name: $name, Email=$email</a>);
            print qq(<br>)

            # print qq(<a href="company.pl?Company=$Companyname&Name=$name&Email=$email&random=$random">);
            # print qq(Company: $Companyname Name: $name Email: email);
            # print qq(</a><br>);
        }

        print qq(</body></html>);
        close(INFO);
    }
}


#         while($line=<INFO>)
#         {
#             $line = ~/Name: /;
#             $follow = $';
#             $follow =~ /;/;
#             $name = $';
#         }
#         for($info=<INFO>)
#         {
#             $info =~ /sever:(.*)$/
#             $sever[index]=$2;
#             $index++;
#         }
#         print <<ABCDEF;
# Content-type:text/html; charset=utf-8;


# <html>
# <head>
# </head>
# <body>
# for($i=0;$i<=$#sever;i++)
# {
#     print "<a href="communication.pl? sever=sever$sever[$i] & client+=$input{'_'}；
# }
# print "</body>\n";
# print "</html>\n";
# ABCDEF