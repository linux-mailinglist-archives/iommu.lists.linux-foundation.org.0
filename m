Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4EA26BC96
	for <lists.iommu@lfdr.de>; Wed, 16 Sep 2020 08:19:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1B8EC86A0E;
	Wed, 16 Sep 2020 06:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qsAEEHuvk3NR; Wed, 16 Sep 2020 06:19:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A63BE86A10;
	Wed, 16 Sep 2020 06:19:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90E0EC0051;
	Wed, 16 Sep 2020 06:19:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BECEDC0051
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AE19186A01
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g24imHwVrZkq for <iommu@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 06:19:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6F25E869F8
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:19:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 209C268B05; Wed, 16 Sep 2020 08:19:50 +0200 (CEST)
Date: Wed, 16 Sep 2020 08:19:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thomas Tai <thomas.tai@oracle.com>
Subject: Re: [PATCH] dma-direct: Fix potential NULL pointer dereference
Message-ID: <20200916061949.GA8599@lst.de>
References: <1600178594-22801-1-git-send-email-thomas.tai@oracle.com>
 <20200915140719.GA14831@lst.de>
 <f5cba632-421a-f375-3697-51a182a53a32@oracle.com>
 <20200915142624.GA16005@lst.de>
 <da9ec51d-aab5-695d-e388-5ae7c0bb30ea@oracle.com>
 <20200915150929.GA19770@lst.de>
 <5136ed8d-d37d-8144-a6f3-c23f272d8926@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5136ed8d-d37d-8144-a6f3-c23f272d8926@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
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

On Tue, Sep 15, 2020 at 04:46:17PM -0400, Thomas Tai wrote:
> I tried out the suggested changes, and it successfully warned the null 
> pointer without panic. I notice that there are some places outside the 
> dma-direct, which calls dma_capable().
>
> https://elixir.bootlin.com/linux/v5.9-rc5/source/arch/x86/kernel/amd_gart_64.c#L187
>
> https://elixir.bootlin.com/linux/v5.9-rc5/source/drivers/xen/swiotlb-xen.c#L387

All of these still come in throught the wrappers in kernel/dma/mapping.c.

> Given that the WARN_ON_ONCE already did the intended warning, would you be 
> ok that I keep the null checking in dma_capable()?

No, the generic dma mapping layer is the right place.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
