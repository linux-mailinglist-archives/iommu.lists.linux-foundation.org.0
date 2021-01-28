Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AEE307DA8
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 19:18:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 738AD2E105;
	Thu, 28 Jan 2021 18:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLJWRlyATyuw; Thu, 28 Jan 2021 18:18:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A14F92014B;
	Thu, 28 Jan 2021 18:18:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88EECC08A1;
	Thu, 28 Jan 2021 18:18:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36086C08A1
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 18:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9EE772E0FA
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 18:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4NKosfW4TZIS for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 18:18:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 7BC852014B
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 18:18:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4681768AFE; Thu, 28 Jan 2021 19:18:05 +0100 (CET)
Date: Thu, 28 Jan 2021 19:18:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 3/3] Adding device_dma_parameters->offset_preserve_mask
 to NVMe driver.
Message-ID: <20210128181804.GC11790@lst.de>
References: <20210128003829.1892018-1-jxgao@google.com>
 <20210128003829.1892018-4-jxgao@google.com>
 <0550ca25-1389-ffc2-e738-8127ceb1712f@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0550ca25-1389-ffc2-e738-8127ceb1712f@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: axboe@fb.com, heikki.krogerus@linux.intel.com, sagi@grimberg.me,
 saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 gregkh@linuxfoundation.org, rafael.j.wysocki@intel.com,
 linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 kbusch@kernel.org, bgolaszewski@baylibre.com, iommu@lists.linux-foundation.org,
 jroedel@suse.de, linux-nvme@lists.infradead.org, dan.j.williams@intel.com,
 Jianxiong Gao <jxgao@google.com>, hch@lst.de
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

On Thu, Jan 28, 2021 at 06:00:58PM +0000, Robin Murphy wrote:
> If it were possible for this to fail, you might leak the DMA mapping here. 
> However if dev->dma_parms somehow disappeared since a dozen lines above 
> then I think you've got far bigger problems anyway.
>
> That said, do you really need to keep toggling this back and forth all the 
> time? Even if the device does make other mappings elsewhere that don't 
> necessarily need the same strict alignment, would it be significantly 
> harmful just to set it once at probe and leave it in place anyway?

Yes, we should kept it set all the time.  While some NVMe devices have
the optional to use SGLs that do not have this limitation, I have
absolutely no sympathy for anyone running NVMe with swiotlb as that
means their system imposes an addressing limitation.  We need to make
sure it does not corrupt data, but we're not going to make any effort
to optimize for such a degenerated setup.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
