Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D34A2F35DE
	for <lists.iommu@lfdr.de>; Tue, 12 Jan 2021 17:34:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D4F5862E8;
	Tue, 12 Jan 2021 16:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBSJrF9jWpyK; Tue, 12 Jan 2021 16:34:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F9DB86193;
	Tue, 12 Jan 2021 16:34:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FFCCC013A;
	Tue, 12 Jan 2021 16:34:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D16ABC013A
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 16:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CD81A85516
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 16:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtB7R0GJb_sC for <iommu@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 16:33:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 18498854E5
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 16:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mBioehHDUzlvAsPzae77HJfwX+E6M+3CVgwDUqEdzwQ=; b=U3gMFkibCIPYY7WCMckP1Qz2w3
 ehyPhKN/2d/DP7Gd5aG2g+3s/ZqAYAeQre+ra5TeoRwPg1ypLFH9UUlsin+PmI5oq5zzqNpejl4MT
 znWNWxSLdgcSYxRrBG85TkYMEYzlqOvsXl4dDwXla4lI/BwLhKxyMmrkiaSraNgKlbkGJStBPhhz2
 NJ3Rts5EJe7yOHQJkn580Y2oqYqO7GisUZGNzMiT0RqkuTve4tCiM5wyq8ysoHa0eX/sdf1t00oQ/
 yl38By6JYvCQe/vCKnAbzFQWzhUjpUDUkaOyOW0HLfhZqybTc3Oju99rYpQDzE/zOli9ssgnVbUNB
 cxs8EabQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kzMbT-0052bL-NA; Tue, 12 Jan 2021 16:33:19 +0000
Date: Tue, 12 Jan 2021 16:33:07 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 0/5] Optimize iommu_map_sg() performance
Message-ID: <20210112163307.GA1199965@infradead.org>
References: <1610376862-927-1-git-send-email-isaacm@codeaurora.org>
 <8ad6db90-1d86-db2a-ccb5-dc3f01213289@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ad6db90-1d86-db2a-ccb5-dc3f01213289@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, pdaly@codeaurora.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, pratikp@codeaurora.org,
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

On Tue, Jan 12, 2021 at 04:00:59PM +0000, Robin Murphy wrote:
> Out of curiosity, how much of the difference is attributable to actual
> indirect call overhead vs. the additional massive reduction in visits to
> arm_smmu_rpm_{get,put} that you fail to mention? There are ways to optimise
> indirect calling that would benefit *all* cases, rather than just one
> operation for one particular driver.

Do we have systems that use different iommu_ops at the same time?
If not this would be a prime candidate for static call optimizations.

Also I've been pondering adding direct calls to the iommu dma ops like
we do for DMA direct.  This would allow to stop using dma_ops entirely
for arm64.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
