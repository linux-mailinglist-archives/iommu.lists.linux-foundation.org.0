Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 480418EFBE
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 17:48:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2A7D4F0C;
	Thu, 15 Aug 2019 15:48:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8BF85EE8
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 15:48:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E492B8A0
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 15:48:47 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 9919C3AA; Thu, 15 Aug 2019 17:48:45 +0200 (CEST)
Date: Thu, 15 Aug 2019 17:48:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 5/8] iommu: Add bounce page APIs
Message-ID: <20190815154845.GA18327@8bytes.org>
References: <20190730045229.3826-1-baolu.lu@linux.intel.com>
	<20190730045229.3826-6-baolu.lu@linux.intel.com>
	<20190814083842.GB22669@8bytes.org>
	<445624e7-eb57-8089-8eb3-8687a65b1258@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <445624e7-eb57-8089-8eb3-8687a65b1258@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alan.cox@intel.com, Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>, ashok.raj@intel.com,
	Jonathan Corbet <corbet@lwn.net>, pengfei.xu@intel.com,
	Ingo Molnar <mingo@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, kevin.tian@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	mika.westerberg@linux.intel.com, Alan Cox <alan@linux.intel.com>,
	Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@intel.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	jacob.jun.pan@intel.com, Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Thu, Aug 15, 2019 at 02:15:32PM +0800, Lu Baolu wrote:
> iommu_map/unmap() APIs haven't parameters for dma direction and
> attributions. These parameters are elementary for DMA APIs. Say,
> after map, if the dma direction is TO_DEVICE and a bounce buffer is
> used, we must sync the data from the original dma buffer to the bounce
> buffer; In the opposite direction, if dma is FROM_DEVICE, before unmap,
> we need to sync the data from the bounce buffer onto the original
> buffer.

The DMA direction from DMA-API maps to the protections in iommu_map():

	DMA_FROM_DEVICE:	IOMMU_WRITE
	DMA_TO_DEVICE:		IOMMU_READ
	DMA_BIDIRECTIONAL	IOMMU_READ | IOMMU_WRITE

And for the sync DMA-API also has separate functions for either
direction. So I don't see why these extra functions are needed in the
IOMMU-API.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
