Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 444743E3530
	for <lists.iommu@lfdr.de>; Sat,  7 Aug 2021 13:47:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B25AE40370;
	Sat,  7 Aug 2021 11:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uXFwSeg_XDc; Sat,  7 Aug 2021 11:47:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 83377402A1;
	Sat,  7 Aug 2021 11:47:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50D77C000E;
	Sat,  7 Aug 2021 11:47:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B9BAC000E
 for <iommu@lists.linux-foundation.org>; Sat,  7 Aug 2021 11:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74AB2838ED
 for <iommu@lists.linux-foundation.org>; Sat,  7 Aug 2021 11:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=svenpeter.dev header.b="gMk07UHo";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="VviLQjtm"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ab7jucTcoxv for <iommu@lists.linux-foundation.org>;
 Sat,  7 Aug 2021 11:47:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AE72837C4
 for <iommu@lists.linux-foundation.org>; Sat,  7 Aug 2021 11:47:46 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 838265C0091;
 Sat,  7 Aug 2021 07:47:43 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute1.internal (MEProxy); Sat, 07 Aug 2021 07:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm2; bh=fncGE/jKcnIvD//YI2Vm09vsvIlS
 YjnkVB8PpClLEPw=; b=gMk07UHoNUvfJMHru4HWm+9da7Pv3lETc88hDNtUmkSH
 WdcuslNF4DAWkco0dBjeb/hfBgb8bWCkJk+sdcgsHOaCZfWPp4BsuJ2IV9EHASOY
 LdM/P8AmloUs3wDaoal9WtIA6jlyA/xhPgNzNcn6KgSySXFbmYDE1kscKqd2hiPy
 ZBJsBVZymlrPzy8E0zVCAa59lpUuLi2GKlca4+hX40cLkFu4bFBPJZUIKZzSw/G5
 3jHYEu0H0pv5bbNjMeo161WGqHWFrtsayRnSOgKhA9B78dPuQfbNJAtjr6CrN7YB
 WCOY5ggJ4L0cfwWPYDVp+0SMaro4AcX7R1YiI0F4xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fncGE/
 jKcnIvD//YI2Vm09vsvIlSYjnkVB8PpClLEPw=; b=VviLQjtmqZXNPKscQL7Maa
 PkQC3LR+vXF1CarCQEmY8SHTbwL2bIjbMN2lVJg5g1zij9sk3LBVG4bOBV+fm+Ai
 oIrQvtrpKNC8zYvnHdgTu0MtFUnV4/mQXCkXc/ju54YygSHmzo7c8EbqAEvtumhx
 mtRFDlKfJMdjbnCtgnqBMECnRo8CI+fj2ohgqFHuevuMLpvxI1Eg9a7JpuvkmEw/
 Vscqfl4EzgFXgcR4+d7r5ck4yMp4zErSPRYdzsouIW500hKbe1gUHbx+xYP+kUa3
 rJmCQ+R0w5XL9dHltM0HnIQuSrwF/AANE+bw5bQeli3yAM9g7vMv2h8XfSdUODeg
 ==
X-ME-Sender: <xms:3nIOYVdAr-2ggG7DyzEyWjrhHqNAz71JlZ0eKdqNqDdYDIN566-3uw>
 <xme:3nIOYTOrlrF7KGmYqnPP6IhQ14fog6YWkWVKFExodPIbnmf5IuWvOT16hTRVyBTVT
 _R_opBMiEOaKT31SZ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeefgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfufhvvghn
 ucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrth
 htvghrnhepheejgfdttdefleefteejieefudeuheelkedtgedtjeehieetueelheeuhfeg
 heegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
 hvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:3nIOYegOW_8hdHquGep4k1vxFI2tlddXqKcmtGUlH7cBeCncWeSMow>
 <xmx:3nIOYe807bstWQO-YgerHiZuZXDm7WXFaF9AQMgDHqMAUgIJkgEcLg>
 <xmx:3nIOYRsIJmy7xeLHTmbP560CsRzvZghcE6SHkLj2a2OB6q2pFTu70w>
 <xmx:33IOYfXCSIkr908gpcYCbC5Xm-NoORAubxt8W8CNE2LvN-a14eEwIw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 378E151C04D7; Sat,  7 Aug 2021 07:47:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-552-g2afffd2709-fm-20210805.001-g2afffd27
Mime-Version: 1.0
Message-Id: <dadbd8b0-171a-4008-8a2e-f68abfed9285@www.fastmail.com>
In-Reply-To: <d289a555-9e3b-b948-1883-2ee4c915da4c@arm.com>
References: <20210806155523.50429-1-sven@svenpeter.dev>
 <20210806155523.50429-3-sven@svenpeter.dev>
 <d289a555-9e3b-b948-1883-2ee4c915da4c@arm.com>
Date: Sat, 07 Aug 2021 13:47:21 +0200
To: "Robin Murphy" <robin.murphy@arm.com>,
 "Sven Peter" <iommu@lists.linux-foundation.org>
Subject: =?UTF-8?Q?Re:_[RFC_PATCH_2/3]_iommu/dma-iommu:_Support_iovad->granule_>_?=
 =?UTF-8?Q?PAGE=5FSIZE?=
Cc: Arnd Bergmann <arnd@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Will Deacon <will@kernel.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
From: Sven Peter via iommu <iommu@lists.linux-foundation.org>
Reply-To: Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>



On Fri, Aug 6, 2021, at 20:04, Robin Murphy wrote:
> On 2021-08-06 16:55, Sven Peter via iommu wrote:
> > @@ -1006,6 +1019,31 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
> >   	if (dev_is_untrusted(dev))
> >   		return iommu_dma_map_sg_swiotlb(dev, sg, nents, dir, attrs);
> >   
> > +	/*
> > +	 * If the IOMMU pagesize is larger than the CPU pagesize we will
> > +	 * very likely run into sgs with a physical address that is not aligned
> > +	 * to an IOMMU page boundary. Fall back to just mapping every entry
> > +	 * independently with __iommu_dma_map then.
> 
> Scatterlist segments often don't have nicely aligned ends, which is why 
> we already align things to IOVA granules in main loop here. I think in 
> principle we'd just need to move the non-IOVA-aligned part of the 
> address from sg->page to sg->offset in the temporary transformation for 
> the rest of the assumptions to hold. I don't blame you for being timid 
> about touching that, though - it took me 3 tries to get right when I 
> first wrote it...
> 


I've spent some time with that code now and I think we cannot use it
but have to fall back to iommu_dma_map_sg_swiotlb (even though that swiotlb
part is a lie then):

When we have sg_phys(s) = 0x802e65000 with s->offset = 0 the paddr
is aligned to PAGE_SIZE but has an offset of 0x1000 from something
the IOMMU can map.
Now this would result in s->offset = -0x1000 which is already weird
enough.
Offset is unsigned (and 32bit) so this will actually look like
s->offset = 0xfffff000 then, which isn't much better.
And then sg_phys(s) = 0x902e64000 (instead of 0x802e64000) and
we'll map some random memory in iommu_map_sg_atomic and a little bit later
everything explodes.

Now I could probably adjust the phys addr backwards and make sure offset is
always positive (and possibly larger than PAGE_SIZE) and later restore it
in __finalise_sg then but I feel like that's pushing this a little bit too far.



Sven
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
