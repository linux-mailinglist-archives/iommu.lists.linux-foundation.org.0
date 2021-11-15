Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C797445054B
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 14:21:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3816F80DD1;
	Mon, 15 Nov 2021 13:21:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iicwcJ1bb73d; Mon, 15 Nov 2021 13:21:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4944080D73;
	Mon, 15 Nov 2021 13:21:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33B97C0012;
	Mon, 15 Nov 2021 13:21:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EBA3C0012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2F0C40312
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:21:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4mWICbGC6qL for <iommu@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 13:21:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83B9C402FF
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=q5vmI1sLQc7WBeWiEcoCC5hdqAXg7eZXSsi4VpfCULU=; b=Td7N6ctXpcs2dVqXN7Qpr7SxrL
 kVXjwXhqusuAFtzaPRBpznWe9j1D+UT0HM42dq8V+VGeYHC6fS83HoqhgyefLhaTLAS7hkFQuzCpC
 /qguR5hUzJohytnQwH/t6UAmPZvSAJ5LYd90wSNtLNyxtg/yrLMa64lk/hunSm1ZcDCDthXvOZcAx
 /8ROJe/cS9Ak5wX+ThA6F4G+417rQhdxaXyVMoNEOlAFOr7T+oFwBH3JqPCpU7dbuk5dQllE2eFgx
 ucr8T4bSRDtLrN6I7ww82K1NvuLNDXgXNhiRcaWT8zIfBTSOuuh6kSCCuh1JD4s4nCyMVzwW5FVij
 rXpuPL3w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mmbvK-00FeMO-NI; Mon, 15 Nov 2021 13:21:26 +0000
Date: Mon, 15 Nov 2021 05:21:26 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 03/11] PCI: pci_stub: Suppress kernel DMA ownership
 auto-claiming
Message-ID: <YZJe1jquP+osF+Wn@infradead.org>
References: <20211115020552.2378167-1-baolu.lu@linux.intel.com>
 <20211115020552.2378167-4-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115020552.2378167-4-baolu.lu@linux.intel.com>
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

On Mon, Nov 15, 2021 at 10:05:44AM +0800, Lu Baolu wrote:
> pci_stub allows the admin to block driver binding on a device and make
> it permanently shared with userspace. Since pci_stub does not do DMA,
> it is safe.

If an IOMMU is setup and dma-iommu or friends are not used nothing is
unsafe anyway, it just is that IOMMU won't work..

> However the admin must understand that using pci_stub allows
> userspace to attack whatever device it was bound to.

I don't understand this sentence at all.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
