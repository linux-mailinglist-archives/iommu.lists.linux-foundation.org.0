Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C31C9F84
	for <lists.iommu@lfdr.de>; Fri,  8 May 2020 02:24:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C37CC879E3;
	Fri,  8 May 2020 00:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0BUYYbHj8g0; Fri,  8 May 2020 00:24:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B69AC879C3;
	Fri,  8 May 2020 00:24:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FF16C07FF;
	Fri,  8 May 2020 00:24:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E8E7C07FF
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 00:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9B52086AA1
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 00:24:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9g1PV3pFC47 for <iommu@lists.linux-foundation.org>;
 Fri,  8 May 2020 00:24:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5E6CE86A70
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 00:24:15 +0000 (UTC)
IronPort-SDR: 7fSUoBrZLueb8n18Ul407Lw6NHu0f/auyvyyKfZOkltk6YGfxjnERpqxC9AP959aaemLfIsJC1
 BVX2ASWeYTLA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 17:24:13 -0700
IronPort-SDR: 1Zi4Qd9E+Nx450xCX3ZsSeJlDW74I7iDz3F9hHvwI6LaRKJdUcFthkQlo2jlp8sYLZBoi5Tnhw
 06mZx0TFm6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,365,1583222400"; d="scan'208";a="278777604"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by orsmga002.jf.intel.com with ESMTP; 07 May 2020 17:24:12 -0700
Subject: Re: [PATCH v1 1/3] iommu/vt-d: Unify format of the printed messages
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
 iommu@lists.linux-foundation.org
References: <20200507161804.13275-1-andriy.shevchenko@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <07742be4-1c71-bd72-adea-29ab51e67a70@linux.intel.com>
Date: Fri, 8 May 2020 08:20:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507161804.13275-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
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

On 5/8/20 12:18 AM, Andy Shevchenko wrote:
> Unify format of the printed messages, i.e. replace printk(LEVEL ... )
> with pr_level(...).

Thanks!

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/iommu/intel-iommu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 0182cff2c7ac7..624831e5a583c 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -480,8 +480,7 @@ static int __init intel_iommu_setup(char *str)
>   			pr_info("Intel-IOMMU: scalable mode supported\n");
>   			intel_iommu_sm = 1;
>   		} else if (!strncmp(str, "tboot_noforce", 13)) {
> -			printk(KERN_INFO
> -				"Intel-IOMMU: not forcing on after tboot. This could expose security risk for tboot\n");
> +			pr_info("Intel-IOMMU: not forcing on after tboot. This could expose security risk for tboot\n");
>   			intel_iommu_tboot_noforce = 1;
>   		} else if (!strncmp(str, "nobounce", 8)) {
>   			pr_info("Intel-IOMMU: No bounce buffer. This could expose security risks of DMA attacks\n");
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
