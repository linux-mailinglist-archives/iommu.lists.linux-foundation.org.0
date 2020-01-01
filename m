Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC512DD92
	for <lists.iommu@lfdr.de>; Wed,  1 Jan 2020 05:00:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D8DF1870DF;
	Wed,  1 Jan 2020 04:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLhVsHg3+tji; Wed,  1 Jan 2020 04:00:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AD588870C7;
	Wed,  1 Jan 2020 04:00:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2AFBC077D;
	Wed,  1 Jan 2020 04:00:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 507EDC077D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 04:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3746B204A2
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 04:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJm-PH8rVBiQ for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jan 2020 04:00:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id 9214A20441
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 04:00:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Dec 2019 20:00:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,381,1571727600"; d="scan'208";a="244308518"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by fmsmga004.fm.intel.com with ESMTP; 31 Dec 2019 20:00:50 -0800
Subject: Re: [RFC 1/5] iommu: Remove device link to group on failure
To: Jon Derrick <jonathan.derrick@intel.com>,
 iommu@lists.linux-foundation.org, linux-pci@vger.kernel.org
References: <1577823863-3303-1-git-send-email-jonathan.derrick@intel.com>
 <1577823863-3303-2-git-send-email-jonathan.derrick@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <14d024e0-42df-12ae-0571-bd27b26166b7@linux.intel.com>
Date: Wed, 1 Jan 2020 11:59:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577823863-3303-2-git-send-email-jonathan.derrick@intel.com>
Content-Language: en-US
Cc: Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>
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

Hi,

On 1/1/20 4:24 AM, Jon Derrick wrote:
> This adds the missing teardown step that removes the device link from
> the group when the device addition fails.

This change looks good to me.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> 
> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
> ---
>   drivers/iommu/iommu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index d5174f0..3e35284 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -768,6 +768,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
>   	mutex_unlock(&group->mutex);
>   	dev->iommu_group = NULL;
>   	kobject_put(group->devices_kobj);
> +	sysfs_remove_link(group->devices_kobj, device->name);
>   err_free_name:
>   	kfree(device->name);
>   err_remove_link:
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
