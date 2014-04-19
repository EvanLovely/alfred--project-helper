mixin=$(echo $1 | sed "s/^.*@mixin //" | sed "s/{//")
echo "<item arg=\"$(echo $mixin | sed "s/@mixin //")\" uid=\"$mixin\">"
echo "<title>@mixin $mixin</title>"
echo "<subtitle>$(echo ${1/$dir\//} | sed "s/\:@mixin .*//")</subtitle>"
echo "<icon>icons/email.png</icon>"
echo "</item>"
