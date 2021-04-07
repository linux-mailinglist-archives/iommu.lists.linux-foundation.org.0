Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BF31735610A
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 03:53:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E5F784898;
	Wed,  7 Apr 2021 01:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2reKUYNYTMXZ; Wed,  7 Apr 2021 01:53:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E84C848BB;
	Wed,  7 Apr 2021 01:53:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21FA0C0012;
	Wed,  7 Apr 2021 01:53:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55874C000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 01:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44412606E4
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 01:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fuBoelauCt8 for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 01:53:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B002606E1
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 01:53:22 +0000 (UTC)
IronPort-SDR: 5Nd+lghowlkknYvMCmboQ90pQCQxoh7bLQNulUTXE+fbGhKLFd0U7rjwRC8M44vQRKXRyiHAPL
 Ro7YAfyV9tCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="193310016"
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="193310016"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 18:53:20 -0700
IronPort-SDR: F2H9WZz8kmYB006vKmL21jihdZGsxMErTPt54pu8Ti7jSM4DLor9LiY4jxZbuvhWH1v36dqNyk
 bPO/FKZ9eieA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="441149122"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 06 Apr 2021 18:53:18 -0700
Subject: Re: [PATCH v5.4 1/1] iommu/vt-d: Fix agaw for a supported 48 bit
 guest address width
To: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
References: <20210406163534.40735-1-saeed.mirzamohammadi@oracle.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <c525cdda-2286-c8db-bae4-e0092e5c830a@linux.intel.com>
Date: Wed, 7 Apr 2021 09:43:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406163534.40735-1-saeed.mirzamohammadi@oracle.com>
Content-Language: en-US
Cc: Camille Lu <camille.lu@hpe.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

Hi Saeed,

On 4/7/21 12:35 AM, Saeed Mirzamohammadi wrote:
> The IOMMU driver calculates the guest addressability for a DMA request
> based on the value of the mgaw reported from the IOMMU. However, this
> is a fused value and as mentioned in the spec, the guest width
> should be calculated based on the supported adjusted guest address width
> (SAGAW).
> 
> This is from specification:
> "Guest addressability for a given DMA request is limited to the
> minimum of the value reported through this field and the adjusted
> guest address width of the corresponding page-table structure.
> (Adjusted guest address widths supported by hardware are reported
> through the SAGAW field)."
> 
> This causes domain initialization to fail and following
> errors appear for EHCI PCI driver:
> 
> [    2.486393] ehci-pci 0000:01:00.4: EHCI Host Controller
> [    2.486624] ehci-pci 0000:01:00.4: new USB bus registered, assigned bus
> number 1
> [    2.489127] ehci-pci 0000:01:00.4: DMAR: Allocating domain failed
> [    2.489350] ehci-pci 0000:01:00.4: DMAR: 32bit DMA uses non-identity
> mapping
> [    2.489359] ehci-pci 0000:01:00.4: can't setup: -12
> [    2.489531] ehci-pci 0000:01:00.4: USB bus 1 deregistered
> [    2.490023] ehci-pci 0000:01:00.4: init 0000:01:00.4 fail, -12
> [    2.490358] ehci-pci: probe of 0000:01:00.4 failed with error -12
> 
> This issue happens when the value of the sagaw corresponds to a
> 48-bit agaw. This fix updates the calculation of the agaw based on
> the IOMMU's sagaw value.
> 
> Signed-off-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
> Tested-by: Camille Lu <camille.lu@hpe.com>
> ---
>   drivers/iommu/intel-iommu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 953d86ca6d2b..396e14fad54b 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -1867,8 +1867,8 @@ static int domain_init(struct dmar_domain *domain, struct intel_iommu *iommu,
>   	domain_reserve_special_ranges(domain);
>   
>   	/* calculate AGAW */
> -	if (guest_width > cap_mgaw(iommu->cap))
> -		guest_width = cap_mgaw(iommu->cap);
> +	if (guest_width > agaw_to_width(iommu->agaw))
> +		guest_width = agaw_to_width(iommu->agaw);

The spec requires to use a minimum of MGAW and AGAW, so why not,

	cap_width = min_t(int, cap_mgaw(iommu->cap), agaw_to_width(iommu->agaw));
	if (guest_width > cap_width)
		guest_width = cap_width;

Best regards,
baolu

>   	domain->gaw = guest_width;
>   	adjust_width = guestwidth_to_adjustwidth(guest_width);
>   	agaw = width_to_agaw(adjust_width);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
