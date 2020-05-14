Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B1B1D353A
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 17:36:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1E54287A78;
	Thu, 14 May 2020 15:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wH6tkpyciyWC; Thu, 14 May 2020 15:36:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F57387AE6;
	Thu, 14 May 2020 15:36:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 532F8C0893;
	Thu, 14 May 2020 15:36:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6802EC016F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 15:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5271322FEE
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 15:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uByovigT9wlz for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 15:36:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id C21A122D10
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 15:36:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5B26B26F; Thu, 14 May 2020 17:36:25 +0200 (CEST)
Date: Thu, 14 May 2020 17:36:24 +0200
From: Joerg Roedel <joro@8bytes.org>
To: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tom Murphy <murphyt7@tcd.ie>
Subject: Re: amd kdump failure with iommu=nopt
Message-ID: <20200514153623.GM18353@8bytes.org>
References: <20200514031838.2oklmyrc3n5it2ox@cantor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514031838.2oklmyrc3n5it2ox@cantor>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi Jerry,

On Wed, May 13, 2020 at 08:18:38PM -0700, Jerry Snitselaar wrote:
> We've seen kdump failures with recent kernels (5.5, 5.6, 5.7-rc1) on
> amd systems when iommu is enabled in translation mode. In the cases so
> far there has been mpt3sas involved, but I'm also seeing io page
> faults for ahci right before mpt3sas has an io page fault:

Thanks for the report!

>> It was bisected to:
> 
> commit be62dbf554c5b50718a54a359372c148cd9975c7
> Author: Tom Murphy <murphyt7@tcd.ie>
> Date:   Sun Sep 8 09:56:41 2019 -0700
> 
>     iommu/amd: Convert AMD iommu driver to the dma-iommu api

This commit also removes the deferred attach of the device to its new
domain. Does the attached diff fix the problem for you?


	Joerg

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4050569188be..40df255b6c7a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1889,23 +1889,37 @@ void iommu_domain_free(struct iommu_domain *domain)
 }
 EXPORT_SYMBOL_GPL(iommu_domain_free);
 
-static int __iommu_attach_device(struct iommu_domain *domain,
-				 struct device *dev)
+static bool __iommu_is_attach_deferred(struct iommu_domain *domain,
+				       struct device *dev)
 {
-	int ret;
-	if ((domain->ops->is_attach_deferred != NULL) &&
-	    domain->ops->is_attach_deferred(domain, dev))
-		return 0;
+	if (!domain->ops->is_attach_deferred)
+		return false;
+
+	return domain->ops->is_attach_deferred(domain, dev);
+}
 
+static int __iommu_attach_device_no_defer(struct iommu_domain *domain,
+					  struct device *dev)
+{
 	if (unlikely(domain->ops->attach_dev == NULL))
 		return -ENODEV;
 
 	ret = domain->ops->attach_dev(domain, dev);
 	if (!ret)
 		trace_attach_device_to_domain(dev);
+
 	return ret;
 }
 
+static int __iommu_attach_device(struct iommu_domain *domain,
+				 struct device *dev)
+{
+	if (__iommu_is_attach_deferred(domain, dev))
+		return 0;
+
+	return __iommu_attach_device_no_defer(domain, dev);
+}
+
 int iommu_attach_device(struct iommu_domain *domain, struct device *dev)
 {
 	struct iommu_group *group;
@@ -2023,7 +2037,12 @@ EXPORT_SYMBOL_GPL(iommu_get_domain_for_dev);
  */
 struct iommu_domain *iommu_get_dma_domain(struct device *dev)
 {
-	return dev->iommu_group->default_domain;
+	struct iommu_domain *domain = dev->iommu_group->default_domain;
+
+	if (__iommu_is_attach_deferred(domain, dev))
+		__iommu_attach_device_no_defer(domain, dev);
+
+	return domain;
 }
 
 /*
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
