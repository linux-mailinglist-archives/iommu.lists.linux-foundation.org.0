Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 296501D355C
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 17:40:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D50C388B0A;
	Thu, 14 May 2020 15:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9askuz1G-ckf; Thu, 14 May 2020 15:40:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D42C88B06;
	Thu, 14 May 2020 15:40:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED018C016F;
	Thu, 14 May 2020 15:40:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C3E5C016F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 15:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 753618963F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 15:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72+ur9lr7ETb for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 15:40:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D837889612
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 15:40:24 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 87CCC26F; Thu, 14 May 2020 17:40:21 +0200 (CEST)
Date: Thu, 14 May 2020 17:40:20 +0200
From: Joerg Roedel <joro@8bytes.org>
To: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tom Murphy <murphyt7@tcd.ie>
Subject: Re: amd kdump failure with iommu=nopt
Message-ID: <20200514154020.GN18353@8bytes.org>
References: <20200514031838.2oklmyrc3n5it2ox@cantor>
 <20200514153623.GM18353@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514153623.GM18353@8bytes.org>
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

On Thu, May 14, 2020 at 05:36:23PM +0200, Joerg Roedel wrote:
> This commit also removes the deferred attach of the device to its new
> domain. Does the attached diff fix the problem for you?
> +static int __iommu_attach_device_no_defer(struct iommu_domain *domain,
> +					  struct device *dev)
> +{
>  	if (unlikely(domain->ops->attach_dev == NULL))
>  		return -ENODEV;
>  
>  	ret = domain->ops->attach_dev(domain, dev);
>  	if (!ret)
>  		trace_attach_device_to_domain(dev);
> +
>  	return ret;
>  }

Sorry, this didn't compile, here is an updated version that actually
compiles:


diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4050569188be..f54ebb964271 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1889,13 +1889,19 @@ void iommu_domain_free(struct iommu_domain *domain)
 }
 EXPORT_SYMBOL_GPL(iommu_domain_free);
 
-static int __iommu_attach_device(struct iommu_domain *domain,
-				 struct device *dev)
+static bool __iommu_is_attach_deferred(struct iommu_domain *domain,
+				       struct device *dev)
+{
+	if (!domain->ops->is_attach_deferred)
+		return false;
+
+	return domain->ops->is_attach_deferred(domain, dev);
+}
+
+static int __iommu_attach_device_no_defer(struct iommu_domain *domain,
+					  struct device *dev)
 {
 	int ret;
-	if ((domain->ops->is_attach_deferred != NULL) &&
-	    domain->ops->is_attach_deferred(domain, dev))
-		return 0;
 
 	if (unlikely(domain->ops->attach_dev == NULL))
 		return -ENODEV;
@@ -1903,9 +1909,19 @@ static int __iommu_attach_device(struct iommu_domain *domain,
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
@@ -2023,7 +2039,12 @@ EXPORT_SYMBOL_GPL(iommu_get_domain_for_dev);
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
