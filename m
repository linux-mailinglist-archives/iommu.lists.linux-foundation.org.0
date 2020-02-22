Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B781B169251
	for <lists.iommu@lfdr.de>; Sun, 23 Feb 2020 00:37:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5FD5087111;
	Sat, 22 Feb 2020 23:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M93O6Tt+BU9J; Sat, 22 Feb 2020 23:37:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B0F08712D;
	Sat, 22 Feb 2020 23:37:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42EA9C1D89;
	Sat, 22 Feb 2020 23:37:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E78C1C013E
 for <iommu@lists.linux-foundation.org>; Sat, 22 Feb 2020 23:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D046720439
 for <iommu@lists.linux-foundation.org>; Sat, 22 Feb 2020 23:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O+Gi040BmPlt for <iommu@lists.linux-foundation.org>;
 Sat, 22 Feb 2020 23:37:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id CF3C720369
 for <iommu@lists.linux-foundation.org>; Sat, 22 Feb 2020 23:37:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2020 15:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,473,1574150400"; d="scan'208";a="230774816"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.212.230])
 ([10.254.212.230])
 by fmsmga008.fm.intel.com with ESMTP; 22 Feb 2020 15:37:08 -0800
Subject: Re: [PATCH V2 1/5] iommu: Add dev_def_domain_type() call back
 function to iommu_ops
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
 iommu@lists.linux-foundation.org
References: <cover.1581619464.git.sai.praneeth.prakhya@intel.com>
 <297e01568e24d1537e0d7d6c088e363552b8ea49.1581619464.git.sai.praneeth.prakhya@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <7c34585c-0ec4-09d9-dd4a-604f196a2ca8@linux.intel.com>
Date: Sun, 23 Feb 2020 07:37:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <297e01568e24d1537e0d7d6c088e363552b8ea49.1581619464.git.sai.praneeth.prakhya@intel.com>
Content-Language: en-US
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Sai,

On 2020/2/17 5:57, Sai Praneeth Prakhya wrote:
> When user requests kernel to change the default domain type of a group
> through sysfs, kernel has to make sure that it's ok to change the domain
> type of every device in the group to the requested domain (every device may
> not support both the domain types i.e. DMA and identity). Hence, add a call
> back function that could be implemented per architecture that performs the
> above check.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Ashok Raj <ashok.raj@intel.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Sohil Mehta <sohil.mehta@intel.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
> ---
>   include/linux/iommu.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index d1b5f4d98569..3f4aaad0aeb7 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -248,6 +248,7 @@ struct iommu_iotlb_gather {
>    * @cache_invalidate: invalidate translation caches
>    * @sva_bind_gpasid: bind guest pasid and mm
>    * @sva_unbind_gpasid: unbind guest pasid and mm
> + * @dev_def_domain_type: Return the required default domain type for a device

Can you please define the return value of this callback?

Best regards,
baolu

>    * @pgsize_bitmap: bitmap of all possible supported page sizes
>    * @owner: Driver module providing these ops
>    */
> @@ -318,6 +319,8 @@ struct iommu_ops {
>   
>   	int (*sva_unbind_gpasid)(struct device *dev, int pasid);
>   
> +	int (*dev_def_domain_type)(struct device *dev);
> +
>   	unsigned long pgsize_bitmap;
>   	struct module *owner;
>   };
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
