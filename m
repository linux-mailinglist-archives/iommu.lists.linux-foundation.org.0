Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 555FA49DEBE
	for <lists.iommu@lfdr.de>; Thu, 27 Jan 2022 11:08:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DDAB814B4;
	Thu, 27 Jan 2022 10:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0NsuLjKVKVvS; Thu, 27 Jan 2022 10:08:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1265C8149D;
	Thu, 27 Jan 2022 10:08:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCBB0C0031;
	Thu, 27 Jan 2022 10:08:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF48DC000B
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 10:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4C71402BB
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 10:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ap2HRmsdgMkA for <iommu@lists.linux-foundation.org>;
 Thu, 27 Jan 2022 10:08:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 877CD402B7
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 10:08:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5F33268AA6; Thu, 27 Jan 2022 11:08:48 +0100 (CET)
Date: Thu, 27 Jan 2022 11:08:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC][DISCUSSION] dma-mapping: allocating noncoherent buffer
 without mapping
Message-ID: <20220127100848.GC15004@lst.de>
References: <YfE2XMSmFtDudXYT@ip-172-31-19-208.ap-northeast-1.compute.internal>
 <bbf3b6d4-b2b5-64b3-6dec-f1cc45f96122@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bbf3b6d4-b2b5-64b3-6dec-f1cc45f96122@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>, iommu@lists.linux-foundation.org,
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

On Wed, Jan 26, 2022 at 01:08:04PM +0000, Robin Murphy wrote:
> This doesn't make sense to me. The point of dma_alloc_* is you get back a 
> dedicated DMA buffer which can then be used at any time. In the noncoherent 
> case you have to put in explicit dma_sync_*() calls around accesses when 
> the CPU or device is expected to have updated the buffer contents, but it's 
> still fundamentally the same paradigm.

Exactly.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
