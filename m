Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C375C256
	for <lists.iommu@lfdr.de>; Mon,  1 Jul 2019 19:52:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 40AB64B7D;
	Mon,  1 Jul 2019 17:52:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2CEDB4B55
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 17:52:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DBDED782
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 17:52:48 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id 9so2878531vkw.4
	for <iommu@lists.linux-foundation.org>;
	Mon, 01 Jul 2019 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7tPtA5VMj5XTk9HfHyCSdXCGO8V+QBL24V8p4VgT7bc=;
	b=dMc2InLBbakhWgn9tl/CQbdFAxwH/ffb4bhQBvPsSfZ1sIfr4+5f3HdKofxLYjvmBf
	XAixPLmENZQUVwwmvEa+Puf7rLv1CAoLR+c8Y6ThNOzn/kElD3Gw+3RqV8qtEz49uPP1
	jPJdI2oBRMvN8iabJ+Gj6t50t1Y15W0Bm6lwIcg/PjcJLA05S1sE9MHe3wpVQn7CspqO
	5MAhJF/jC21j2Kqqvocn06A9yGv5sphrAo+QEHQ1zyuHoc3vdU8NJaUBFUshKbzivOOD
	uDsr4dMunXzREGVJtgBDmIiuMuUK6AAXBGXEemKp9+0CiudbYeSHYQUFJVl2jHR6RuXQ
	0XEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7tPtA5VMj5XTk9HfHyCSdXCGO8V+QBL24V8p4VgT7bc=;
	b=RYm8S0EksCs5BQ0zaZpifiubCgA9v2QtGhrwBc0nY3AC70phS2vUODkKfvm8jxyhKz
	pw8TvnF2uZ+fX/vA5UjoIxV6vWICPU+xfm9rV/+BJxSkoQxqjvCfwOIb/0tqETa9lqYw
	PrVZN2XIXVBBLePH61XJAL8YQk9ANGxBZzA5TdQCxS3Oo/jhxU0o0U6J64afWQPDeNE8
	2WKGN6R/6FrVOjTqEOE2nEomA/Tt0VbXeJotM0PPTnRRKPtKLwZFWHibFEkQSGdWGQWB
	2X4UHRPQw/Vgif2XtqkWAFBWNt/vhSG2wswnVLtEVJpH1cg1mHZThIgP19u1OlWaC5dI
	EEkQ==
X-Gm-Message-State: APjAAAXDEDJDmOYnvt9VekvAtJBa9dqfvPTUFwm5Bj/f6T8aHRczUzG/
	GMdmkqZURbXPCQ33Qw9mpxJsUcFBrEBTHLzCtR8=
X-Google-Smtp-Source: APXvYqy3bBvI5p0Pay27zc2fG/jAb2QJquxNOaKlG4p4dmovL9+Tqm+aLIqQnWh6ts21HEdL/dkOz6KGQL6GHW79FDQ=
X-Received: by 2002:a1f:1288:: with SMTP id 130mr8824757vks.12.1562003567854; 
	Mon, 01 Jul 2019 10:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <CACDBo564RoWpi8y2pOxoddnn0s3f3sA-fmNxpiXuxebV5TFBJA@mail.gmail.com>
	<CACDBo55GfomD4yAJ1qaOvdm8EQaD-28=etsRHb39goh+5VAeqw@mail.gmail.com>
	<20190626175131.GA17250@infradead.org>
	<CACDBo56fNVxVyNEGtKM+2R0X7DyZrrHMQr6Yw4NwJ6USjD5Png@mail.gmail.com>
	<c9fe4253-5698-a226-c643-32a21df8520a@arm.com>
	<CACDBo57CcYQmNrsTdMbax27nbLyeMQu4kfKZOzNczNcnde9g3Q@mail.gmail.com>
In-Reply-To: <CACDBo57CcYQmNrsTdMbax27nbLyeMQu4kfKZOzNczNcnde9g3Q@mail.gmail.com>
From: Pankaj Suryawanshi <pankajssuryawanshi@gmail.com>
Date: Mon, 1 Jul 2019 23:22:36 +0530
Message-ID: <CACDBo563pA6kY8T9gsbuE_DkHWyDM43dE570EtAJxm=V1G8Unw@mail.gmail.com>
Subject: Re: DMA-API attr - DMA_ATTR_NO_KERNEL_MAPPING
To: Robin Murphy <robin.murphy@arm.com>, pankaj.suryawanshi@einfochips.com
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org, iommu@lists.linux-foundation.org,
	Vlastimil Babka <vbabka@suse.cz>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4971967572343774196=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

--===============4971967572343774196==
Content-Type: multipart/alternative; boundary="000000000000ccca76058ca24ba7"

--000000000000ccca76058ca24ba7
Content-Type: text/plain; charset="UTF-8"

[CC: pankaj.suryawanshi@einfochips.com]

On Mon, Jul 1, 2019 at 11:17 PM Pankaj Suryawanshi <
pankajssuryawanshi@gmail.com> wrote:
>
>
>
>
> On Mon, Jul 1, 2019 at 7:39 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 28/06/2019 17:29, Pankaj Suryawanshi wrote:
>> > On Wed, Jun 26, 2019 at 11:21 PM Christoph Hellwig <hch@infradead.org>
wrote:
>> >>
>> >> On Wed, Jun 26, 2019 at 10:12:45PM +0530, Pankaj Suryawanshi wrote:
>> >>> [CC: linux kernel and Vlastimil Babka]
>> >>
>> >> The right list is the list for the DMA mapping subsystem, which is
>> >> iommu@lists.linux-foundation.org.  I've also added that.
>> >>
>> >>>> I am writing driver in which I used DMA_ATTR_NO_KERNEL_MAPPING
attribute
>> >>>> for cma allocation using dma_alloc_attr(), as per kernel docs
>> >>>> https://www.kernel.org/doc/Documentation/DMA-attributes.txt  buffers
>> >>>> allocated with this attribute can be only passed to user space by
calling
>> >>>> dma_mmap_attrs().
>> >>>>
>> >>>> how can I mapped in kernel space (after dma_alloc_attr with
>> >>>> DMA_ATTR_NO_KERNEL_MAPPING ) ?
>> >>
>> >> You can't.  And that is the whole point of that API.
>> >
>> > 1. We can again mapped in kernel space using dma_remap() api , because
>> > when we are using  DMA_ATTR_NO_KERNEL_MAPPING for dma_alloc_attr it
>> > returns the page as virtual address(in case of CMA) so we can mapped
>> > it again using dma_remap().
>>
>> No, you really can't. A caller of dma_alloc_attrs(...,
>> DMA_ATTR_NO_KERNEL_MAPPING) cannot make any assumptions about the void*
>> it returns, other than that it must be handed back to dma_free_attrs()
>> later. The implementation is free to ignore the flag and give back a
>> virtual mapping anyway. Any driver which depends on how one particular
>> implementation on one particular platform happens to behave today is,
>> essentially, wrong.
>
>
> Here is the example that i have tried in my driver.
> ///////////////code
snippet/////////////////////////////////////////////////////////////////////////
>
> For CMA allocation using DMA API with DMA_ATTR_NO_KERNEL_MAPPING  :-
>
> if(strcmp("video",info->name) == 0)
>         {
>         printk("Testing CMA Alloc %s\n", info->name);
>         info->dma_virt = dma_alloc_attrs(pmap_device, info->size, &phys,
GFP_KERNEL,
>                         DMA_ATTR_WRITE_COMBINE |
DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_KERNEL_MAPPING);
>         if (!info->dma_virt) {
>                 pr_err("\x1b[31m" "pmap: cma: failed to alloc %s"
"\x1b[0m\n",
>                                 info->name);
>                 return 0;
>         }
>                 __dma_remap(info->dma_virt, info->size, PAGE_KERNEL); //
pgprot we will take from attr
>                 virt = page_address(info->dma_virt);
>         }
>
> For CMA free using DMA api with DMA_ATTR_NO_KERNEL_MAPPING:-
>
> if(strcmp("video",info->name) == 0)
>         {
>         printk("Testing CMA Release\n");
>         __dma_remap(info->dma_virt, info->size, PAGE_KERNEL);
>         dma_free_attrs(pmap_device, info->size, info->dma_virt, phys,
>                         DMA_ATTR_WRITE_COMBINE |
DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_KERNEL_MAPPING);
>         }
>
> Flow of Function calls :-
>
> 1. static void *__dma_alloc() // .want_vaddr = ((attrs &
DMA_ATTR_NO_KERNEL_MAPPING) == 0)
>
> 2.cma_allocator :-
>                             i.  static void *cma_allocator_alloc ()
>                             ii. static void *__alloc_from_contiguous()
 // file name :- ./arch/arm/mm/dma-mapping.c
>                                                                      if
(!want_vaddr)
>
          goto out; // condition true for DMA_ATTR_NO_KERNEL_MAPPING
>
>                                                                      if
(PageHighMem(page)) {
>                                                                      ptr
= __dma_alloc_remap(page, size, GFP_KERNEL, prot, caller);
>                                                                      if
(!ptr) {
>
      dma_release_from_contiguous(dev, page, count);
>
      return NULL;
>                                                                       }
>                                                                      }
else {
>
 __dma_remap(page, size, prot);
>                                                                     ptr =
page_address(page);
>                                                                      }
>
>                                                                    out:

>
*ret_page = page; // return  page
>                                                                    return
ptr;  // nothing in ptr
>                                                                   }
>                             iii. struct page *dma_alloc_from_contiguous()
>                             iv. cma_alloc()
> 3. dma_alloc () // returns
> return args.want_vaddr ? addr : page; // returns page which is return by
alloc_from_contiguous().
>
> What wrong with this if we already know page is returning
dma_alloc_attr().
> we can use dma_remap in our driver and free as freed in static void
__free_from_contiguous ().
> Please let me know if i missing anything.
>
>> > 2. We can mapped in kernel space using vmap() as used for ion-cma
>> >
https://github.com/torvalds/linux/tree/master/drivers/staging/android/ion
>> >   as used in function ion_heap_map_kernel().
>> >
>> > Please let me know if i am missing anything.
>>
>> If you want a kernel mapping, *don't* explicitly request not to have a
>> kernel mapping in the first place. It's that simple.
>
>
> Do you mean do not use dma-api ? because if i used dma-api it will give
you mapped virtual address.
> or i have to use directly cma_alloc() in my driver. // if i used this
approach i need to reserved more vmalloc area.
>
> Any help would be appreciated.
>>
>>
>> Robin.

--000000000000ccca76058ca24ba7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>[CC: <a href=3D"mailto:pankaj.suryawan=
shi@einfochips.com">pankaj.suryawanshi@einfochips.com</a>]<br></div><br>On =
Mon, Jul 1, 2019 at 11:17 PM Pankaj Suryawanshi &lt;<a href=3D"mailto:panka=
jssuryawanshi@gmail.com">pankajssuryawanshi@gmail.com</a>&gt; wrote:<br>&gt=
;<br>&gt;<br>&gt;<br>&gt;<br>&gt; On Mon, Jul 1, 2019 at 7:39 PM Robin Murp=
hy &lt;<a href=3D"mailto:robin.murphy@arm.com">robin.murphy@arm.com</a>&gt;=
 wrote:<br>&gt;&gt;<br>&gt;&gt; On 28/06/2019 17:29, Pankaj Suryawanshi wro=
te:<br>&gt;&gt; &gt; On Wed, Jun 26, 2019 at 11:21 PM Christoph Hellwig &lt=
;<a href=3D"mailto:hch@infradead.org">hch@infradead.org</a>&gt; wrote:<br>&=
gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; On Wed, Jun 26, 2019 at 10:12:45PM +0=
530, Pankaj Suryawanshi wrote:<br>&gt;&gt; &gt;&gt;&gt; [CC: linux kernel a=
nd Vlastimil Babka]<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; The right lis=
t is the list for the DMA mapping subsystem, which is<br>&gt;&gt; &gt;&gt; =
<a href=3D"mailto:iommu@lists.linux-foundation.org">iommu@lists.linux-found=
ation.org</a>.=C2=A0 I&#39;ve also added that.<br>&gt;&gt; &gt;&gt;<br>&gt;=
&gt; &gt;&gt;&gt;&gt; I am writing driver in which I used DMA_ATTR_NO_KERNE=
L_MAPPING attribute<br>&gt;&gt; &gt;&gt;&gt;&gt; for cma allocation using d=
ma_alloc_attr(), as per kernel docs<br>&gt;&gt; &gt;&gt;&gt;&gt; <a href=3D=
"https://www.kernel.org/doc/Documentation/DMA-attributes.txt">https://www.k=
ernel.org/doc/Documentation/DMA-attributes.txt</a> =C2=A0buffers<br>&gt;&gt=
; &gt;&gt;&gt;&gt; allocated with this attribute can be only passed to user=
 space by calling<br>&gt;&gt; &gt;&gt;&gt;&gt; dma_mmap_attrs().<br>&gt;&gt=
; &gt;&gt;&gt;&gt;<br>&gt;&gt; &gt;&gt;&gt;&gt; how can I mapped in kernel =
space (after dma_alloc_attr with<br>&gt;&gt; &gt;&gt;&gt;&gt; DMA_ATTR_NO_K=
ERNEL_MAPPING ) ?<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; You can&#39;t.=
=C2=A0 And that is the whole point of that API.<br>&gt;&gt; &gt;<br>&gt;&gt=
; &gt; 1. We can again mapped in kernel space using dma_remap() api , becau=
se<br>&gt;&gt; &gt; when we are using =C2=A0DMA_ATTR_NO_KERNEL_MAPPING for =
dma_alloc_attr it<br>&gt;&gt; &gt; returns the page as virtual address(in c=
ase of CMA) so we can mapped<br>&gt;&gt; &gt; it again using dma_remap().<b=
r>&gt;&gt;<br>&gt;&gt; No, you really can&#39;t. A caller of dma_alloc_attr=
s(...,<br>&gt;&gt; DMA_ATTR_NO_KERNEL_MAPPING) cannot make any assumptions =
about the void*<br>&gt;&gt; it returns, other than that it must be handed b=
ack to dma_free_attrs()<br>&gt;&gt; later. The implementation is free to ig=
nore the flag and give back a<br>&gt;&gt; virtual mapping anyway. Any drive=
r which depends on how one particular<br>&gt;&gt; implementation on one par=
ticular platform happens to behave today is,<br>&gt;&gt; essentially, wrong=
.<br>&gt;<br>&gt;<br>&gt; Here is the example that i have tried in my drive=
r.<br>&gt; ///////////////code snippet/////////////////////////////////////=
////////////////////////////////////<br>&gt;<br>&gt; For CMA allocation usi=
ng DMA API with DMA_ATTR_NO_KERNEL_MAPPING =C2=A0:-<br>&gt;<br>&gt; if(strc=
mp(&quot;video&quot;,info-&gt;name) =3D=3D 0)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;Testing CMA Alloc=
 %s\n&quot;, info-&gt;name);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;d=
ma_virt =3D dma_alloc_attrs(pmap_device, info-&gt;size, &amp;phys, GFP_KERN=
EL,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 DMA_ATTR_WRITE_COMBINE | DMA_ATTR_FORCE_CONTIGUOUS | D=
MA_ATTR_NO_KERNEL_MAPPING);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!info-&=
gt;dma_virt) {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pr_err(&quot;\x1b[31m&quot; &quot;pmap: cma: failed to alloc %s&quot; &=
quot;\x1b[0m\n&quot;,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt=
;name);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn 0;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __dma_remap(info-&gt;dma_virt, info-&gt;=
size, PAGE_KERNEL); // pgprot we will take from attr<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virt =3D page_address(info-&gt;dm=
a_virt);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;<br>&gt; For CMA free=
 using DMA api with DMA_ATTR_NO_KERNEL_MAPPING:-<br>&gt;<br>&gt; if(strcmp(=
&quot;video&quot;,info-&gt;name) =3D=3D 0)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;Testing CMA Release\=
n&quot;);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 __dma_remap(info-&gt;dma_virt=
, info-&gt;size, PAGE_KERNEL);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_free=
_attrs(pmap_device, info-&gt;size, info-&gt;dma_virt, phys,<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DMA_ATTR_WRITE_COMBINE | DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_KERNEL=
_MAPPING);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;<br>&gt; Flow of Fu=
nction calls :-<br>&gt;<br>&gt; 1. static void *__dma_alloc() // .want_vadd=
r =3D ((attrs &amp; DMA_ATTR_NO_KERNEL_MAPPING) =3D=3D 0)<br>&gt;<br>&gt; 2=
.cma_allocator :-<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i. =C2=A0static void *cma_=
allocator_alloc ()<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ii. static void *__alloc_=
from_contiguous() =C2=A0// file name :- ./arch/arm/mm/dma-mapping.c<br>&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if (!want_vaddr)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out; // condition tru=
e for DMA_ATTR_NO_KERNEL_MAPPING<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (PageHighMem(page)) {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D __dma_alloc_=
remap(page, size, GFP_KERNEL, prot, caller);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (!ptr) {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dma_release_from_contiguous(dev, page, count);<br>&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>&gt; =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__dma_remap(page, size, prot);<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
tr =3D page_address(page);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;<br>&gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0out: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_page =
=3D page; // return =C2=A0page<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ptr; =C2=A0//=
 nothing in ptr<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iii. =
struct page *dma_alloc_from_contiguous()<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
v. cma_alloc()<br>&gt; 3. dma_alloc () // returns<br>&gt; return args.want_=
vaddr ? addr : page; // returns page which is return by alloc_from_contiguo=
us().<br>&gt;<br>&gt; What wrong with this if we already know page is retur=
ning dma_alloc_attr().<br>&gt; we can use dma_remap in our driver and free =
as freed in static void __free_from_contiguous ().<br>&gt; Please let me kn=
ow if i missing anything.<br>&gt;<br>&gt;&gt; &gt; 2. We can mapped in kern=
el space using vmap() as used for ion-cma<br>&gt;&gt; &gt; <a href=3D"https=
://github.com/torvalds/linux/tree/master/drivers/staging/android/ion">https=
://github.com/torvalds/linux/tree/master/drivers/staging/android/ion</a><br=
>&gt;&gt; &gt; =C2=A0 as used in function ion_heap_map_kernel().<br>&gt;&gt=
; &gt;<br>&gt;&gt; &gt; Please let me know if i am missing anything.<br>&gt=
;&gt;<br>&gt;&gt; If you want a kernel mapping, *don&#39;t* explicitly requ=
est not to have a<br>&gt;&gt; kernel mapping in the first place. It&#39;s t=
hat simple.<br>&gt;<br>&gt;<br>&gt; Do you mean do not use dma-api ? becaus=
e if i used dma-api it will give you mapped virtual address.<br>&gt; or i h=
ave to use directly cma_alloc() in my driver. // if i used this approach i =
need to reserved more vmalloc area.<br>&gt;<br>&gt; Any help would be appre=
ciated.<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; Robin.</div>

--000000000000ccca76058ca24ba7--

--===============4971967572343774196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============4971967572343774196==--
