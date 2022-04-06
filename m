Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 411614F6400
	for <lists.iommu@lfdr.de>; Wed,  6 Apr 2022 17:53:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF7AD40621;
	Wed,  6 Apr 2022 15:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kOTgLBYI7OR; Wed,  6 Apr 2022 15:53:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 030574061F;
	Wed,  6 Apr 2022 15:53:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D11D2C0082;
	Wed,  6 Apr 2022 15:53:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0C04C0012
 for <iommu@lists.linux-foundation.org>; Wed,  6 Apr 2022 15:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A5E260ED2
 for <iommu@lists.linux-foundation.org>; Wed,  6 Apr 2022 15:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axsJfw7WhIeB for <iommu@lists.linux-foundation.org>;
 Wed,  6 Apr 2022 15:53:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id B371560ECB
 for <iommu@lists.linux-foundation.org>; Wed,  6 Apr 2022 15:53:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 069AC12FC;
 Wed,  6 Apr 2022 08:53:10 -0700 (PDT)
Received: from lpieralisi (unknown [10.57.21.160])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5D073F73B;
 Wed,  6 Apr 2022 08:53:07 -0700 (PDT)
Date: Wed, 6 Apr 2022 16:53:08 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v9 01/11] ACPI/IORT: Add temporary RMR node flag
 definitions
Message-ID: <20220406155308.GD27518@lpieralisi>
References: <20220404124209.1086-1-shameerali.kolothum.thodi@huawei.com>
 <20220404124209.1086-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220404124209.1086-2-shameerali.kolothum.thodi@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: will@kernel.org, jon@solid-run.com, linuxarm@huawei.com,
 steven.price@arm.com, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, wanghuiqiang@huawei.com,
 guohanjun@huawei.com, yangyicong@huawei.com, Sami.Mujawar@arm.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

On Mon, Apr 04, 2022 at 01:41:59PM +0100, Shameer Kolothum wrote:
> IORT rev E.d introduces more details into the RMR node Flags
> field. Add temporary definitions to describe and access these
> Flags field until ACPICA header is updated to support E.d.
> 
> This patch can be reverted once the include/acpi/actbl2.h has
> all the relevant definitions.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> Please find the ACPICA E.d related changes pull request here,
> https://github.com/acpica/acpica/pull/765
> 
> This is now merged to acpica:master.

I assume we can drop this patch when ACPICA Linuxized patches hit
Rafael's tree.

> ---
>  drivers/acpi/arm64/iort.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index f2f8f05662de..fd06cf43ba31 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -25,6 +25,30 @@
>  #define IORT_IOMMU_TYPE		((1 << ACPI_IORT_NODE_SMMU) |	\
>  				(1 << ACPI_IORT_NODE_SMMU_V3))
>  
> +/*
> + * The following RMR related definitions are temporary and
> + * can be removed once ACPICA headers support IORT rev E.d
> + */
> +#ifndef ACPI_IORT_RMR_REMAP_PERMITTED
> +#define ACPI_IORT_RMR_REMAP_PERMITTED	(1)
> +#endif
> +
> +#ifndef ACPI_IORT_RMR_ACCESS_PRIVILEGE
> +#define ACPI_IORT_RMR_ACCESS_PRIVILEGE	(1 << 1)
> +#endif
> +
> +#ifndef ACPI_IORT_RMR_ACCESS_ATTRIBUTES
> +#define ACPI_IORT_RMR_ACCESS_ATTRIBUTES(flags)	(((flags) >> 2) & 0xFF)
> +#endif
> +
> +#ifndef ACPI_IORT_RMR_ATTR_DEVICE_GRE
> +#define ACPI_IORT_RMR_ATTR_DEVICE_GRE	0x03
> +#endif
> +
> +#ifndef ACPI_IORT_RMR_ATTR_NORMAL_IWB_OWB
> +#define ACPI_IORT_RMR_ATTR_NORMAL_IWB_OWB	0x05
> +#endif
> +
>  struct iort_its_msi_chip {
>  	struct list_head	list;
>  	struct fwnode_handle	*fw_node;
> -- 
> 2.25.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
