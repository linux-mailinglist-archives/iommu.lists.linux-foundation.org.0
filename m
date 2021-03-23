Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D7543346676
	for <lists.iommu@lfdr.de>; Tue, 23 Mar 2021 18:35:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EEF4400BD;
	Tue, 23 Mar 2021 17:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrvXKnH77e81; Tue, 23 Mar 2021 17:35:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C9CB400B9;
	Tue, 23 Mar 2021 17:35:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FFDCC0001;
	Tue, 23 Mar 2021 17:35:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90319C0001
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 17:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 714EA6064D
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 17:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4gem3gYXi5cF for <iommu@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 17:35:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC54460597
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 17:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yuj9lOJ+wwKSOTzadLsiPOfR76BWutBwvcTagO1i1qM=; b=PtjvfWwhchC5qjBTK7f/EiRDhF
 urx2vM9Uto+SYnjM+6Qq2dNPrQVY57LLDemOqyBqGtZSwP2vouB3EGSfINgNyGoTHB6A4c5xCCQB1
 NBV8QwSkbpSUetS4AHQPjq/gWfC39flqmLN+CZTvKLFMcyhJscyj3be4TnlIYnxU2Pu35NSyAFkTx
 191rH3x+g4dC2Q1Rf/efYAKbw1rJzCOo6VNZQFsIPSi+0w32FfbbibCXeKxOtSkCFh6wq0rgPS33N
 66SsnGp0GH3K6/55xtTHnvE2h6ko2xZcmICPwlKpjopaxzdYl4b3OmpS+U7MR5S/S71BPnkeLnPjL
 mfN3QuRA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lOkuj-00ALZE-E8; Tue, 23 Mar 2021 17:34:11 +0000
Date: Tue, 23 Mar 2021 17:33:57 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 3/5] iommu/vt-d: Remove SVM_FLAG_PRIVATE_PASID
Message-ID: <20210323173357.GD2463754@infradead.org>
References: <20210323010600.678627-1-baolu.lu@linux.intel.com>
 <20210323010600.678627-4-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323010600.678627-4-baolu.lu@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
 Will Deacon <will@kernel.org>
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

On Tue, Mar 23, 2021 at 09:05:58AM +0800, Lu Baolu wrote:
> The SVM_FLAG_PRIVATE_PASID has never been referenced in the tree, and
> there's no plan to have anything to use it. So cleanup it.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

But can we take this a little further?  SVM_FLAG_GUEST_PASID is unused
as well.  SVM_FLAG_GUEST_MODE is only used in drivers/iommu/intel/svm.c,
and SVM_FLAG_SUPERVISOR_MODE is actually used as an API flag to
iommu_sva_bind_device.  So IMHO the latter should be elevated to an
IOMMU API level flag, and then include/linux/intel-svm.h can go away
entirely or at least be moved to drivers/iommu/intel/.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
