Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1162029B
	for <lists.iommu@lfdr.de>; Thu, 16 May 2019 11:33:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 97422C2A;
	Thu, 16 May 2019 09:32:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8C682B4B
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 09:32:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0911F87C
	for <iommu@lists.linux-foundation.org>;
	Thu, 16 May 2019 09:32:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 384CA99DDC;
	Thu, 16 May 2019 09:32:57 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 472994D748;
	Thu, 16 May 2019 09:32:52 +0000 (UTC)
Subject: Re: [PATCH v2 6/7] iommu: Introduce IOMMU_RESV_DIRECT_RELAXABLE
	reserved memory regions
To: eric.auger.pro@gmail.com, joro@8bytes.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	dwmw2@infradead.org, lorenzo.pieralisi@arm.com, robin.murphy@arm.com,
	will.deacon@arm.com, hanjun.guo@linaro.org, sudeep.holla@arm.com
References: <20190516084720.10498-1-eric.auger@redhat.com>
	<20190516084720.10498-7-eric.auger@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ab29565f-d601-8974-51e7-2b6c9982c21d@redhat.com>
Date: Thu, 16 May 2019 11:32:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190516084720.10498-7-eric.auger@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 16 May 2019 09:32:57 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi

On 5/16/19 10:47 AM, Eric Auger wrote:
> Introduce a new type for reserved region. This corresponds
> to directly mapped regions which are known to be relaxable
> in some specific conditions, such as device assignment use
> case. Well known examples are those used by USB controllers
> providing PS/2 keyboard emulation for pre-boot BIOS and
> early BOOT or RMRRs associated to IGD working in legacy mode.
> 
> Since commit c875d2c1b808 ("iommu/vt-d: Exclude devices using RMRRs
> from IOMMU API domains") and commit 18436afdc11a ("iommu/vt-d: Allow
> RMRR on graphics devices too"), those regions are currently
> considered "safe" with respect to device assignment use case
> which requires a non direct mapping at IOMMU physical level
> (RAM GPA -> HPA mapping).
> 
> Those RMRRs currently exist and sometimes the device is
> attempting to access it but this has not been considered
> an issue until now.
> 
> However at the moment, iommu_get_group_resv_regions() is
> not able to make any difference between directly mapped
> regions: those which must be absolutely enforced and those
> like above ones which are known as relaxable.
> 
> This is a blocker for reporting severe conflicts between
> non relaxable RMRRs (like MSI doorbells) and guest GPA space.
> 
> With this new reserved region type we will be able to use
> iommu_get_group_resv_regions() to enumerate the IOVA space
> that is usable through the IOMMU API without introducing
> regressions with respect to existing device assignment
> use cases (USB and IGD).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> Note: At the moment the sysfs ABI is not changed. However I wonder
> whether it wouldn't be preferable to report the direct region as
> "direct_relaxed" there. At the moment, in case the same direct
> region is used by 2 devices, one USB/GFX and another not belonging
> to the previous categories, the direct region will be output twice
> with "direct" type.
> 
> This would unblock Shameer's series:
> [PATCH v6 0/7] vfio/type1: Add support for valid iova list management
> https://patchwork.kernel.org/patch/10425309/
> 
> which failed to get pulled for 4.18 merge window due to IGD
> device assignment regression.
> ---
>  drivers/iommu/iommu.c | 12 +++++++-----
>  include/linux/iommu.h |  6 ++++++
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index ae4ea5c0e6f9..84dcb6af6511 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -73,10 +73,11 @@ struct iommu_group_attribute {
>  };
>  
>  static const char * const iommu_group_resv_type_string[] = {
> -	[IOMMU_RESV_DIRECT]	= "direct",
> -	[IOMMU_RESV_RESERVED]	= "reserved",
> -	[IOMMU_RESV_MSI]	= "msi",
> -	[IOMMU_RESV_SW_MSI]	= "msi",
> +	[IOMMU_RESV_DIRECT]			= "direct",
> +	[IOMMU_RESV_DIRECT_RELAXABLE]		= "direct",
> +	[IOMMU_RESV_RESERVED]			= "reserved",
> +	[IOMMU_RESV_MSI]			= "msi",
> +	[IOMMU_RESV_SW_MSI]			= "msi",
>  };
>  
>  #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
> @@ -573,7 +574,8 @@ static int iommu_group_create_direct_mappings(struct iommu_group *group,
>  		start = ALIGN(entry->start, pg_size);
>  		end   = ALIGN(entry->start + entry->length, pg_size);
>  
> -		if (entry->type != IOMMU_RESV_DIRECT)
> +		if (entry->type != IOMMU_RESV_DIRECT ||
It must be a "&&" and not "||"

Respinning ...

Eric

> +		    entry->type != IOMMU_RESV_DIRECT_RELAXABLE)
>  			continue;
>  
>  		for (addr = start; addr < end; addr += pg_size) {
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index ba91666998fb..14a521f85f14 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -135,6 +135,12 @@ enum iommu_attr {
>  enum iommu_resv_type {
>  	/* Memory regions which must be mapped 1:1 at all times */
>  	IOMMU_RESV_DIRECT,
> +	/*
> +	 * Memory regions which are advertised to be 1:1 but are
> +	 * commonly considered relaxable in some conditions,
> +	 * for instance in device assignment use case (USB, Graphics)
> +	 */
> +	IOMMU_RESV_DIRECT_RELAXABLE,
>  	/* Arbitrary "never map this or give it to a device" address ranges */
>  	IOMMU_RESV_RESERVED,
>  	/* Hardware MSI region (untranslated) */
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
