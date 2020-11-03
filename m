Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 149282A4621
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 14:21:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD048860DE;
	Tue,  3 Nov 2020 13:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMFGAm2WyLOU; Tue,  3 Nov 2020 13:21:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA5E7860D2;
	Tue,  3 Nov 2020 13:21:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB049C0051;
	Tue,  3 Nov 2020 13:21:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C66B5C0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 13:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ADA9187243
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 13:21:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMSNtFVhJQMn for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 13:21:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 11F738723C
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 13:21:37 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 517183A5; Tue,  3 Nov 2020 14:21:35 +0100 (CET)
Date: Tue, 3 Nov 2020 14:21:34 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH] iommu/amd: Increase interrupt remapping table limit to
 512 entries
Message-ID: <20201103132133.GF22888@8bytes.org>
References: <20201015025002.87997-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015025002.87997-1-suravee.suthikulpanit@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Thu, Oct 15, 2020 at 02:50:02AM +0000, Suravee Suthikulpanit wrote:
> Certain device drivers allocate IO queues on a per-cpu basis.
> On AMD EPYC platform, which can support up-to 256 cpu threads,
> this can exceed the current MAX_IRQ_PER_TABLE limit of 256,
> and result in the error message:
> 
>     AMD-Vi: Failed to allocate IRTE
> 
> This has been observed with certain NVME devices.
> 
> AMD IOMMU hardware can actually support upto 512 interrupt
> remapping table entries. Therefore, update the driver to
> match the hardware limit.
> 
> Please note that this also increases the size of interrupt remapping
> table to 8KB per device when using the 128-bit IRTE format.
> 
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> ---
>  drivers/iommu/amd/amd_iommu_types.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied for 5.10, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
