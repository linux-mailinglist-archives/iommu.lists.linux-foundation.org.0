Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3C29CE54
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 07:10:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E0534203FD;
	Wed, 28 Oct 2020 06:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qUJiHbXPI9X; Wed, 28 Oct 2020 06:10:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 07C0920408;
	Wed, 28 Oct 2020 06:10:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DADBCC0051;
	Wed, 28 Oct 2020 06:10:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE904C0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 06:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C383686895
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 06:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0aNWekZl161o for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 06:10:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2F7F38651A
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 06:10:36 +0000 (UTC)
IronPort-SDR: nX6UShSmBT1I9yv/5g9UhByOqUv/XStDwZM6oU8dpVdXmCKCfe+2BHs5rt427wmA7hgMPrlaEE
 7to3IN/GJs1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="165620912"
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="165620912"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 23:10:35 -0700
IronPort-SDR: uqpel1tmSkKXVc75j0vJOS+rbMkSD0RJCkN/4UmYkfBxJF+MbGh15BKTE9cu28s/EDgCvNWZkp
 VQeugtoInG2g==
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; d="scan'208";a="468605696"
Received: from yisun1-ubuntu.bj.intel.com (HELO yi.y.sun) ([10.238.156.116])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 27 Oct 2020 23:10:33 -0700
Date: Wed, 28 Oct 2020 14:05:55 +0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v1 1/3] iommu/vt-d: Fix prq reporting issues
Message-ID: <20201028060555.GC27139@yi.y.sun>
References: <1603849018-6578-1-git-send-email-yi.y.sun@linux.intel.com>
 <1603849018-6578-2-git-send-email-yi.y.sun@linux.intel.com>
 <f330e49a-0bf4-08c7-8e24-04606ec4819e@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f330e49a-0bf4-08c7-8e24-04606ec4819e@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: dwmw2@infradead.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

Thanks! Will do the modifications according to your comments in next
version.

On 20-10-28 12:50:37, Lu Baolu wrote:
> Hi Yi,
> 
> On 10/28/20 9:36 AM, Yi Sun wrote:
> >From: Liu Yi L <yi.l.liu@intel.com>
> >
> >Should get correct sid and set it into sdev. Because we execute
> >'sdev->sid != req->rid' in the loop of prq_event_thread().
> 
> How about making the title more accurate, how about something like:
> 
> iommu/vt-d: Fix use before set issue in intel_svm_bind_gpasid()
> 
> >
> >Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> >Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
> >---
> >  drivers/iommu/intel/svm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> >diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> >index f1861fa..75d9dc9 100644
> >--- a/drivers/iommu/intel/svm.c
> >+++ b/drivers/iommu/intel/svm.c
> >@@ -277,6 +277,7 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
> >  			  struct iommu_gpasid_bind_data *data)
> >  {
> >  	struct intel_iommu *iommu = device_to_iommu(dev, NULL, NULL);
> >+	struct device_domain_info *info;
> >  	struct intel_svm_dev *sdev = NULL;
> >  	struct dmar_domain *dmar_domain;
> >  	struct intel_svm *svm = NULL;
> >@@ -357,6 +358,8 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
> >  		goto out;
> >  	}
> >  	sdev->dev = dev;
> >+	info = get_domain_info(dev);
> >+	sdev->sid = PCI_DEVID(info->bus, info->devfn);
> >  	/* Only count users if device has aux domains */
> >  	if (iommu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX))
> >
> 
> How about moving get_domain_info() up to the sanity check part?
> 
> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> index f1861fa3d0e4..75846692f2f2 100644
> --- a/drivers/iommu/intel/svm.c
> +++ b/drivers/iommu/intel/svm.c
> @@ -279,6 +279,7 @@ int intel_svm_bind_gpasid(struct iommu_domain
> *domain, struct device *dev,
>         struct intel_iommu *iommu = device_to_iommu(dev, NULL, NULL);
>         struct intel_svm_dev *sdev = NULL;
>         struct dmar_domain *dmar_domain;
> +       struct device_domain_info *info;
>         struct intel_svm *svm = NULL;
>         int ret = 0;
> 
> @@ -310,6 +311,10 @@ int intel_svm_bind_gpasid(struct iommu_domain
> *domain, struct device *dev,
>         if (data->hpasid <= 0 || data->hpasid >= PASID_MAX)
>                 return -EINVAL;
> 
> +       info = get_domain_info(dev);
> +       if (!info)
> +               return -EINVAL;
> +
>         dmar_domain = to_dmar_domain(domain);
> 
>         mutex_lock(&pasid_mutex);
> @@ -357,6 +362,7 @@ int intel_svm_bind_gpasid(struct iommu_domain
> *domain, struct device *dev,
>                 goto out;
>         }
>         sdev->dev = dev;
> +       sdev->sid = PCI_DEVID(info->bus, info->devfn);
> 
>         /* Only count users if device has aux domains */
>         if (iommu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX))
> 
> Best regards,
> baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
