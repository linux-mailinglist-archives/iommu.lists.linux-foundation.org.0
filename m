Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA31E581A
	for <lists.iommu@lfdr.de>; Thu, 28 May 2020 09:02:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 818E987E2B;
	Thu, 28 May 2020 07:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtDBBnFmo3wL; Thu, 28 May 2020 07:02:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 01F8387FAF;
	Thu, 28 May 2020 07:02:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF616C07FF;
	Thu, 28 May 2020 07:02:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F31BC016F
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 07:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6D7CE86E04
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 07:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uB0_CN1rWOkQ for <iommu@lists.linux-foundation.org>;
 Thu, 28 May 2020 07:02:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D3C9986DF8
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 07:02:20 +0000 (UTC)
IronPort-SDR: AJZeBm+bbkRQt6AxujO9c4S/LIyyaAF6bALieED0idaSESP9Nh6ULfExwdT6MH8b04lABMo3QI
 F4TbU/YJsQuQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 00:02:20 -0700
IronPort-SDR: qZ8B6ItD35NidF6MB+sge5PnxSUDRGtBKhVxFvGTgB9/+ES3McGrWsQYatYsq8+dk5MESuqRJf
 2GC48z3wIa1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; d="scan'208";a="442845633"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.255.30.232])
 ([10.255.30.232])
 by orsmga005.jf.intel.com with ESMTP; 28 May 2020 00:02:17 -0700
Subject: Re: [PATCH v1 3/3] iommu/vt-d: Remove real DMA lookup in find_domain
To: Jon Derrick <jonathan.derrick@intel.com>, iommu@lists.linux-foundation.org
References: <20200527165617.297470-1-jonathan.derrick@intel.com>
 <20200527165617.297470-4-jonathan.derrick@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <6e94b90c-f849-d206-0b0e-f1c8253ac939@linux.intel.com>
Date: Thu, 28 May 2020 15:02:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200527165617.297470-4-jonathan.derrick@intel.com>
Content-Language: en-US
Cc: Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org
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

On 2020/5/28 0:56, Jon Derrick wrote:
> By removing the real DMA indirection in find_domain(), we can allow
> sub-devices of a real DMA device to have their own valid
> device_domain_info. The dmar lookup and context entry removal paths have
> been fixed to account for sub-devices.
> 
> Fixes: 2b0140c69637 ("iommu/vt-d: Use pci_real_dma_dev() for mapping")
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=207575
> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/intel-iommu.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 6d39b9b..5767882 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -2436,9 +2436,6 @@ struct dmar_domain *find_domain(struct device *dev)
>   	if (unlikely(attach_deferred(dev) || iommu_dummy(dev)))
>   		return NULL;
>   
> -	if (dev_is_pci(dev))
> -		dev = &pci_real_dma_dev(to_pci_dev(dev))->dev;
> -
>   	/* No lock here, assumes no domain exit in normal case */
>   	info = get_domain_info(dev);
>   	if (likely(info))
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
