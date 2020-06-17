#!C:/Perl/bin/perl -w
require "cgi-lib.pl";

MAIN:
{
    if(&ReadParse(*input))
    {
        $random = rand;
        open(INFO, "communication");
        print INFO "Company = $input{'Company'};Name = $input{'Name'};Email = $input{'Email'};Random = $Random\n";
        close(INFO);
        print <<ABCDEF;
Content-type:text/html; charset=utf-8;


<html>
<head>
</head>
<body>
<form name=form1>
<input type=hidden name=name value="$input{'Name'}">
<input type=hidden name=company value="$input{'Company'}">
<input type=hidden name=email value="$input{'Email'}">
<input type=hidden name=random value="$Random">
<textarea name=disp rows=40 cols=70></textarea><br>
<br><br>
<textarea name=in rows=10 cols=70></textarea><br>
Message to send:<br>
<input type=button onclick="trans()" value="Send">
</form>
<script language=Javascript>
        if(window.XMLHttpRequest)
        {
            request=new XMLHttpRequest();
        }
        else//for older IE 5/6
        {
            request=new ActiveXObject("Microsoft.XMLHTTP");
        }


function trans()
{
    request.open("POST","receive.pl",true);
    request.setRequestHeader("Content-type","application/x-www-form-urlencoded");

    request.send("name="+document.form1.name.value+"&company="+document.form1.company.value+"&email="+document.form1.email.value+"&random="+document.form1.random.value+"&msg="+document.form1.in.value);
    request.onreadystatechange = function(){
        if(request.readyState == 4 && request.status ==200){
            document.form1.disp.value+=document.form1.in.value;
            document.form1.in.value="";
        }
        else{
            //alert("Error "+request.status+": "+request.statusText);
        }
    }
}
</script>
</body>
</html>
ABCDEF
    }
}