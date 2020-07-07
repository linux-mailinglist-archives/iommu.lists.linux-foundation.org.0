Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5A216BA5
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 13:34:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6E9D2252CF;
	Tue,  7 Jul 2020 11:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xtqXD0U0lXZ; Tue,  7 Jul 2020 11:34:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 73728263A6;
	Tue,  7 Jul 2020 11:34:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59440C016F;
	Tue,  7 Jul 2020 11:34:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 334E8C016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 11:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1BB5C84F6F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 11:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idoxA-luVqI8 for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 11:34:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id BBA2784AAD
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 11:34:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 155AC1FB;
 Tue,  7 Jul 2020 04:34:29 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 842DE3F71E;
 Tue,  7 Jul 2020 04:34:27 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] iommu/io-pgtable: Allow a pgtable implementation
 to skip TLB operations
To: Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-3-jcrouse@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <99ecd948-7476-b9b4-12b4-1ced0084654f@arm.com>
Date: Tue, 7 Jul 2020 12:34:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200626200414.14382-3-jcrouse@codeaurora.org>
Content-Language: en-GB
Cc: Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 John Stultz <john.stultz@linaro.org>, freedreno@lists.freedesktop.org
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

On 2020-06-26 21:04, Jordan Crouse wrote:
> Allow a io-pgtable implementation to skip TLB operations by checking for
> NULL pointers in the helper functions. It will be up to to the owner
> of the io-pgtable instance to make sure that they independently handle
> the TLB correctly.

I don't really understand what this is for - tricking the IOMMU driver 
into not performing its TLB maintenance at points when that maintenance 
has been deemed necessary doesn't seem like the appropriate way to 
achieve anything good :/

Robin.

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>   include/linux/io-pgtable.h | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 53d53c6c2be9..bbed1d3925ba 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -210,21 +210,24 @@ struct io_pgtable {
>   
>   static inline void io_pgtable_tlb_flush_all(struct io_pgtable *iop)
>   {
> -	iop->cfg.tlb->tlb_flush_all(iop->cookie);
> +	if (iop->cfg.tlb)
> +		iop->cfg.tlb->tlb_flush_all(iop->cookie);
>   }
>   
>   static inline void
>   io_pgtable_tlb_flush_walk(struct io_pgtable *iop, unsigned long iova,
>   			  size_t size, size_t granule)
>   {
> -	iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
> +	if (iop->cfg.tlb)
> +		iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
>   }
>   
>   static inline void
>   io_pgtable_tlb_flush_leaf(struct io_pgtable *iop, unsigned long iova,
>   			  size_t size, size_t granule)
>   {
> -	iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
> +	if (iop->cfg.tlb)
> +		iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
>   }
>   
>   static inline void
> @@ -232,7 +235,7 @@ io_pgtable_tlb_add_page(struct io_pgtable *iop,
>   			struct iommu_iotlb_gather * gather, unsigned long iova,
>   			size_t granule)
>   {
> -	if (iop->cfg.tlb->tlb_add_page)
> +	if (iop->cfg.tlb && iop->cfg.tlb->tlb_add_page)
>   		iop->cfg.tlb->tlb_add_page(gather, iova, granule, iop->cookie);
>   }
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
