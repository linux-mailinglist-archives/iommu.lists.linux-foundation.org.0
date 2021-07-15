Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C55E53CA34A
	for <lists.iommu@lfdr.de>; Thu, 15 Jul 2021 18:53:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 318DE40164;
	Thu, 15 Jul 2021 16:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vgt0lLwQmyu; Thu, 15 Jul 2021 16:53:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6609F40E7F;
	Thu, 15 Jul 2021 16:53:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E539C001F;
	Thu, 15 Jul 2021 16:53:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D03F5C000E
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 16:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BED41401C8
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 16:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qB6vBV_b-eC4 for <iommu@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 16:53:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBE3E40164
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SHLau5Ake9xcwQGIQtYxnHJNJDrvOEPwwI40kAVcRog=; b=U8UTMSyF6jF6T0gR2j3D29bvs
 eItdcAl8yoYyPm0BOaqxfp0KAqwYLm3tCNGL3UOXkwf2YVG3YLDETqIWI2+TSILpWhKSi+ZfIepQo
 lLen0o6KgjL85hkzakJ1QZk21sjlzGaASbY+nCfE7vBnPME0Mzb+H5RRmAZ+ZNIKuXcRPERLyqXtq
 VdtZCLk1naymemWuZBuS7BxTMY7tagmEv9JEUS6/HzNAPZKSxBYrlmfrzjhaGexuK2It2kZa4r1/A
 CGDiaLgNp8Hmc8kCrs/WvG5KWvG0MHFhzYQbO2P7Gy0lVzLUmA2kl6R0xkg6NYiRgFN4tL0/sUnPU
 SpUuGxGOA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46188)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1m44bq-00015M-DY; Thu, 15 Jul 2021 17:53:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1m44bl-0002LK-Cz; Thu, 15 Jul 2021 17:53:09 +0100
Date: Thu, 15 Jul 2021 17:53:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v1 00/16] .map_sg() error cleanup
Message-ID: <20210715165309.GO22278@shell.armlinux.org.uk>
References: <20210715164544.6827-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stephen Bates <sbates@raithlin.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Jul 15, 2021 at 10:45:28AM -0600, Logan Gunthorpe wrote:
> Hi,
> 
> This series is spun out and expanded from my work to add P2PDMA support
> to DMA map operations[1].
> 
> The P2PDMA work requires distinguishing different error conditions in
> a map_sg operation. dma_map_sgtable() already allows for returning an
> error code (where as dma_map_sg() is only allowed to return zero)
> however, it currently only returns -EINVAL when a .map_sg() call returns
> zero.
> 
> This series cleans up all .map_sg() implementations to return appropriate
> error codes. After the cleanup, dma_map_sg() will still return zero,
> however dma_map_sgtable() will pass the error code from the .map_sg()
> call. Thanks go to Martn Oliveira for doing a lot of the cleanup of the
> obscure implementations.
> 
> The patch set is based off of v5.14-rc1 and a git repo can be found
> here:

Have all the callers for dma_map_sg() been updated to check for error
codes? If not, isn't that a pre-requisit to this patch set?

From what I see in Linus' current tree, we still have cases today
where the return value of dma_map_sg() is compared with zero to
detect failure, so I think that needs fixing before we start changing
the dma_map_sg() implementation to return negative numbers.

I also notice that there are various places that don't check the
return value - and returning a negative number instead of zero may
well cause random other bits to be set in fields.

So, I think there's a fair amount of work to do in all the drivers
before this change can be considered.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
