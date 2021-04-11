Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CBF35B24C
	for <lists.iommu@lfdr.de>; Sun, 11 Apr 2021 09:56:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71FD5403BF;
	Sun, 11 Apr 2021 07:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsJyl3peSPXT; Sun, 11 Apr 2021 07:56:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 511C3403BA;
	Sun, 11 Apr 2021 07:56:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E69F8C0011;
	Sun, 11 Apr 2021 07:56:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABFF1C000A
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 07:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89D44403A6
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 07:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlN9wcMPXOn3 for <iommu@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 07:56:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46309403A3
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 07:56:21 +0000 (UTC)
IronPort-SDR: QlGo1/v1r+qaZOyeWHynFHhS7Noiviw6GKltCG/BmaYdhJemDaQRUdgA3lE3W1S7RwVEVBJEWr
 ouxQJl8xOGpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9950"; a="190817663"
X-IronPort-AV: E=Sophos;i="5.82,213,1613462400"; d="scan'208";a="190817663"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2021 00:56:20 -0700
IronPort-SDR: LpBm9mbWSifoYze1iueqgKVnmshJ3hp+KegkzKkyfcvtirNgCZfidWTUKBwstADd1EfIW861tI
 erjvBtIBTopQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,213,1613462400"; d="scan'208";a="442696473"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2021 00:56:18 -0700
Subject: Re: [PATCH] iommu/vt-d: Fix an error handling path in
 'intel_prepare_irq_remapping()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dwmw2@infradead.org,
 joro@8bytes.org, will@kernel.org, kyung.min.park@intel.com
References: <98d531caabe66012b4fffc7813fd4b9470afd517.1618124777.git.christophe.jaillet@wanadoo.fr>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f43ba8b7-8977-c1e7-ffa2-7f7b5306c7f2@linux.intel.com>
Date: Sun, 11 Apr 2021 15:46:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <98d531caabe66012b4fffc7813fd4b9470afd517.1618124777.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 4/11/21 3:08 PM, Christophe JAILLET wrote:
> If 'intel_cap_audit()' fails, we should return directly, as already done in
> the surrounding error handling path.
> 
> Fixes: ad3d19029979 ("iommu/vt-d: Audit IOMMU Capabilities and add helper functions")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is completely speculative.
> It is based on a spurious mix-up of direct return and goto.
> ---
>   drivers/iommu/intel/irq_remapping.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
> index 75429a5373ec..f912fe45bea2 100644
> --- a/drivers/iommu/intel/irq_remapping.c
> +++ b/drivers/iommu/intel/irq_remapping.c
> @@ -736,7 +736,7 @@ static int __init intel_prepare_irq_remapping(void)
>   		return -ENODEV;
>   
>   	if (intel_cap_audit(CAP_AUDIT_STATIC_IRQR, NULL))
> -		goto error;
> +		return -ENODEV;
>   
>   	if (!dmar_ir_support())
>   		return -ENODEV;
> 

Thanks!

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
