Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B8D17196C
	for <lists.iommu@lfdr.de>; Thu, 27 Feb 2020 14:45:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A473486D22;
	Thu, 27 Feb 2020 13:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M3RRZlixWPqy; Thu, 27 Feb 2020 13:45:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E059786D1D;
	Thu, 27 Feb 2020 13:45:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C685DC0177;
	Thu, 27 Feb 2020 13:45:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88855C0177
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 13:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8427822FF0
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 13:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9bpRWXcjNQ4 for <iommu@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 13:45:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id E55A020367
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 13:45:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 261E130E;
 Thu, 27 Feb 2020 05:45:02 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 981133F703;
 Thu, 27 Feb 2020 05:44:58 -0800 (PST)
Subject: Re: [PATCH] iommu: silence iommu group prints
To: Russell King <rmk+kernel@armlinux.org.uk>, Joerg Roedel <joro@8bytes.org>
References: <E1j7Hnc-0004Bm-Kn@rmk-PC.armlinux.org.uk>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2b86add2-03aa-21f1-c58a-120a8394e6eb@arm.com>
Date: Thu, 27 Feb 2020 13:44:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <E1j7Hnc-0004Bm-Kn@rmk-PC.armlinux.org.uk>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org
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

On 27/02/2020 11:57 am, Russell King wrote:
> On the LX2160A, there are lots (about 160) of IOMMU messages produced
> during boot; this is excessive.  Reduce the severity of these messages
> to debug level.

That's... a lot. Does the system really have that many devices, or is 
some driver being stupid and repeatedly populating and destroying an 
entire bus in a probe-deferral dance?

I have no real objection to the change itself - it can be handy to see 
these when diagnosing dmesg dumps over email, but it's nothing that 
can't be gleaned from sysfs later even without dynamic debug - I'm just 
curious as to what leads to such an unusually obnoxious spamming.

Robin.

> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/iommu/iommu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 3ead597e1c57..304281ec623b 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -741,7 +741,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
>   
>   	trace_add_device_to_group(group->id, dev);
>   
> -	dev_info(dev, "Adding to iommu group %d\n", group->id);
> +	dev_dbg(dev, "Adding to iommu group %d\n", group->id);
>   
>   	return 0;
>   
> @@ -775,7 +775,7 @@ void iommu_group_remove_device(struct device *dev)
>   	struct iommu_group *group = dev->iommu_group;
>   	struct group_device *tmp_device, *device = NULL;
>   
> -	dev_info(dev, "Removing from iommu group %d\n", group->id);
> +	dev_dbg(dev, "Removing from iommu group %d\n", group->id);
>   
>   	/* Pre-notify listeners that a device is being removed. */
>   	blocking_notifier_call_chain(&group->notifier,
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
