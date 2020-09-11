Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B87B4265A34
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 09:14:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5369587715;
	Fri, 11 Sep 2020 07:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LRb3p7YPLjFF; Fri, 11 Sep 2020 07:14:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B7E9287343;
	Fri, 11 Sep 2020 07:14:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9BCCC089E;
	Fri, 11 Sep 2020 07:14:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3518BC0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 07:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3050C8773D
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 07:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qb9Er6hWE+Le for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 07:14:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9CE3287739
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 07:14:33 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 016DC68BFE; Fri, 11 Sep 2020 09:14:29 +0200 (CEST)
Date: Fri, 11 Sep 2020 09:14:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 09/12] dma-direct: remove __dma_to_phys
Message-ID: <20200911071429.GE22394@lst.de>
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-10-hch@lst.de>
 <5d797c06-401d-62b1-f144-ea6e9a5144dd@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d797c06-401d-62b1-f144-ea6e9a5144dd@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
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

On Thu, Sep 10, 2020 at 02:26:03PM +0100, Robin Murphy wrote:
> On 2020-09-08 17:47, Christoph Hellwig wrote:
>> There is no harm in just always clearing the SME encryption bit, while
>> significantly simplifying the interface.
>
> After a 10-minute diversion into "but hang on, force_dma_unencrypted() is 
> meaningful on PPC and S390 too..." before realising that it all does just 
> come back to __sme_clr(), which is indeed a no-op for everyone other than 
> AMD, any simplification of this mess is indeed welcome :)
>
> Unless I've massively misunderstood how SME is supposed to work,

Exactly.  This weird encryption bit in AMD SME causes all kinds of harm,
and I'm glad no one picked it up.  I've also been wondering if we
should change the interface to explicit set/clear the bit, but I'll
leave that for another pass as fixing up the SME interfaces would turn
into a massive disgression.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
