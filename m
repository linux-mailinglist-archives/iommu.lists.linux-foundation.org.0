Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4698934091E
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 16:45:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA8D743291;
	Thu, 18 Mar 2021 15:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2JZ5F1AM4A7; Thu, 18 Mar 2021 15:44:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FB3F43298;
	Thu, 18 Mar 2021 15:44:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCC7BC0010;
	Thu, 18 Mar 2021 15:44:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ABBEC0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 15:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0458E605CD
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 15:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eu8Aiz_GxQeM for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 15:44:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C085605AF
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 15:44:57 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 80F502DA; Thu, 18 Mar 2021 16:44:54 +0100 (CET)
Date: Thu, 18 Mar 2021 16:44:49 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH 7/7] iommu/amd: Add support for using AMD IOMMU v2
 page table for DMA-API
Message-ID: <YFN1cdOrH7v81CJt@8bytes.org>
References: <20210312090411.6030-1-suravee.suthikulpanit@amd.com>
 <20210312090411.6030-8-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312090411.6030-8-suravee.suthikulpanit@amd.com>
Cc: iommu@lists.linux-foundation.org, Jon.Grimm@amd.com,
 linux-kernel@vger.kernel.org, Wei.Huang2@amd.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Mar 12, 2021 at 03:04:11AM -0600, Suravee Suthikulpanit wrote:
> Introduce init function for setting up DMA domain for DMA-API with
> the IOMMU v2 page table.
> 
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> ---
>  drivers/iommu/amd/iommu.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index e29ece6e1e68..bd26de8764bd 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -1937,6 +1937,24 @@ static int protection_domain_init_v1(struct protection_domain *domain, int mode)
>  	return 0;
>  }
>  
> +static int protection_domain_init_v2(struct protection_domain *domain)
> +{
> +	spin_lock_init(&domain->lock);
> +	domain->id = domain_id_alloc();
> +	if (!domain->id)
> +		return -ENOMEM;
> +	INIT_LIST_HEAD(&domain->dev_list);
> +
> +	domain->giov = true;
> +
> +	if (amd_iommu_pgtable == AMD_IOMMU_V2 &&
> +	    domain_enable_v2(domain, 1, false)) {
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +

You also need to advertise a different aperture size and a different
pgsize-bitmap. The host page-table can only map a 48 bit address space,
not a 64 bit one like with v1 page-tables.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
