#define __LICENSE                                                  \
// nabijaczleweli.xyz (c) by nabijaczleweli                        \
​//                                                                 \
// nabijaczleweli.xyz is licensed under a                          \
// Creative Commons Attribution 4.0 International License.         \
​//                                                                 \
// You should have received a copy of the license along with this  \
// work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
#undef __LICENSE


#ifndef CONT
#define CONT continuing
#endif


<figure class=STR(offset CONT C) id="dskw-C">
LINENOS
<pre>
<small>\
extern r1, r2, r3, cdev;
</small>\
<!--"-->dskw(_ino) <del>/* write routine for non-special files */</del><!--"-->
{
<strong>\
<!--"-->	r1 = _ino; iget(); <del>/* write i-node out (if modified), read i-node 'r1' on 'cdev'<!--"-->
</strong>\
<!--"-->	                      into i-node area of core */</del><!--"-->
<!--"-->	r2 = *u.fofp + u.count; <del>/* file offset [(u.off) or the offset in<!--"-->
<!--"-->	                           the fsp entry for this file] +<!--"-->
<!--"-->	                           no. of bytes to be written */</del><!--"-->
<!--"-->	if(r2 > i.size) {<!--"-->
<!--"-->		i.size = r2;<!--"-->
<!--"-->		setimod();<!--"-->
<!--"-->	}<!--"-->
<!---->
<!--"-->	while(u.count)<!--"--> L(a,{)
<!--"-->		mget(); <del>/* get the block no. in which to write the next data byte */</del><!--"-->
<!---->
<!--"-->		<del>/* if lower 9 bits of file offset are 0,<!--"-->
<!--"-->		   file offset = 0, 512, 1024,...(i.e., start of new block): */</del><!--"-->
<!--"-->		if(*u.fofp & 511 || u.count < 512)<!--"--> L(b,{)
<!--"-->			dskrd();  <del>/* if there is not enough data to fill an entire block, */</del><!--"-->
<!--"-->		<!--"-->L(c,})<!--"-->	          <del>/* read block 'r1' on 'cdev' into an I/O buffer */</del><!--"-->
<!---->
<!--"-->		wslot(); <del>/* set write and inhibit bits in I/O queue, proc. status=0,<!--"-->
<!--"-->		            r5 points to 1st word of data */</del><!--"-->
<!--"-->		sioreg(); <del>/* r3 = no. of bytes of data,<!--"-->
<!--"-->		             r1 = address of data,<!--"-->
<!--"-->		             r2 points to location in buffer in which to start writing data */</del><!--"-->
<small>\
<!--"-->		<!--"-->L(d,_memcpy)<!--"-->(r2, r1, r3); <del>/* transfer a byte of data to the I/O buffer */</del><!--"-->
<!---->
</small>\
<strong>\
<!--"-->		dskwr(); <del>/* yes, write the block and the i-node */</del><!--"-->
</strong>\
<!--"-->	}<!--"-->
<small>\
<!-- goto *ret;, which is is equivalent to a bare return here -->\
</small>\
}
</pre>
</figure>


#undef LINENOS
#undef CONT
