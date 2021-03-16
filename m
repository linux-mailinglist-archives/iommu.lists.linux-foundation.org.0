Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CF39D33D4AD
	for <lists.iommu@lfdr.de>; Tue, 16 Mar 2021 14:16:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C18960600;
	Tue, 16 Mar 2021 13:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u54OcxSARvbF; Tue, 16 Mar 2021 13:16:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A5560615;
	Tue, 16 Mar 2021 13:16:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74E73C000A;
	Tue, 16 Mar 2021 13:16:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1D79C000A
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 13:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9377D4EC86
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 13:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Km81TG3-cCzY for <iommu@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 13:16:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B16EF4EC83
 for <iommu@lists.linux-foundation.org>; Tue, 16 Mar 2021 13:16:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49836AC47;
 Tue, 16 Mar 2021 13:16:36 +0000 (UTC)
Date: Tue, 16 Mar 2021 14:16:34 +0100
From: Joerg Roedel <jroedel@suse.de>
To: Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH] iommu/amd: Fix iommu remap panic while amd_iommu is set
 to disable
Message-ID: <YFCvsort3oZGfDBy@suse.de>
References: <20210311142807.705080-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311142807.705080-1-ray.huang@amd.com>
Cc: Xiaojian Du <xiaojian.du@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, iommu@lists.linux-foundation.org,
 Alex Deucher <alexander.deucher@amd.com>
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

Hi Huang,

On Thu, Mar 11, 2021 at 10:28:07PM +0800, Huang Rui wrote:
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index f0adbc48fd17..a08e885403b7 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -3862,7 +3862,7 @@ static int irq_remapping_select(struct irq_domain *d, struct irq_fwspec *fwspec,
>  	else if (x86_fwspec_is_hpet(fwspec))
>  		devid = get_hpet_devid(fwspec->param[0]);
>  
> -	if (devid < 0)
> +	if (devid < 0 || !amd_iommu_rlookup_table)
>  		return 0;

The problem is deeper than this fix suggests. I prepared other fixes for
this particular problem. Please find them here:

	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-fixes

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
