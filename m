Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED2C339B4D
	for <lists.iommu@lfdr.de>; Sat, 13 Mar 2021 03:37:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B950600C9;
	Sat, 13 Mar 2021 02:37:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mn_lDxaYSFX; Sat, 13 Mar 2021 02:37:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0C3660633;
	Sat, 13 Mar 2021 02:37:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A09FCC0001;
	Sat, 13 Mar 2021 02:37:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 734CBC0001
 for <iommu@lists.linux-foundation.org>; Sat, 13 Mar 2021 02:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C573605EB
 for <iommu@lists.linux-foundation.org>; Sat, 13 Mar 2021 02:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KUs3Z9184Hqj for <iommu@lists.linux-foundation.org>;
 Sat, 13 Mar 2021 02:36:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06825600C9
 for <iommu@lists.linux-foundation.org>; Sat, 13 Mar 2021 02:36:58 +0000 (UTC)
IronPort-SDR: wAZU+3ETDWez6ZiOQhUD1Xo2vNgnm8WmGoQ2HZ3g+5ceMLHQ24uZrGSV6R057ijESEG+sziYG1
 /+hYfQOexZVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="176042824"
X-IronPort-AV: E=Sophos;i="5.81,245,1610438400"; d="scan'208";a="176042824"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 18:36:58 -0800
IronPort-SDR: vWH9MrQPUopS4cxXwdJS5su75dKHztdNXjGGlH9ufjynLLu86PmrmvGK6dqQ7nNaiN1giHbb0p
 Ed7tLl9U/OgQ==
X-IronPort-AV: E=Sophos;i="5.81,245,1610438400"; d="scan'208";a="404614708"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 18:36:57 -0800
Date: Fri, 12 Mar 2021 18:36:57 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [RFC PATCH v2 07/11] dma-mapping: Add flags to dma_map_ops to
 indicate PCI P2PDMA support
Message-ID: <20210313023657.GC3402637@iweiny-DESK2.sc.intel.com>
References: <20210311233142.7900-1-logang@deltatee.com>
 <20210311233142.7900-8-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311233142.7900-8-logang@deltatee.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-pci@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ira Weiny <iweiny@intel.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 Stephen Bates <sbates@raithlin.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, Christoph Hellwig <hch@lst.de>,
 Xiong Jianxin <jianxin.xiong@intel.com>
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

On Thu, Mar 11, 2021 at 04:31:37PM -0700, Logan Gunthorpe wrote:
 
> +int dma_pci_p2pdma_supported(struct device *dev)
   ^^^
  bool?

> +{
> +	const struct dma_map_ops *ops = get_dma_ops(dev);
> +
> +	return !ops || ops->flags & DMA_F_PCI_P2PDMA_SUPPORTED;

Is this logic correct?  I would have expected.

	return (ops && ops->flags & DMA_F_PCI_P2PDMA_SUPPORTED);

Ira
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
