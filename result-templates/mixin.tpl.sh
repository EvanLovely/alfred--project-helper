mixin=$(echo $1 | sed "s/^.*@mixin //" | sed "s/ {//")
echo "<item arg='sh mixin-handler.sh \"${mixin//$/\\$}\"' uid=\"$mixin\">"
echo "<title>$mixin</title>"
echo "<subtitle>$(echo ${1/$dir\//} | sed "s/\:@mixin .*//")</subtitle>"
echo "<icon>icons/email.png</icon>"
echo "</item>"
