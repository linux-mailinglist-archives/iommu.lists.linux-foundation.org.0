Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9D1450522
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 14:14:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 219AB80C9C;
	Mon, 15 Nov 2021 13:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKRAC35lkFnd; Mon, 15 Nov 2021 13:14:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EDCEA80C4A;
	Mon, 15 Nov 2021 13:14:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFB16C0036;
	Mon, 15 Nov 2021 13:14:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB71AC0012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C25944012E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVonAlMPmnD6 for <iommu@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 13:14:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFD11400E8
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Ijx7ygrsbGB8DaiDlZgsojxI26SKNZNZbgP3dg36cpY=; b=FAnpyplCWUHBo7vCQHkFDFzoub
 WU+vsiZ5NN0CSB47F5895O6ji7tOk+uOsz23e4WjzUjiaJK/50tSPMC6Q72PjCDSA+sGJ8h4HXxZq
 h/eL8/TPwp9a1MIV3OuFuWf5XN9CmcAVg9IlUloz4HYB39yBcZyZhLoDO4B2+upeIF222LRVAXznT
 +rtbzf8Wbyor7puFccsX56b2JYRCR6LsRmIColzUmz7IUfZLtLh+ShIBpS/JsP7uPHBGWD5G/ua3I
 K26+oZiG4YmoxJ9lb0zZt1NkvvqqD0Z+r7iKd3DAEE2zE1zwfcOZB90y9clEeWchSXLpivkQ9wsq4
 IeJ4L3Eg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mmboK-00FchT-TG; Mon, 15 Nov 2021 13:14:12 +0000
Date: Mon, 15 Nov 2021 05:14:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 01/11] iommu: Add device dma ownership set/release
 interfaces
Message-ID: <YZJdJH4AS+vm0j06@infradead.org>
References: <20211115020552.2378167-1-baolu.lu@linux.intel.com>
 <20211115020552.2378167-2-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115020552.2378167-2-baolu.lu@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org, rafael@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>
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

On Mon, Nov 15, 2021 at 10:05:42AM +0800, Lu Baolu wrote:
> +enum iommu_dma_owner {
> +	DMA_OWNER_NONE,
> +	DMA_OWNER_KERNEL,
> +	DMA_OWNER_USER,
> +};
> +

> +	enum iommu_dma_owner dma_owner;
> +	refcount_t owner_cnt;
> +	struct file *owner_user_file;

I'd just overload the ownership into owner_user_file,

 NULL			-> no owner
 (struct file *)1UL)	-> kernel
 real pointer		-> user

Which could simplify a lot of the code dealing with the owner.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
