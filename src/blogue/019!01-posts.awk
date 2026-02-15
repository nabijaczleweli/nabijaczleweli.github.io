BEGIN {
	FS = "\t"

	print "<blockquote>\\"
}

{
	time = $1;        user = $2;        post = $3;       control = $4
	                  users[NR] = user; posts[NR] = post

	context   = sub(/[[:space:]]*context!/,   "", control)
	forcetime = sub(/[[:space:]]*forcetime!/, "", control)
	reply     = (control ~ /reply!/) ? gensub(/.*reply!([^[:space:]]*).*/, "\\1", 1, control) : 0

	print "<div id=" NR "><span" (context ? " class=\"context\"" : "") ">\\"
	if(reply)
		print "<a class=\"backlink\" href=\"#" reply "\">↬ <strong>" users[reply] "<span>:</span></strong> <span>" evenout(posts[reply]) "</span></a>"
	print "<h4><a href=\"#" NR "\"><time datetime=\"2025-09-18 " time "+02:00\"" ((time == lasttime && user == lastuser && !forcetime) ? " class=hoveronly" : "") "><span>[</span>" time "<span>]</span></time></a> <strong>" user "<span>:</span></strong></h4> <span>" evenout(post) "</span>\\"
	print "</span></div>\\"

	lasttime = time; lastuser = user
}

END {
	print "</blockquote>"
}

function evenout(a) {
	gsub(/'/, "&<!--&-->", a)
	return a
}
