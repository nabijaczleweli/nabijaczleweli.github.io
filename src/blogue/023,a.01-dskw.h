#define __LICENSE                                                  \
// nabijaczleweli.xyz (c) by nabijaczleweli                        \
​//                                                                 \
// nabijaczleweli.xyz is licensed under a                          \
// Creative Commons Attribution 4.0 International License.         \
​//                                                                 \
// You should have received a copy of the license along with this  \
// work. If not, see <https://creativecommons.org/licenses/by/4.0/>.
#undef __LICENSE


#define L(group, ...) <span class=STR(label group)>__VA_ARGS__</span>
<figure class="offset continuing">
LINENOS_212f_2_1S_1_4s_28_4s_1S_3s
<pre>
<!--"-->dskw: <del>/ write routine for non-special files</del><!--"-->
<!--"-->	mov	(sp),r1 <del>/ get an i-node number from the stack into r1</del><!--"-->
<strong>\
<!--"-->	jsr	r0,iget <del>/ write i-node out (if modified), read i-node 'r1'</del><!--"-->
</strong>\
<!--"-->		        <del>/ into i-node area of core</del><!--"-->
<small>\
<!--"-->	mov	 *u.fofp,r2 <del>/ put the file offset [(u.off) or the offset in</del><!--"-->
<!--"-->		            <del>/ the fsp entry for this file] in r2</del><!--"-->
<!--"-->	add	 u.count,r2 <del>/ no. of bytes to be written + file offset is</del><!--"-->
<!--"-->		            <del>/ put in r2</del><!--"-->
</small>\
<!--"-->	cmp	 r2,i.size <del>/ is this greater than the present size of</del><!--"-->
<!--"-->		           <del>/ the file?</del><!--"-->
<!--"-->	blos	 <!--"-->L(a,1f)<!--"--> <del>/ no, branch</del><!--"-->
<!--"-->	 mov	r2,i.size <del>/ yes, increase the f11e size to file offset +</del><!--"-->
<!--"-->		           <del>/ no. of data bytes</del><!--"-->
<!--"-->	 jsr	r0,setimod <del>/ set imod=1 (i.e., core inode has been</del><!--"-->
<!--"-->		           <del>/ modified), stuff tlme of modification into</del><!--"-->
<!--"-->		           <del>/ core image of i-node</del><!--"-->
L(a,1):
<!--"-->	jsr	r0,mget <del>/ get the block no. in which to write the next data</del><!--"-->
<!--"-->		        <del>/ byte</del><!--"-->
<!--"-->	bit	*u.fofp,$777 <del>/ test the lower 9 bits of the file offset</del><!--"-->
<!--"-->	bne	<!--"-->L(b,2f)<!--"--> <del>/ if its non-zero, branch; if zero, file offset = 0,</del><!--"-->
<!--"-->		   <del>/ 512, 1024,...(i.e., start of new block)</del><!--"-->
<!--"-->	cmp	u.count,$512. <del>/ if zero, is there enough data to fill an</del><!--"-->
<!--"-->		              <del>/ entire block? (i.e., no. of</del><!--"-->
<!--"-->	bhis	<!--"-->L(c,3f)<!--"--> <del>/ bytes to be written greater than 512.? Yes, branch.</del><!--"-->
<!--"-->		   <del>/ Don't have to read block</del><!--"-->
L(b,2):<!--"--> <del>/ in as no past info. is to be saved (the entire block will be</del><!--"-->
<!--"-->   <del>/ overwritten).</del><!--"-->
<!--"-->	jsr	r0,dskrd <del>/ no, must retain old info.. Hence, read block 'r1'</del><!--"-->
<!--"-->		         <del>/ into an I/O buffer</del><!--"-->
L(c,3):
<!--"-->	jsr	r0,wslot <del>/ set write and inhibit bits in I/O queue, proc.</del><!--"-->
<!--"-->		         <del>/ status=0, r5 points to 1st word of data</del><!--"-->
<!--"-->	jsr	r0,sioreg <del>/ r3 = no. of bytes of data, r1 = address of data,</del><!--"-->
<!--"-->		          <del>/ r2 points to location in buffer in which to</del><!--"-->
<!--"-->		          <del>/ start writing data</del><!--"-->
<small>\
L(d,2):
<!--"-->	movb	(r1 )+,(r2)+ <del>/ transfer a byte of data to the I/O buffer</del><!--"-->
<!--"-->	dec	r3 <del>/ decrement no. of bytes to be written</del><!--"-->
<!--"-->	bne	<!--"-->L(d,2b)<!--"--> <del>/ have all bytes been transferred? No, branch</del><!--"-->
</small>\
<strong>\
<!--"-->	jsr	r0,dskwr <del>/ yes, write the block and the i-node</del><!--"-->
</strong>\
<small>\
<!--"-->	tst	u.count <del>/ any more data to write?</del><!--"-->
<!--"-->	bne	<!--"-->L(a,1b)<!--"--> <del>/ yes, branch</del><!--"-->
<!--"-->	jmp	ret <del>/ no, return to the caller via 'ret'</del><!--"-->
</small>\
</pre>
<figcaption>
	Heed <strong>emphasised</strong> fragments<br />
	(labels colour-coded; note that <tt>123</tt> is octal and <tt>123.</tt> is decimal; <tt>_</tt>-prefixed names expositional)
</figcaption>
</figure>
<p class="continuing">
which can be translated to
</p>
#define LINENOS LINENOS_1sz_212f_1_1z_214f_1S_4_220f_1_223f_1_225f_2_2z_229f_1_3z_240f_2_2z_243f_5_2sz_252f_1S_1z_1z
#include "023,a.02-dskwC.h"
