Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3D03BC87E
	for <lists.iommu@lfdr.de>; Tue,  6 Jul 2021 11:27:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3477A82AF8;
	Tue,  6 Jul 2021 09:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQZ-14iUNg6Y; Tue,  6 Jul 2021 09:27:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5E00382C1E;
	Tue,  6 Jul 2021 09:27:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EA0FC001F;
	Tue,  6 Jul 2021 09:27:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 303E5C000E
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 09:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CC33403AD
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 09:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZU2UqpO9azA for <iommu@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 09:27:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC72402FE
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 09:27:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D37E31B;
 Tue,  6 Jul 2021 02:27:45 -0700 (PDT)
Received: from [10.57.40.45] (unknown [10.57.40.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1E473F5A1;
 Tue,  6 Jul 2021 02:27:44 -0700 (PDT)
Subject: Re: [PATCH] iommu: Fallback to default setting when def_domain_type()
 callback returns 0
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, joro@8bytes.org,
 will@kernel.org
References: <20210706065106.271765-1-kai.heng.feng@canonical.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d9fa9a62-6522-7d26-0cca-16f6886136ec@arm.com>
Date: Tue, 6 Jul 2021 10:27:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706065106.271765-1-kai.heng.feng@canonical.com>
Content-Language: en-GB
Cc: "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
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

On 2021-07-06 07:51, Kai-Heng Feng wrote:
> Commit 28b41e2c6aeb ("iommu: Move def_domain type check for untrusted
> device into core") not only moved the check for untrusted device to
> IOMMU core, it also introduced a behavioral change by returning
> def_domain_type() directly without checking its return value. That makes
> many devices no longer use the default IOMMU setting.
> 
> So revert back to the old behavior which defaults to
> iommu_def_domain_type when driver callback returns 0.
> 
> Fixes: 28b41e2c6aeb ("iommu: Move def_domain type check for untrusted device into core")

Are you sure about that? From that same commit:

@@ -1507,7 +1509,7 @@ static int iommu_alloc_default_domain(struct 
iommu_group *group,
         if (group->default_domain)
                 return 0;

-       type = iommu_get_def_domain_type(dev);
+       type = iommu_get_def_domain_type(dev) ? : iommu_def_domain_type;

         return iommu_group_alloc_default_domain(dev->bus, group, type);
  }

AFAICS the other two callers should also handle 0 correctly. Have you 
seen a problem in practice?

Robin.

> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>   drivers/iommu/iommu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 5419c4b9f27a..faac4f795025 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1507,14 +1507,15 @@ EXPORT_SYMBOL_GPL(fsl_mc_device_group);
>   static int iommu_get_def_domain_type(struct device *dev)
>   {
>   	const struct iommu_ops *ops = dev->bus->iommu_ops;
> +	unsigned int type = 0;
>   
>   	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
>   		return IOMMU_DOMAIN_DMA;
>   
>   	if (ops->def_domain_type)
> -		return ops->def_domain_type(dev);
> +		type = ops->def_domain_type(dev);
>   
> -	return 0;
> +	return (type == 0) ? iommu_def_domain_type : type;
>   }
>   
>   static int iommu_group_alloc_default_domain(struct bus_type *bus,
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
