Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9F4569D75
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 10:31:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C330C419D4;
	Thu,  7 Jul 2022 08:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C330C419D4
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ERqbBkNm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yInPuX4YHW2m; Thu,  7 Jul 2022 08:31:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E97FB419DA;
	Thu,  7 Jul 2022 08:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E97FB419DA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A84A3C007D;
	Thu,  7 Jul 2022 08:31:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67E9CC002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3400961167
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3400961167
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=ERqbBkNm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wg55LAHA3A12 for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 08:31:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68AF861153
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68AF861153
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657182664; x=1688718664;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=CW2qH8xRXygGMim18BCG25WW79oAhAeO2CwuMIH8YZU=;
 b=ERqbBkNmtjH19pC3ubHI4k5ErU6/1Q0ACjumxZUJSOSWlMMeX9TpK+W6
 glcvxuS8iTLoJ+XaupQ8KZZEt1ZCLq7Z+YzU7BndtuZp8YSfQ0VQEk/Md
 iI0bRM5CJydkllNFdwGYDZj5SDAifYi9gn52yd0Dqp3VqHjEefl35atIU
 k0tQUN2U5RNJE842gkjGlS0mvlcnMtOxLk7l4ee9//kF8wMsm5YM3ja0i
 zgI44iCGHJ218FdqgUtES65xZGO/MtMFjQ674lYrMrsO88B5l6/vh0Jsq
 U4PSdkxGwKxpW2VnmT3rwDgbdtLLJRU8FtJaNvOFOvafIvJ6ytKO5epuk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="283991554"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
 d="scan'208,217";a="283991554"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 01:31:03 -0700
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
 d="scan'208,217";a="568426193"
Received: from zhaohaif-mobl1.ccr.corp.intel.com (HELO [10.254.214.11])
 ([10.254.214.11])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 01:31:00 -0700
Message-ID: <849557ab-9c1b-a2ff-6fc6-6564f38d1187@linux.intel.com>
Date: Thu, 7 Jul 2022 16:30:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 01/11] iommu/vt-d: debugfs: Remove device_domain_lock
 usage
To: Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 iommu@lists.linux.dev
References: <20220706025524.2904370-1-baolu.lu@linux.intel.com>
 <20220706025524.2904370-2-baolu.lu@linux.intel.com>
From: Ethan Zhao <haifeng.zhao@linux.intel.com>
In-Reply-To: <20220706025524.2904370-2-baolu.lu@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Jacob jun Pan <jacob.jun.pan@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1948052728205963179=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This is a multi-part message in MIME format.
--===============1948052728205963179==
Content-Type: multipart/alternative;
 boundary="------------pLNgg0XHmaGg0Ki01g7V8O10"

This is a multi-part message in MIME format.
--------------pLNgg0XHmaGg0Ki01g7V8O10
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Baolu，

在 2022/7/6 10:55, Lu Baolu 写道:
> The domain_translation_struct debugfs node is used to dump the DMAR page
> tables for the PCI devices. It potentially races with setting domains to
> devices. The existing code uses the global spinlock device_domain_lock to
> avoid the races.
>
> This removes the use of device_domain_lock outside of iommu.c by replacing
> it with the group mutex lock. Using the group mutex lock is cleaner and
> more compatible to following cleanups.
>
> Signed-off-by: Lu Baolu<baolu.lu@linux.intel.com>
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> ---
>   drivers/iommu/intel/iommu.h   |  1 -
>   drivers/iommu/intel/debugfs.c | 43 +++++++++++++++++++++++++----------
>   drivers/iommu/intel/iommu.c   |  2 +-
>   3 files changed, 32 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iommu/intel/iommu.h b/drivers/iommu/intel/iommu.h
> index 8285fcfa5fea..8deb745d8b36 100644
> --- a/drivers/iommu/intel/iommu.h
> +++ b/drivers/iommu/intel/iommu.h
> @@ -480,7 +480,6 @@ enum {
>   #define VTD_FLAG_SVM_CAPABLE		(1 << 2)
>   
>   extern int intel_iommu_sm;
> -extern spinlock_t device_domain_lock;
>   
>   #define sm_supported(iommu)	(intel_iommu_sm && ecap_smts((iommu)->ecap))
>   #define pasid_supported(iommu)	(sm_supported(iommu) &&			\
> diff --git a/drivers/iommu/intel/debugfs.c b/drivers/iommu/intel/debugfs.c
> index d927ef10641b..6e1a3f88abc8 100644
> --- a/drivers/iommu/intel/debugfs.c
> +++ b/drivers/iommu/intel/debugfs.c
> @@ -342,13 +342,13 @@ static void pgtable_walk_level(struct seq_file *m, struct dma_pte *pde,
>   	}
>   }
>   
> -static int show_device_domain_translation(struct device *dev, void *data)
> +static int __show_device_domain_translation(struct device *dev, void *data)
>   {
> -	struct device_domain_info *info = dev_iommu_priv_get(dev);
> -	struct dmar_domain *domain = info->domain;
> +	struct dmar_domain *domain;
>   	struct seq_file *m = data;
>   	u64 path[6] = { 0 };
>   
> +	domain = to_dmar_domain(iommu_get_domain_for_dev(dev));
>   	if (!domain)
>   		return 0;
>   
> @@ -359,20 +359,39 @@ static int show_device_domain_translation(struct device *dev, void *data)
>   	pgtable_walk_level(m, domain->pgd, domain->agaw + 2, 0, path);
>   	seq_putc(m, '\n');
>   
> -	return 0;
> +	/* Don't iterate */
> +	return 1;
>   }

Using this return value trick to change the caller behaviour, seems not 
saving

anything, but really cost me a few seconds more to know the 
*incantation* --

'Don't iterate' :) .


Thanks,

Ethan

>   
> -static int domain_translation_struct_show(struct seq_file *m, void *unused)
> +static int show_device_domain_translation(struct device *dev, void *data)
>   {
> -	unsigned long flags;
> -	int ret;
> +	struct iommu_group *group;
>   
> -	spin_lock_irqsave(&device_domain_lock, flags);
> -	ret = bus_for_each_dev(&pci_bus_type, NULL, m,
> -			       show_device_domain_translation);
> -	spin_unlock_irqrestore(&device_domain_lock, flags);
> +	group = iommu_group_get(dev);
> +	if (group) {
> +		/*
> +		 * The group->mutex is held across the callback, which will
> +		 * block calls to iommu_attach/detach_group/device. Hence,
> +		 * the domain of the device will not change during traversal.
> +		 *
> +		 * All devices in an iommu group share a single domain, hence
> +		 * we only dump the domain of the first device. Even though,
> +		 * this code still possibly races with the iommu_unmap()
> +		 * interface. This could be solved by RCU-freeing the page
> +		 * table pages in the iommu_unmap() path.
> +		 */
> +		iommu_group_for_each_dev(group, data,
> +					 __show_device_domain_translation);
> +		iommu_group_put(group);
> +	}
>   
> -	return ret;
> +	return 0;
> +}
> +
> +static int domain_translation_struct_show(struct seq_file *m, void *unused)
> +{
> +	return bus_for_each_dev(&pci_bus_type, NULL, m,
> +				show_device_domain_translation);
>   }
>   DEFINE_SHOW_ATTRIBUTE(domain_translation_struct);
>   
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 10bda4bec8fe..3b6571681bdd 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -314,7 +314,7 @@ static int iommu_skip_te_disable;
>   #define IDENTMAP_GFX		2
>   #define IDENTMAP_AZALIA		4
>   
> -DEFINE_SPINLOCK(device_domain_lock);
> +static DEFINE_SPINLOCK(device_domain_lock);
>   static LIST_HEAD(device_domain_list);
>   
>   const struct iommu_ops intel_iommu_ops;

-- 
"firm, enduring, strong, and long-lived"

--------------pLNgg0XHmaGg0Ki01g7V8O10
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Baolu，<br>
    </p>
    <div class="moz-cite-prefix">在 2022/7/6 10:55, Lu Baolu 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220706025524.2904370-2-baolu.lu@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">The domain_translation_struct debugfs node is used to dump the DMAR page
tables for the PCI devices. It potentially races with setting domains to
devices. The existing code uses the global spinlock device_domain_lock to
avoid the races.

This removes the use of device_domain_lock outside of iommu.c by replacing
it with the group mutex lock. Using the group mutex lock is cleaner and
more compatible to following cleanups.

Signed-off-by: Lu Baolu <a class="moz-txt-link-rfc2396E" href="mailto:baolu.lu@linux.intel.com">&lt;baolu.lu@linux.intel.com&gt;</a>
Reviewed-by: Kevin Tian <a class="moz-txt-link-rfc2396E" href="mailto:kevin.tian@intel.com">&lt;kevin.tian@intel.com&gt;</a>
---
 drivers/iommu/intel/iommu.h   |  1 -
 drivers/iommu/intel/debugfs.c | 43 +++++++++++++++++++++++++----------
 drivers/iommu/intel/iommu.c   |  2 +-
 3 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/intel/iommu.h b/drivers/iommu/intel/iommu.h
index 8285fcfa5fea..8deb745d8b36 100644
--- a/drivers/iommu/intel/iommu.h
+++ b/drivers/iommu/intel/iommu.h
@@ -480,7 +480,6 @@ enum {
 #define VTD_FLAG_SVM_CAPABLE		(1 &lt;&lt; 2)
 
 extern int intel_iommu_sm;
-extern spinlock_t device_domain_lock;
 
 #define sm_supported(iommu)	(intel_iommu_sm &amp;&amp; ecap_smts((iommu)-&gt;ecap))
 #define pasid_supported(iommu)	(sm_supported(iommu) &amp;&amp;			\
diff --git a/drivers/iommu/intel/debugfs.c b/drivers/iommu/intel/debugfs.c
index d927ef10641b..6e1a3f88abc8 100644
--- a/drivers/iommu/intel/debugfs.c
+++ b/drivers/iommu/intel/debugfs.c
@@ -342,13 +342,13 @@ static void pgtable_walk_level(struct seq_file *m, struct dma_pte *pde,
 	}
 }
 
-static int show_device_domain_translation(struct device *dev, void *data)
+static int __show_device_domain_translation(struct device *dev, void *data)
 {
-	struct device_domain_info *info = dev_iommu_priv_get(dev);
-	struct dmar_domain *domain = info-&gt;domain;
+	struct dmar_domain *domain;
 	struct seq_file *m = data;
 	u64 path[6] = { 0 };
 
+	domain = to_dmar_domain(iommu_get_domain_for_dev(dev));
 	if (!domain)
 		return 0;
 
@@ -359,20 +359,39 @@ static int show_device_domain_translation(struct device *dev, void *data)
 	pgtable_walk_level(m, domain-&gt;pgd, domain-&gt;agaw + 2, 0, path);
 	seq_putc(m, '\n');
 
-	return 0;
+	/* Don't iterate */
+	return 1;
 } </pre>
    </blockquote>
    <p>Using this return value trick to change the caller behaviour,
      seems not saving</p>
    <p> anything, but really cost me a few seconds more to know the <span
        style="FONT-SIZE: 10.5pt; COLOR: #000000; LINE-HEIGHT: normal"><b>incantation</b></span>
      -- <br>
    </p>
    <p>'Don't iterate' :) . <br>
    </p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Ethan<br>
    </p>
    <blockquote type="cite"
      cite="mid:20220706025524.2904370-2-baolu.lu@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
 
-static int domain_translation_struct_show(struct seq_file *m, void *unused)
+static int show_device_domain_translation(struct device *dev, void *data)
 {
-	unsigned long flags;
-	int ret;
+	struct iommu_group *group;
 
-	spin_lock_irqsave(&amp;device_domain_lock, flags);
-	ret = bus_for_each_dev(&amp;pci_bus_type, NULL, m,
-			       show_device_domain_translation);
-	spin_unlock_irqrestore(&amp;device_domain_lock, flags);
+	group = iommu_group_get(dev);
+	if (group) {
+		/*
+		 * The group-&gt;mutex is held across the callback, which will
+		 * block calls to iommu_attach/detach_group/device. Hence,
+		 * the domain of the device will not change during traversal.
+		 *
+		 * All devices in an iommu group share a single domain, hence
+		 * we only dump the domain of the first device. Even though,
+		 * this code still possibly races with the iommu_unmap()
+		 * interface. This could be solved by RCU-freeing the page
+		 * table pages in the iommu_unmap() path.
+		 */
+		iommu_group_for_each_dev(group, data,
+					 __show_device_domain_translation);
+		iommu_group_put(group);
+	}
 
-	return ret;
+	return 0;
+}
+
+static int domain_translation_struct_show(struct seq_file *m, void *unused)
+{
+	return bus_for_each_dev(&amp;pci_bus_type, NULL, m,
+				show_device_domain_translation);
 }
 DEFINE_SHOW_ATTRIBUTE(domain_translation_struct);
 
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 10bda4bec8fe..3b6571681bdd 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -314,7 +314,7 @@ static int iommu_skip_te_disable;
 #define IDENTMAP_GFX		2
 #define IDENTMAP_AZALIA		4
 
-DEFINE_SPINLOCK(device_domain_lock);
+static DEFINE_SPINLOCK(device_domain_lock);
 static LIST_HEAD(device_domain_list);
 
 const struct iommu_ops intel_iommu_ops;
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
"firm, enduring, strong, and long-lived"</pre>
  </body>
</html>

--------------pLNgg0XHmaGg0Ki01g7V8O10--

--===============1948052728205963179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============1948052728205963179==--
