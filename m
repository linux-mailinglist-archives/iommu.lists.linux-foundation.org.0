Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D24ED536FBB
	for <lists.iommu@lfdr.de>; Sun, 29 May 2022 07:15:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6600941901;
	Sun, 29 May 2022 05:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yh9rstgl15x9; Sun, 29 May 2022 05:14:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F08684264B;
	Sun, 29 May 2022 05:14:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87ED1C007E;
	Sun, 29 May 2022 05:14:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EDF3C0032
 for <iommu@lists.linux-foundation.org>; Sun, 29 May 2022 05:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8009E6136F
 for <iommu@lists.linux-foundation.org>; Sun, 29 May 2022 05:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uDajgdvY21G for <iommu@lists.linux-foundation.org>;
 Sun, 29 May 2022 05:14:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8576561153
 for <iommu@lists.linux-foundation.org>; Sun, 29 May 2022 05:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653801292; x=1685337292;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=enAxaDvI5KYRp7pqOsswil/w+G42o1j4MPV69EUb6uk=;
 b=YjfYnItTT3MpZi+Yuz26WhcMkUm16LeinjMIud8qHU4UsW4JZKQs6Cx+
 Ad7hGv3TY1n4AQZq8f8Fv17jAR0lL96owy5L+/kNT/K7cS1bOB+5IfQEc
 ll/MScvmtZsdle/9E6BMUXNA4EARGPwi8f4k9Nw+Dji+mrEKunCa8y4qB
 4Rpwv/ibMp8kA1yNlAUBqLZ1BNfjUToKapvpK20JxKbL/UUgtslYsCcV5
 SCxHfWigPlbgDPCbvRZEiLE6b/UxayawSIpBnIP6iJ0+lEBgIOroVvKXx
 4jTIlwuGSbSukR4MWrVR5FES8rMXWkb+7K7n2L6wUXSp/vulcA9MfcUO5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10361"; a="254626690"
X-IronPort-AV: E=Sophos;i="5.91,260,1647327600"; d="scan'208";a="254626690"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2022 22:14:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,260,1647327600"; d="scan'208";a="575463620"
Received: from unknown (HELO [10.255.28.211]) ([10.255.28.211])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2022 22:14:48 -0700
Message-ID: <eda4d688-257b-d12a-56c0-0f9d3a10ef8c@linux.intel.com>
Date: Sun, 29 May 2022 13:14:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/12] iommu/vt-d: Use iommu_get_domain_for_dev() in
 debugfs
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220527063019.3112905-1-baolu.lu@linux.intel.com>
 <20220527063019.3112905-2-baolu.lu@linux.intel.com>
 <20220527145910.GQ1343366@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220527145910.GQ1343366@nvidia.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Will Deacon <will@kernel.org>
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

On 2022/5/27 22:59, Jason Gunthorpe wrote:
> On Fri, May 27, 2022 at 02:30:08PM +0800, Lu Baolu wrote:
>> Retrieve the attached domain for a device through the generic interface
>> exposed by the iommu core. This also makes device_domain_lock static.
>>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>>   drivers/iommu/intel/iommu.h   |  1 -
>>   drivers/iommu/intel/debugfs.c | 20 ++++++++------------
>>   drivers/iommu/intel/iommu.c   |  2 +-
>>   3 files changed, 9 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/iommu/intel/iommu.h b/drivers/iommu/intel/iommu.h
>> index a22adfbdf870..8a6d64d726c0 100644
>> +++ b/drivers/iommu/intel/iommu.h
>> @@ -480,7 +480,6 @@ enum {
>>   #define VTD_FLAG_SVM_CAPABLE		(1 << 2)
>>   
>>   extern int intel_iommu_sm;
>> -extern spinlock_t device_domain_lock;
>>   
>>   #define sm_supported(iommu)	(intel_iommu_sm && ecap_smts((iommu)->ecap))
>>   #define pasid_supported(iommu)	(sm_supported(iommu) &&			\
>> diff --git a/drivers/iommu/intel/debugfs.c b/drivers/iommu/intel/debugfs.c
>> index d927ef10641b..eea8727aa7bc 100644
>> +++ b/drivers/iommu/intel/debugfs.c
>> @@ -344,19 +344,21 @@ static void pgtable_walk_level(struct seq_file *m, struct dma_pte *pde,
>>   
>>   static int show_device_domain_translation(struct device *dev, void *data)
>>   {
>> -	struct device_domain_info *info = dev_iommu_priv_get(dev);
>> -	struct dmar_domain *domain = info->domain;
>> +	struct dmar_domain *dmar_domain;
>> +	struct iommu_domain *domain;
>>   	struct seq_file *m = data;
>>   	u64 path[6] = { 0 };
>>   
>> +	domain = iommu_get_domain_for_dev(dev);
>>   	if (!domain)
>>   		return 0;
> 
> The iommu_get_domain_for_dev() API should be called something like
> 'iommu_get_dma_api_domain()' and clearly documented that it is safe to
> call only so long as a DMA API using driver is attached to the device,
> which is most of the current callers.

Yes, agreed.

> This use in random sysfs inside the iommu driver is not OK because it
> doesn't have any locking protecting domain from concurrent free.

This is not sysfs, but debugfs. The description of this patch is
confusing. I should make it specific and straight-forward.

How about below one?

 From 1e87b5df40c6ce9414cdd03988c3b52bfb17af5f Mon Sep 17 00:00:00 2001
From: Lu Baolu <baolu.lu@linux.intel.com>
Date: Sun, 29 May 2022 10:18:56 +0800
Subject: [PATCH 1/1] iommu/vt-d: debugfs: Remove device_domain_lock usage

The domain_translation_struct debugfs node is used to dump static
mappings of PCI devices. It potentially races with setting new
domains to devices and the iommu_map/unmap() interfaces. The existing
code tries to use the global spinlock device_domain_lock to avoid the
races, but this is problematical as this lock is only used to protect
the device tracking lists of the domains.

Instead of using an immature lock to cover up the problem, it's better
to explicitly restrict the use of this debugfs node. This also makes
device_domain_lock static.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
  drivers/iommu/intel/debugfs.c | 17 ++++++++---------
  drivers/iommu/intel/iommu.c   |  2 +-
  drivers/iommu/intel/iommu.h   |  1 -
  3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/intel/debugfs.c b/drivers/iommu/intel/debugfs.c
index d927ef10641b..9642e3e9d6b0 100644
--- a/drivers/iommu/intel/debugfs.c
+++ b/drivers/iommu/intel/debugfs.c
@@ -362,17 +362,16 @@ static int show_device_domain_translation(struct 
device *dev, void *data)
  	return 0;
  }

+/*
+ * Dump the static mappings of PCI devices. This is only for DEBUGFS code,
+ * don't use it for other purposes.  It potentially races with setting new
+ * domains to devices and iommu_map/unmap(). Use the trace events under
+ * /sys/kernel/debug/tracing/events/iommu/ for dynamic debugging.
+ */
  static int domain_translation_struct_show(struct seq_file *m, void 
*unused)
  {
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&device_domain_lock, flags);
-	ret = bus_for_each_dev(&pci_bus_type, NULL, m,
-			       show_device_domain_translation);
-	spin_unlock_irqrestore(&device_domain_lock, flags);
-
-	return ret;
+	return bus_for_each_dev(&pci_bus_type, NULL, m,
+				show_device_domain_translation);
  }
  DEFINE_SHOW_ATTRIBUTE(domain_translation_struct);

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 1af4b6562266..cacae8bdaa65 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -314,7 +314,7 @@ static int iommu_skip_te_disable;
  #define IDENTMAP_GFX		2
  #define IDENTMAP_AZALIA		4

-DEFINE_SPINLOCK(device_domain_lock);
+static DEFINE_SPINLOCK(device_domain_lock);
  static LIST_HEAD(device_domain_list);

  /*
diff --git a/drivers/iommu/intel/iommu.h b/drivers/iommu/intel/iommu.h
index a22adfbdf870..8a6d64d726c0 100644
--- a/drivers/iommu/intel/iommu.h
+++ b/drivers/iommu/intel/iommu.h
@@ -480,7 +480,6 @@ enum {
  #define VTD_FLAG_SVM_CAPABLE		(1 << 2)

  extern int intel_iommu_sm;
-extern spinlock_t device_domain_lock;

  #define sm_supported(iommu)	(intel_iommu_sm && ecap_smts((iommu)->ecap))
  #define pasid_supported(iommu)	(sm_supported(iommu) &&			\
-- 
2.25.1

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
