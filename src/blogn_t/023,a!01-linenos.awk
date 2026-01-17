END {
	while((getline <"src/blogn_t/023,a-v1-nbuf-benchmark.html.pp") == 1)
		if(patsplit($0, linenos, /LINENOS(_[0-9]+[fsSz]*)+/))
			for(i = 0; i < length(linenos); ++i) {
				if(!linenos[i] || done[linenos[i]])
					continue
				done[linenos[i]] = 1

				printf "#define %s <pre class=linenos>", linenos[i]
				split(linenos[i], matches, "_")
				l = 1
				for(j = 2; j <= length(matches); ++j) {
					if(matches[j] ~ /f/) {
						l = matches[j] + 0
						continue
					}
					type = matches[j] ~ /s/ ? "small" : matches[j] ~ /S/ ? "strong" : 0;
					if(type)
						printf "<%s>", type
					if(matches[j] ~ /z/)
						for(q = 1; q <= matches[j]; ++q)
							printf "(U+200B)FORCED_NEWLINE"
					else
						for(q = 1; q <= matches[j]; ++q)
							printf "%dFORCED_NEWLINE", l++
					if(type)
						printf "</%s>", type
				}
				print "</pre>"
			}
}
