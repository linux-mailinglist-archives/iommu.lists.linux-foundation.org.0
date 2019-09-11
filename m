Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A920BAF5AA
	for <lists.iommu@lfdr.de>; Wed, 11 Sep 2019 08:17:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 553EC8DC;
	Wed, 11 Sep 2019 06:17:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0A826499
	for <iommu@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 06:17:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A6F317DB
	for <iommu@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 06:17:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Sep 2019 23:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="209565502"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga004.fm.intel.com with ESMTP; 10 Sep 2019 23:17:45 -0700
Subject: Re: [PATCH v9 1/5] swiotlb: Split size parameter to map/unmap APIs
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190906061452.30791-1-baolu.lu@linux.intel.com>
	<20190906061452.30791-2-baolu.lu@linux.intel.com>
	<20190910151544.GA7585@char.us.oracle.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0b939480-cb99-46fe-374e-a31441d21486@linux.intel.com>
Date: Wed, 11 Sep 2019 14:16:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910151544.GA7585@char.us.oracle.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alan.cox@intel.com, Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>, ashok.raj@intel.com,
	Jonathan Corbet <corbet@lwn.net>, pengfei.xu@intel.com,
	Ingo Molnar <mingo@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, kevin.tian@intel.com,
	Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	mika.westerberg@linux.intel.com, Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 9/10/19 11:15 PM, Konrad Rzeszutek Wilk wrote:
> On Fri, Sep 06, 2019 at 02:14:48PM +0800, Lu Baolu wrote:
>> This splits the size parameter to swiotlb_tbl_map_single() and
>> swiotlb_tbl_unmap_single() into an alloc_size and a mapping_size
>> parameter, where the latter one is rounded up to the iommu page
>> size.
> It does a bit more too. You have the WARN_ON. Can you make it be
> more  verbose (as in details of which device requested it) and also use printk_once or so please?

How about this change?

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 89066efa3840..22a7848caca3 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -466,8 +466,11 @@ phys_addr_t swiotlb_tbl_map_single(struct device 
*hwdev,
                 pr_warn_once("%s is active and system is using DMA 
bounce buffers\n",
                              sme_active() ? "SME" : "SEV");

-       if (WARN_ON(mapping_size > alloc_size))
+       if (mapping_size > alloc_size) {
+               dev_warn_once(hwdev, "Invalid sizes (mapping: %zd bytes, 
alloc: %zd bytes)",
+                             mapping_size, alloc_size);
                 return (phys_addr_t)DMA_MAPPING_ERROR;
+       }

         mask = dma_get_seg_boundary(hwdev);

@@ -584,9 +587,6 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, 
phys_addr_t tlb_addr,
         int index = (tlb_addr - io_tlb_start) >> IO_TLB_SHIFT;
         phys_addr_t orig_addr = io_tlb_orig_addr[index];

-       if (WARN_ON(mapping_size > alloc_size))
-               return;
-
         /*
          * First, sync the memory before unmapping the entry
          */

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
