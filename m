Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF74341E8A
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 14:40:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1F2F4011B;
	Fri, 19 Mar 2021 13:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFLSyO9hdAzX; Fri, 19 Mar 2021 13:40:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09CA3400F3;
	Fri, 19 Mar 2021 13:40:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7C47C0010;
	Fri, 19 Mar 2021 13:40:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1685FC0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04A8B8350D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LsReVYvwOXub for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 13:40:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C487D83508
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:40:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6A6C368BFE; Fri, 19 Mar 2021 14:40:47 +0100 (CET)
Date: Fri, 19 Mar 2021 14:40:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH 0/6] dma mapping/iommu: Allow IOMMU IOVA rcache range
 to be configured
Message-ID: <20210319134047.GA5729@lst.de>
References: <1616160348-29451-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616160348-29451-1-git-send-email-john.garry@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 robin.murphy@arm.com, linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 hch@lst.de, iommu@lists.linux-foundation.org, will@kernel.org,
 jejb@linux.ibm.com
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

On Fri, Mar 19, 2021 at 09:25:42PM +0800, John Garry wrote:
> For streaming DMA mappings involving an IOMMU and whose IOVA len regularly
> exceeds the IOVA rcache upper limit (meaning that they are not cached),
> performance can be reduced. 
> 
> This is much more pronounced from commit 4e89dce72521 ("iommu/iova: Retry
> from last rb tree node if iova search fails"), as discussed at [0].
> 
> IOVAs which cannot be cached are highly involved in the IOVA aging issue,
> as discussed at [1].

I'm confused.  If this a limit in the IOVA allocator, dma-iommu should
be able to just not grow the allocation so larger without help from
the driver.

If contrary to the above description it is device-specific, the driver
could simply use dma_get_max_seg_size().
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
