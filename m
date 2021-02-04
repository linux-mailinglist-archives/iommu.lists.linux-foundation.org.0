Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB5530BEE6
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 13:59:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D66D52042C;
	Tue,  2 Feb 2021 12:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2O2ovH+oHpe; Tue,  2 Feb 2021 12:59:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 63E6A203E4;
	Tue,  2 Feb 2021 12:59:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58739C013A;
	Tue,  2 Feb 2021 12:59:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7221BC013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 12:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6D4C586C7A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 12:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ad1iMZzhVLcI for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 12:58:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id DD2D986C66
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 12:58:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 442C81FB;
 Tue,  2 Feb 2021 04:58:59 -0800 (PST)
Received: from [10.57.35.163] (unknown [10.57.35.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC6083F718;
 Tue,  2 Feb 2021 04:58:57 -0800 (PST)
Subject: Re: [PATCH] iommu: Update the document of IOMMU_DOMAIN_UNMANAGED
To: Keqian Zhu <zhukeqian1@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org
References: <20210202085330.31716-1-zhukeqian1@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8eac9259-66e5-9b83-39a9-46a86097d450@arm.com>
Date: Tue, 2 Feb 2021 12:58:56 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202085330.31716-1-zhukeqian1@huawei.com>
Content-Language: en-GB
Cc: Marc Zyngier <maz@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 jiangkunkun@huawei.com, Will Deacon <will@kernel.org>,
 wanghaibin.wang@huawei.com
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

On 2021-02-02 08:53, Keqian Zhu wrote:
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>   include/linux/iommu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 77e561ed57fd..e8f2efae212b 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -68,7 +68,7 @@ struct iommu_domain_geometry {
>    *				  devices
>    *	IOMMU_DOMAIN_IDENTITY	- DMA addresses are system physical addresses
>    *	IOMMU_DOMAIN_UNMANAGED	- DMA mappings managed by IOMMU-API user, used
> - *				  for VMs
> + *				  for VMs or userspace driver frameworks

Given that "VMs" effectively has to mean VFIO, doesn't it effectively 
already imply other uses of VFIO anyway? Unmanaged domains are also used 
in other subsystems/drivers inside the kernel and we're not naming 
those, so I don't see that it's particularly helpful to specifically 
call out one more VFIO use-case.

Perhaps the current wording could be generalised a little more, but we 
certainly don't want to start trying to maintain an exhaustive list of 
users here...

Robin.

>    *	IOMMU_DOMAIN_DMA	- Internally used for DMA-API implementations.
>    *				  This flag allows IOMMU drivers to implement
>    *				  certain optimizations for these domains
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
