Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E06107C62
	for <lists.iommu@lfdr.de>; Sat, 23 Nov 2019 03:18:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71B9D884FB;
	Sat, 23 Nov 2019 02:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSv9Q450Tc+a; Sat, 23 Nov 2019 02:18:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BEBF588DAE;
	Sat, 23 Nov 2019 02:18:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A391EC18DA;
	Sat, 23 Nov 2019 02:18:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8705C18DA
 for <iommu@lists.linux-foundation.org>; Sat, 23 Nov 2019 02:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A3F1B884FB
 for <iommu@lists.linux-foundation.org>; Sat, 23 Nov 2019 02:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVlv-znjuB2s for <iommu@lists.linux-foundation.org>;
 Sat, 23 Nov 2019 02:18:40 +0000 (UTC)
X-Greylist: delayed 08:10:02 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0077.hostedemail.com
 [216.40.44.77])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 960E888303
 for <iommu@lists.linux-foundation.org>; Sat, 23 Nov 2019 02:18:40 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 7CC281802C523
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 16:49:47 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id DD3195DE6;
 Fri, 22 Nov 2019 16:49:44 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2693:2828:2899:3138:3139:3140:3141:3142:3355:3622:3865:3867:3868:3870:3871:3872:3873:3874:4250:4321:5007:6119:7903:8660:10004:10400:10450:10455:10848:11026:11232:11658:11914:12043:12050:12295:12296:12297:12555:12740:12760:12895:12986:13019:13148:13163:13229:13230:13439:13868:14659:14721:19904:19999:21080:21433:21451:21627:21740:30054:30055:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: hole56_37d7e5c41a81d
X-Filterd-Recvd-Size: 3502
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Fri, 22 Nov 2019 16:49:43 +0000 (UTC)
Message-ID: <2ab69d678d82a37ac89ea8421bd7e93e356e7456.camel@perches.com>
Subject: Re: [PATCH v2] iommu/iova: silence warnings under memory pressure
From: Joe Perches <joe@perches.com>
To: Qian Cai <cai@lca.pw>, jroedel@suse.de
Date: Fri, 22 Nov 2019 08:49:19 -0800
In-Reply-To: <1574441218.9585.26.camel@lca.pw>
References: <20191122025510.4319-1-cai@lca.pw>
 <7fd08d481a372ea0b600f95c12166ab54ed5e267.camel@perches.com>
 <1574434760.9585.18.camel@lca.pw>
 <799a49ee8fc8041a00332e0866554ddc04a2b8b0.camel@perches.com>
 <1574441218.9585.26.camel@lca.pw>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, 2019-11-22 at 11:46 -0500, Qian Cai wrote:
> On Fri, 2019-11-22 at 08:28 -0800, Joe Perches wrote:
> > On Fri, 2019-11-22 at 09:59 -0500, Qian Cai wrote:
> > > On Thu, 2019-11-21 at 20:37 -0800, Joe Perches wrote:
> > > > On Thu, 2019-11-21 at 21:55 -0500, Qian Cai wrote:
> > > > > When running heavy memory pressure workloads, this 5+ old system is
> > > > > throwing endless warnings below because disk IO is too slow to recover
> > > > > from swapping. Since the volume from alloc_iova_fast() could be large,
> > > > > once it calls printk(), it will trigger disk IO (writing to the log
> > > > > files) and pending softirqs which could cause an infinite loop and make
> > > > > no progress for days by the ongoimng memory reclaim. This is the counter
> > > > > part for Intel where the AMD part has already been merged. See the
> > > > > commit 3d708895325b ("iommu/amd: Silence warnings under memory
> > > > > pressure"). Since the allocation failure will be reported in
> > > > > intel_alloc_iova(), so just call printk_ratelimted() there and silence
> > > > > the one in alloc_iova_mem() to avoid the expensive warn_alloc().
> > > > 
> > > > []
> > > > > v2: use dev_err_ratelimited() and improve the commit messages.
> > > > 
> > > > []
> > > > > diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> > > > 
> > > > []
> > > > > @@ -3401,7 +3401,8 @@ static unsigned long intel_alloc_iova(struct device *dev,
> > > > >  	iova_pfn = alloc_iova_fast(&domain->iovad, nrpages,
> > > > >  				   IOVA_PFN(dma_mask), true);
> > > > >  	if (unlikely(!iova_pfn)) {
> > > > > -		dev_err(dev, "Allocating %ld-page iova failed", nrpages);
> > > > > +		dev_err_ratelimited(dev, "Allocating %ld-page iova failed",
> > > > > +				    nrpages);
> > > > 
> > > > Trivia:
> > > > 
> > > > This should really have a \n termination on the format string
> > > > 
> > > > 		dev_err_ratelimited(dev, "Allocating %ld-page iova failed\n",
> > > > 
> > > > 
> > > 
> > > Why do you say so? It is right now printing with a newline added anyway.
> > > 
> > >  hpsa 0000:03:00.0: DMAR: Allocating 1-page iova failed
> > 
> > If another process uses pr_cont at the same time,
> > it can be interleaved.
> 
> I lean towards fixing that in a separate patch if ever needed, as the origin
> dev_err() has no "\n" enclosed either.

Your choice.

I wrote trivia:, but touching the same line multiple times
is relatively pointless.



_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
