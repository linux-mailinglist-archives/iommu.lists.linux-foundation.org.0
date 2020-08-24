Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A597224F463
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 10:35:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1F9C187D05;
	Mon, 24 Aug 2020 08:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PlNDTwtt3Ujc; Mon, 24 Aug 2020 08:35:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 15DEC87D11;
	Mon, 24 Aug 2020 08:35:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC5A4C0051;
	Mon, 24 Aug 2020 08:35:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0BB7C0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 08:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 903C687D0E
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 08:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WcBLgjvXHcFL for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 08:35:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 08E5487D05
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 08:35:47 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22218848-1500050 for multiple; Mon, 24 Aug 2020 09:35:11 +0100
MIME-Version: 1.0
In-Reply-To: <65125687-14ae-182f-da07-7d29b4910364@linux.intel.com>
References: <20190525054136.27810-1-baolu.lu@linux.intel.com>
 <20190525054136.27810-8-baolu.lu@linux.intel.com>
 <159803479017.29194.1359332295829225843@build.alporthouse.com>
 <65125687-14ae-182f-da07-7d29b4910364@linux.intel.com>
Subject: Re: [PATCH v4 07/15] iommu/vt-d: Delegate the dma domain to upper
 layer
From: Chris Wilson <chris@chris-wilson.co.uk>
To: David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Date: Mon, 24 Aug 2020 09:35:11 +0100
Message-ID: <159825811140.30134.5347490249201789397@build.alporthouse.com>
User-Agent: alot/0.9
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
 tmurphy@arista.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

Quoting Lu Baolu (2020-08-24 07:31:23)
> Hi Chris,
> 
> On 2020/8/22 2:33, Chris Wilson wrote:
> > Quoting Lu Baolu (2019-05-25 06:41:28)
> >> This allows the iommu generic layer to allocate a dma domain and
> >> attach it to a device through the iommu api's. With all types of
> >> domains being delegated to upper layer, we can remove an internal
> >> flag which was used to distinguish domains mananged internally or
> >> externally.
> > 
> > I'm seeing some really strange behaviour with this patch on a 32b
> > Skylake system (and still present on mainline). Before this patch
> > everything is peaceful and appears to work correctly. Applying this patch,
> > and we fail to initialise the GPU with a few DMAR errors reported, e.g.
> > 
> > [   20.279445] DMAR: DRHD: handling fault status reg 3
> > [   20.279508] DMAR: [DMA Read] Request device [00:02.0] fault addr 8900a000 [fault reason 05] PTE Write access is not set
> > 
> > Setting an identity map for the igfx made the DMAR errors disappear, but
> > the GPU still failed to initialise.
> > 
> > There's no difference in the DMAR configuration dmesg between working and
> > the upset patch. And the really strange part is that switching to a 64b
> > kernel with this patch, it's working.
> > 
> > Any suggestions on what I should look for?
> 
> Can the patch titled "[PATCH] iommu/intel: Handle 36b addressing for
> x86-32" solve this problem?

It does. Not sure why, but that mystery I can leave for others.
-Chris
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
