Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6D235129
	for <lists.iommu@lfdr.de>; Sat,  1 Aug 2020 10:29:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 940E42011B;
	Sat,  1 Aug 2020 08:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0dzaHlNyZ8hR; Sat,  1 Aug 2020 08:29:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3353020336;
	Sat,  1 Aug 2020 08:29:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18FEDC004D;
	Sat,  1 Aug 2020 08:29:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36DD2C004D
 for <iommu@lists.linux-foundation.org>; Sat,  1 Aug 2020 08:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 25D0788810
 for <iommu@lists.linux-foundation.org>; Sat,  1 Aug 2020 08:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13IZCMoixtHS for <iommu@lists.linux-foundation.org>;
 Sat,  1 Aug 2020 08:29:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8386D887F8
 for <iommu@lists.linux-foundation.org>; Sat,  1 Aug 2020 08:29:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E723468C4E; Sat,  1 Aug 2020 10:29:24 +0200 (CEST)
Date: Sat, 1 Aug 2020 10:29:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: dma-pool fixes
Message-ID: <20200801082924.GA2806@lst.de>
References: <20200728120716.GA2507@lst.de>
 <CAMi1Hd1c3cNMYg+S5Pwuv30QCdcWJw+QxkWmNP34s3nb+_yUuA@mail.gmail.com>
 <20200728124114.GA4865@lst.de>
 <CAMi1Hd0wpcLVJ41h6gs4H0WEDVpNEs7N=wx+KQ_yRKeSv0kQ9g@mail.gmail.com>
 <20200728153055.GA16701@lst.de>
 <18a3b93cc5ba3e0e39ae1b14759ce31121d54045.camel@suse.de>
 <CAMi1Hd3QNtZVEFUgDprT==wcVHKv6TsvpT3RurVJTDb1op2LnA@mail.gmail.com>
 <CAMi1Hd09EbzOgTU5P4EDS8BQ6J2jFntvyR49BePyAqJ15DBB0Q@mail.gmail.com>
 <20200731130903.GA31110@lst.de>
 <alpine.DEB.2.23.453.2007311204010.3836388@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.23.453.2007311204010.3836388@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Amit Pundir <amit.pundir@linaro.org>, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Fri, Jul 31, 2020 at 12:04:28PM -0700, David Rientjes wrote:
> On Fri, 31 Jul 2020, Christoph Hellwig wrote:
> 
> > > Hi Nicolas, Christoph,
> > > 
> > > Just out of curiosity, I'm wondering if we can restore the earlier
> > > behaviour and make DMA atomic allocation configured thru platform
> > > specific device tree instead?
> > > 
> > > Or if you can allow a more hackish approach to restore the earlier
> > > logic, using of_machine_is_compatible() just for my device for the
> > > time being. Meanwhile I'm checking with other developers running the
> > > mainline kernel on sdm845 phones like OnePlus 6/6T, if they see this
> > > issue too.
> > 
> > If we don't find a fix for your platform I'm going to send Linus a
> > last minute revert this weekend, to stick to the no regressions policy.
> > I still hope we can fix the issue for real.
> > 
> 
> What would be the scope of this potential revert?

I've just looked into that and it seems like we need to revert everything
pool related back ot "dma-pool: add additional coherent pools to map to gfp
mask".
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
