Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B7C172EB3
	for <lists.iommu@lfdr.de>; Fri, 28 Feb 2020 03:16:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5ED8686B30;
	Fri, 28 Feb 2020 02:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WojjNKVeLU62; Fri, 28 Feb 2020 02:16:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 719A886B17;
	Fri, 28 Feb 2020 02:16:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59CADC0177;
	Fri, 28 Feb 2020 02:16:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97B69C0177
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 02:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8054186374
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 02:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fI2YJj6aHvdZ for <iommu@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 02:16:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E14BC86366
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 02:16:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 18:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="230966152"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.213.68])
 ([10.254.213.68])
 by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2020 18:16:04 -0800
Subject: Re: [PATCH] iommu: silence iommu group prints
To: Russell King <rmk+kernel@armlinux.org.uk>, Joerg Roedel <joro@8bytes.org>
References: <E1j7Hnc-0004Bm-Kn@rmk-PC.armlinux.org.uk>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f0fc4c8c-4475-e77f-da6d-e068e7993568@linux.intel.com>
Date: Fri, 28 Feb 2020 10:16:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <E1j7Hnc-0004Bm-Kn@rmk-PC.armlinux.org.uk>
Content-Language: en-US
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

Hi,

On 2020/2/27 19:57, Russell King wrote:
> On the LX2160A, there are lots (about 160) of IOMMU messages produced
> during boot; this is excessive.  Reduce the severity of these messages
> to debug level.
> 
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

I'm not strongly against this. But to me this message seems to be a good
indicator that a device was probed successfully by the iommu subsystem.
Keeping it in the default kernel message always helps to the kernel
debugging.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
