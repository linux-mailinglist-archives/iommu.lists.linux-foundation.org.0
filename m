Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 199AE1C116E
	for <lists.iommu@lfdr.de>; Fri,  1 May 2020 13:22:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7D37A88CD7;
	Fri,  1 May 2020 11:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hnROaycnDBy; Fri,  1 May 2020 11:22:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5B20188CE1;
	Fri,  1 May 2020 11:22:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 410ADC016F;
	Fri,  1 May 2020 11:22:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 436D1C016F
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 385608AB9A
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1C1vJIR-hbGJ for <iommu@lists.linux-foundation.org>;
 Fri,  1 May 2020 11:22:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D1647893F6
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:22:02 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5836A3A4; Fri,  1 May 2020 13:22:00 +0200 (CEST)
Date: Fri, 1 May 2020 13:21:57 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH] iommu/amd: Fix legacy interrupt remapping for
 x2APIC-enabled system
Message-ID: <20200501112157.GA18423@8bytes.org>
References: <1587562202-14183-1-git-send-email-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587562202-14183-1-git-send-email-suravee.suthikulpanit@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, jon.grimm@amd.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Apr 22, 2020 at 08:30:02AM -0500, Suravee Suthikulpanit wrote:
> Currently, system fails to boot because the legacy interrupt remapping
> mode does not enable 128-bit IRTE (GA), which is required for x2APIC
> support.
> 
> Fix by using AMD_IOMMU_GUEST_IR_LEGACY_GA mode when booting with
> kernel option amd_iommu_intr=legacy instead. The initialization
> logic will check GASup and automatically fallback to using
> AMD_IOMMU_GUEST_IR_LEGACY if GA mode is not supported.
> 
> Fixes: 3928aa3f5775 ("iommu/amd: Detect and enable guest vAPIC support")
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> ---
>  drivers/iommu/amd_iommu_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for v5.7, thanks Suravee.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
