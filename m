Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C8B3ACBCB
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 15:10:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05632400DF;
	Fri, 18 Jun 2021 13:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFy2LaDVCvGx; Fri, 18 Jun 2021 13:10:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6C1374020E;
	Fri, 18 Jun 2021 13:10:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4658CC000B;
	Fri, 18 Jun 2021 13:10:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29F64C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 13:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15F95403B4
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 13:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9qVpl9JRpbFJ for <iommu@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:10:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AAD3403AB
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 13:10:41 +0000 (UTC)
IronPort-SDR: DZ4d/EzALwV0qMidFlSIdmbhTRkpFJbaI5NQAqnGD8wBeRY5Wh7ypajoetbokRFm1BMM8fvCIp
 MCbNyFUwzmuw==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="292180811"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="292180811"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 06:10:41 -0700
IronPort-SDR: ndZdFsDW8Q3BKEovwvKaFojvoM9Lgdt1pUsbdH7Je72Npur3QRwE+sGTVj3Ui9CsuA7D0y+wic
 hZY4iAqUlEBQ==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="485683801"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.212.157])
 ([10.254.212.157])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 06:10:38 -0700
Subject: Re: [PATCH v14 2/6] iommu: Print strict or lazy mode at init time
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org,
 dwmw2@infradead.org, robin.murphy@arm.com, corbet@lwn.net
References: <1624016058-189713-1-git-send-email-john.garry@huawei.com>
 <1624016058-189713-3-git-send-email-john.garry@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <502b7d81-7c6e-affd-0e06-4f0caf7e9fb9@linux.intel.com>
Date: Fri, 18 Jun 2021 21:10:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624016058-189713-3-git-send-email-john.garry@huawei.com>
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
> As well as the default domain type, it's useful to know whether strict
> or lazy for DMA domains, so add this info in a separate print.
> 
> The (stict/lazy) mode may be also set via iommu.strict earlyparm, but
> this will be processed prior to iommu_subsys_init(), so that print will be
> accurate for drivers which don't set the mode via custom means.
> 
> For the drivers which set the mode via custom means - AMD and Intel drivers
> - they maintain prints to inform a change in policy or that custom cmdline
> methods to change policy are deprecated.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/iommu/iommu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 5419c4b9f27a..cf58949cc2f3 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -138,6 +138,11 @@ static int __init iommu_subsys_init(void)
>   		(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API) ?
>   			"(set via kernel command line)" : "");
>   
> +	pr_info("DMA domain TLB invalidation policy: %s mode %s\n",
> +		iommu_dma_strict ? "strict" : "lazy",
> +		(iommu_cmd_line & IOMMU_CMD_LINE_STRICT) ?
> +			"(set via kernel command line)" : "");
> +
>   	return 0;
>   }
>   subsys_initcall(iommu_subsys_init);
> 

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
