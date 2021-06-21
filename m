Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8D03AE2B3
	for <lists.iommu@lfdr.de>; Mon, 21 Jun 2021 07:17:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F03F829F2;
	Mon, 21 Jun 2021 05:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIIx_P0tlu6f; Mon, 21 Jun 2021 05:17:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9EB168299E;
	Mon, 21 Jun 2021 05:17:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C577C0021;
	Mon, 21 Jun 2021 05:17:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3602FC000C
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 05:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E55940348
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 05:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lww6P0kGgcpd for <iommu@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 05:17:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C745140345
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 05:17:34 +0000 (UTC)
IronPort-SDR: E+nMwv7TTNRgQ6qNqsz+/NgYvd6XSNg9BfFR+IbtcFwB8inhICETeOW4nt9BR1UDbfmzv4mTYz
 2ixFYaz3TU7A==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="270623939"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="270623939"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2021 22:17:32 -0700
IronPort-SDR: 9Xxri7XJd9v6KBQMO9fhv7VvxtB0dH0OGtBQ4S0a8I7KOm46M0mLtWytuAniowgdp2Wya2YagJ
 ed//po5RjGhA==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="453761991"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.211.249])
 ([10.254.211.249])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2021 22:17:29 -0700
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org,
 dwmw2@infradead.org, robin.murphy@arm.com, corbet@lwn.net
References: <1624016058-189713-1-git-send-email-john.garry@huawei.com>
 <1624016058-189713-7-git-send-email-john.garry@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v14 6/6] iommu: Remove mode argument from
 iommu_set_dma_strict()
Message-ID: <c062ef9e-c106-4218-ba2a-c94fdcb6d955@linux.intel.com>
Date: Mon, 21 Jun 2021 13:17:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624016058-189713-7-git-send-email-john.garry@huawei.com>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

On 2021/6/18 19:34, John Garry wrote:
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 60b1ec42e73b..ff221d3ddcbc 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -349,10 +349,9 @@ static int __init iommu_dma_setup(char *str)
>   }
>   early_param("iommu.strict", iommu_dma_setup);
>   
> -void iommu_set_dma_strict(bool strict)
> +void iommu_set_dma_strict(void)
>   {
> -	if (strict || !(iommu_cmd_line & IOMMU_CMD_LINE_STRICT))
> -		iommu_dma_strict = strict;
> +	iommu_dma_strict = true;
>   }

Sorry for this late comment.

Normally the cache invalidation policy should come from the user. We
have pre-build kernel option and also a kernel boot command iommu.strict
to override it. These seem reasonable.

We also have a helper (iommu_set_dma_strict()) so that the vendor iommu
driver could squeeze in and change the previous settings mostly due to:

a) vendor iommu driver specific kernel boot command. (We are about to
    deprecate those.)

b) quirky hardware.

c) kernel optimization (e.x. strict mode in VM environment).

a) and b) are mandatory, while c) is optional. In any instance should c)
override the flush mode specified by the user. Hence, probably we should
also have another helper like:

void iommu_set_dma_strict_optional()
{
	if (!(iommu_cmd_line & IOMMU_CMD_LINE_STRICT))
		iommu_dma_strict = true;
}

Any thoughts?

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
