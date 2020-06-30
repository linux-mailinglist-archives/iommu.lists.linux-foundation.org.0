Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562320F1A2
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 11:30:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3246987C42;
	Tue, 30 Jun 2020 09:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4kiLxHvkmMU; Tue, 30 Jun 2020 09:30:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AC71687D69;
	Tue, 30 Jun 2020 09:30:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97EF9C016E;
	Tue, 30 Jun 2020 09:30:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9C01C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 97E7387D5C
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d0mHe5st+4zr for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 09:30:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3BB7F87C42
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 09:30:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 2EEDB26B; Tue, 30 Jun 2020 11:30:41 +0200 (CEST)
Date: Tue, 30 Jun 2020 11:30:39 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sebastian Ott <sebott@amazon.de>
Subject: Re: [PATCH 3/3] iommu/amd: Actually enforce geometry aperture
Message-ID: <20200630093039.GC28824@8bytes.org>
References: <20200605145655.13639-1-sebott@amazon.de>
 <20200605145655.13639-4-sebott@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605145655.13639-4-sebott@amazon.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Benjamin Serebrin <serebrin@amazon.com>, Filippo Sironi <sironi@amazon.de>,
 iommu@lists.linux-foundation.org
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

Hi Sebastian,

On Fri, Jun 05, 2020 at 04:56:55PM +0200, Sebastian Ott wrote:
> Add a check to enforce that I/O virtual addresses picked by iommu API
> users stay within the domains geometry aperture.
> 
> Signed-off-by: Sebastian Ott <sebott@amazon.de>
> ---
>  drivers/iommu/amd_iommu.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index d2e79e27778e..6485e2081706 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -2618,6 +2618,11 @@ static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
>  	if (pgtable.mode == PAGE_MODE_NONE)
>  		return -EINVAL;
>  
> +	if (dom->geometry.force_aperture &&
> +	    (iova < dom->geometry.aperture_start ||
> +	     iova + page_size - 1 > dom->geometry.aperture_end))
> +		return -EINVAL;
> +
>  	if (iommu_prot & IOMMU_READ)
>  		prot |= IOMMU_PROT_IR;
>  	if (iommu_prot & IOMMU_WRITE)

This patch need also make iommu_setup_dma_ops() aware of the aperture
limits.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
