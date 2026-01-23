function one(file) {
	while((getline <file) == 1)
		if(patsplit($0, linenos, /LINENOS(_[0-9]+[fsSz]*)+/))
			for(i = 1; i <= length(linenos); ++i) {
				if(!linenos[i] || done[linenos[i]])
					continue
				done[linenos[i]] = 1

				split(linenos[i], matches, "_")
				# print "// " length(matches)
				printf "#define %s <pre class=linenos>", linenos[i]
				l = 1
				for(j = 2; j <= length(matches); ++j) {
					# printf "<!--%s-->", matches[j]
					if(matches[j] ~ /f/) {
						l = matches[j] + 0
						continue
					}
					type = matches[j] ~ /s/ ? "small" : matches[j] ~ /S/ ? "strong" : 0;
					if(type)
						printf "<%s>", type
					cnt = matches[j] + 0
					if(matches[j] ~ /z/)
						while(cnt--)
							printf "(U+200B)FORCED_NEWLINE"
					else
						while(cnt--)
							printf "/**/%d/**/FORCED_NEWLINE", l++
					if(type)
						printf "</%s>", type
				}
				print "</pre>"
			}
		else if(patsplit($0, linenos, /LINETEXTS(_([^_]*)_[0-9]+[sS]*)+/))
			for(i = 1; i <= length(linenos); ++i) {
				if(!linenos[i] || done[linenos[i]])
					continue
				done[linenos[i]] = 1

				split(linenos[i], matches, "_")
				# print "// " length(matches)
				printf "#define %s <pre class=linenos>", linenos[i]
				l = 1
				for(j = 2; j <= length(matches); j += 2) {
					label = matches[j]
					cnt   = matches[j + 1] + 0
					type = matches[j + 1] ~ /s/ ? "small" : matches[j + 1] ~ /S/ ? "strong" : 0;
					if(type)
						printf "<%s>", type
					if(!label)
						while(cnt--)
							printf "(U+200B)FORCED_NEWLINE"
					else
						while(cnt--)
							printf "/**/%s/**/FORCED_NEWLINE", label
					if(type)
						printf "</%s>", type
				}
				print "</pre>"
			}
}

END {
	one("src/blogn_t/023,a-v1-nbuf-benchmark.html.pp")
	one("src/blogn_t/023,a.01-dskw.h")
	one("src/blogn_t/023,a.02-dskwC.h")
	one("src/blogn_t/023,b-DeFelice-polemic.html.pp")
}
