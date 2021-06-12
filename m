Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 097953A4C37
	for <lists.iommu@lfdr.de>; Sat, 12 Jun 2021 04:24:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83EB4405BB;
	Sat, 12 Jun 2021 02:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QMuolXC0zar3; Sat, 12 Jun 2021 02:24:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 685F9405F7;
	Sat, 12 Jun 2021 02:24:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42C51C0024;
	Sat, 12 Jun 2021 02:24:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58F46C000B
 for <iommu@lists.linux-foundation.org>; Sat, 12 Jun 2021 02:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54E5540150
 for <iommu@lists.linux-foundation.org>; Sat, 12 Jun 2021 02:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qmu9huLPC5hj for <iommu@lists.linux-foundation.org>;
 Sat, 12 Jun 2021 02:23:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEB04400C4
 for <iommu@lists.linux-foundation.org>; Sat, 12 Jun 2021 02:23:59 +0000 (UTC)
IronPort-SDR: j8fip2PSjfBO0bq3Tke2gUk1WwnR+bo4Mp6TIWg9Lq8NLsXkni8BXJOcfqLZhGrC2r911/Z92W
 futdvOLyjTUw==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="185332949"
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; d="scan'208";a="185332949"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 19:23:59 -0700
IronPort-SDR: 8jemTF4V0VjmsAdxVI3xwFWfjUYCw9xzJh7FOp6AoqNXBh/ztgG/X7Oj+GXtkg1td9PDZT1y0V
 mthyX7dqWpzA==
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; d="scan'208";a="483473995"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.238.4.20])
 ([10.238.4.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 19:23:56 -0700
Subject: Re: [PATCH v12 5/5] iommu: Remove mode argument from
 iommu_set_dma_strict()
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org,
 dwmw2@infradead.org, robin.murphy@arm.com
References: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
 <1623414043-40745-6-git-send-email-john.garry@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1b58516d-73d5-0c40-11de-58b998ec803e@linux.intel.com>
Date: Sat, 12 Jun 2021 10:23:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623414043-40745-6-git-send-email-john.garry@huawei.com>
Content-Language: en-US
Cc: linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On 2021/6/11 20:20, John Garry wrote:
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index ccbd5d4c1a50..146cb71c7441 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -350,10 +350,9 @@ static int __init iommu_dma_setup(char *str)
>   }
>   early_param("iommu.strict", iommu_dma_setup);
>   
> -void iommu_set_dma_strict(bool strict)
> +void iommu_set_dma_strict(void)
>   {
> -	if (strict || !(iommu_cmd_line & IOMMU_CMD_LINE_STRICT))
> -		iommu_dma_strict = strict;
> +		iommu_dma_strict = true;
>   }

Will this change break the functionality of iommu.strict?

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
