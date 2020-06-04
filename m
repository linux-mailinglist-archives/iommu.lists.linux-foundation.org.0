Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F61EE176
	for <lists.iommu@lfdr.de>; Thu,  4 Jun 2020 11:39:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E8C4C23A53;
	Thu,  4 Jun 2020 09:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zGZwlwoMS1s; Thu,  4 Jun 2020 09:39:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F41C12381E;
	Thu,  4 Jun 2020 09:39:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAEA2C016E;
	Thu,  4 Jun 2020 09:39:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5013C016E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 09:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BB302887FC
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 09:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SxBP6J4lgJyD for <iommu@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 09:39:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 782CC887F9
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 09:39:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7562426F; Thu,  4 Jun 2020 11:39:38 +0200 (CEST)
Date: Thu, 4 Jun 2020 11:39:36 +0200
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Jerry Snitselaar <jsnitsel@redhat.com>, Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH] iommu: Check for deferred attach in
 iommu_group_do_dma_attach()
Message-ID: <20200604093936.GK14598@8bytes.org>
References: <20200604091944.26402-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604091944.26402-1-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Jun 04, 2020 at 11:19:44AM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The iommu_group_do_dma_attach() must not attach devices which have
> deferred_attach set. Otherwise devices could cause IOMMU faults when
> re-initialized in a kdump kernel.
> 
> Fixes: deac0b3bed26 ("iommu: Split off default domain allocation from group assignment")
> Reported-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Tested-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/iommu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index b5ea203f6c68..5a6d509f72b6 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1680,8 +1680,12 @@ static void probe_alloc_default_domain(struct bus_type *bus,
>  static int iommu_group_do_dma_attach(struct device *dev, void *data)
>  {
>  	struct iommu_domain *domain = data;
> +	int ret = 0;
>  
> -	return __iommu_attach_device(domain, dev);
> +	if (!iommu_is_attach_deferred(group->domain, dev))
> +		ret = __iommu_attach_device(group->domain, dev);

And of course with the same bug as my original diff. Fixed that up
before applying it. (group->domain -> domain).


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
