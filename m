Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F423514C
	for <lists.iommu@lfdr.de>; Sat,  1 Aug 2020 10:57:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5179D889BA;
	Sat,  1 Aug 2020 08:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28Q8IaugL61h; Sat,  1 Aug 2020 08:57:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A5A2C87841;
	Sat,  1 Aug 2020 08:57:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75883C0864;
	Sat,  1 Aug 2020 08:57:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10FA4C004D
 for <iommu@lists.linux-foundation.org>; Sat,  1 Aug 2020 08:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E144187841
 for <iommu@lists.linux-foundation.org>; Sat,  1 Aug 2020 08:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48Y1U40Q7NvV for <iommu@lists.linux-foundation.org>;
 Sat,  1 Aug 2020 08:57:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9EC18889BA
 for <iommu@lists.linux-foundation.org>; Sat,  1 Aug 2020 08:57:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2175668C4E; Sat,  1 Aug 2020 10:57:07 +0200 (CEST)
Date: Sat, 1 Aug 2020 10:57:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: revert scope for 5.8, was Re: dma-pool fixes
Message-ID: <20200801085706.GA2991@lst.de>
References: <CAMi1Hd1c3cNMYg+S5Pwuv30QCdcWJw+QxkWmNP34s3nb+_yUuA@mail.gmail.com>
 <20200728124114.GA4865@lst.de>
 <CAMi1Hd0wpcLVJ41h6gs4H0WEDVpNEs7N=wx+KQ_yRKeSv0kQ9g@mail.gmail.com>
 <20200728153055.GA16701@lst.de>
 <18a3b93cc5ba3e0e39ae1b14759ce31121d54045.camel@suse.de>
 <CAMi1Hd3QNtZVEFUgDprT==wcVHKv6TsvpT3RurVJTDb1op2LnA@mail.gmail.com>
 <CAMi1Hd09EbzOgTU5P4EDS8BQ6J2jFntvyR49BePyAqJ15DBB0Q@mail.gmail.com>
 <20200731130903.GA31110@lst.de>
 <alpine.DEB.2.23.453.2007311204010.3836388@chino.kir.corp.google.com>
 <alpine.DEB.2.23.453.2008010105560.4078406@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.23.453.2008010105560.4078406@chino.kir.corp.google.com>
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

On Sat, Aug 01, 2020 at 01:20:07AM -0700, David Rientjes wrote:
> To follow-up on this, the introduction of the DMA atomic pools in 5.8 
> fixes an issue for any AMD SEV enabled guest that has a driver that 
> requires atomic DMA allocations (for us, nvme) because runtime decryption 
> of memory allocated through the DMA API may block.  This manifests itself 
> as "sleeping in invalid context" BUGs for any confidential VM user in 
> cloud.
> 
> I unfortunately don't have Amit's device to be able to independently debug 
> this issue and certainly could not have done a better job at working the 
> bug than Nicolas and Christoph have done so far.  I'm as baffled by the 
> results as anybody else.
> 
> I fully understand the no regressions policy.  I'd also ask that we 
> consider that *all* SEV guests are currently broken if they use nvme or 
> any other driver that does atomic DMA allocations.  It's an extremely 
> serious issue for cloud.  If there is *anything* that I can do to make 
> forward progress on this issue for 5.8, including some of the workarounds 
> above that Amit requested, I'd be very happy to help.  Christoph will make 
> the right decision for DMA in 5.8, but I simply wanted to state how 
> critical working SEV guests are to users.

I'm between a rock and a hard place here.  If we simply want to revert
commits as-is to make sure both the Raspberry Pi 4 and thone phone do
not regress we'll have to go all the way back and revert the whole SEV
pool support.  I could try to manual revert of the multiple pool
support, but it is very late for that.

Or maybe Linus has decided to cut a -rc8 which would give us a little
more time.
-
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
