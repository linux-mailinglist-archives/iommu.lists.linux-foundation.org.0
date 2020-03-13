Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E43A71848D6
	for <lists.iommu@lfdr.de>; Fri, 13 Mar 2020 15:09:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7BAF0895DD;
	Fri, 13 Mar 2020 14:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSxGqt89jHCU; Fri, 13 Mar 2020 14:08:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D5549895CD;
	Fri, 13 Mar 2020 14:08:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA47BC089F;
	Fri, 13 Mar 2020 14:08:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2572C0177
 for <iommu@lists.linux-foundation.org>; Fri, 13 Mar 2020 14:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 953F086D03
 for <iommu@lists.linux-foundation.org>; Fri, 13 Mar 2020 14:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OF6--D0rAQFj for <iommu@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 14:08:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id CC45A86C53
 for <iommu@lists.linux-foundation.org>; Fri, 13 Mar 2020 14:08:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DD3030E;
 Fri, 13 Mar 2020 07:08:56 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15E5C3F67D;
 Fri, 13 Mar 2020 07:08:54 -0700 (PDT)
Subject: Re: [RFC PATCH] vfio: Ignore -ENODEV when getting MSI cookie
To: Andre Przywara <andre.przywara@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Will Deacon <will@kernel.org>
References: <20200312181950.60664-1-andre.przywara@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c9e00735-9673-2016-b274-d5290b648a06@arm.com>
Date: Fri, 13 Mar 2020 14:08:47 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312181950.60664-1-andre.przywara@arm.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On 2020-03-12 6:19 pm, Andre Przywara wrote:
> When we try to get an MSI cookie for a VFIO device, that can fail if
> CONFIG_IOMMU_DMA is not set. In this case iommu_get_msi_cookie() returns
> -ENODEV, and that should not be fatal.
> 
> Ignore that case and proceed with the initialisation.
> 
> This fixes VFIO with a platform device on the Calxeda Midway (no MSIs).
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
> 
> not sure this is the right fix, or we should rather check if the
> platform doesn't support MSIs at all (which doesn't seem to be easy
> to do).
> Or is this because arm-smmu.c always reserves an IOMMU_RESV_SW_MSI
> region?

Both, really - ideally VFIO should be able to skip all MSI_related setup 
if the system doesn't support MSIs, but equally the SMMU drivers would 
also ideally not expose a pointless SW_MSI region in the same situation.

In lieu of a 'nice' way of acheiving that, I think this patch seems 
reasonable - ENODEV doesn't clash with any real error that can occur 
when iommu-dma is present, and carrying on without a cookie should be 
fine since the MSI hooks that would otherwise dereference it will also 
be no-ops.

Perhaps it might be worth a comment to clarify that this is specifically 
to allow vfio-platform to work with iommu-dma disabled, but either way,

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Also this seems to be long broken, actually since Eric introduced MSI
> support in 4.10-rc3, but at least since the initialisation order was
> fixed with f6810c15cf9.

I'm sure the entire Midway userbase have been up-in-arms the whole 
time... :P

Robin.

> 
> Grateful for any insight.
> 
> Cheers,
> Andre
> 
>   drivers/vfio/vfio_iommu_type1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index a177bf2c6683..467e217ef09a 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -1786,7 +1786,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>   
>   	if (resv_msi) {
>   		ret = iommu_get_msi_cookie(domain->domain, resv_msi_base);
> -		if (ret)
> +		if (ret && ret != -ENODEV)
>   			goto out_detach;
>   	}
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
