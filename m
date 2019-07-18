Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2966F6D72A
	for <lists.iommu@lfdr.de>; Fri, 19 Jul 2019 01:16:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AD2C2182B;
	Thu, 18 Jul 2019 23:16:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 37E5D16B5
	for <iommu@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 23:16:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9E4A2756
	for <iommu@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 23:16:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBE04300CA4E;
	Thu, 18 Jul 2019 23:16:16 +0000 (UTC)
Received: from x1.home (ovpn-116-35.phx2.redhat.com [10.3.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 213461001B35;
	Thu, 18 Jul 2019 23:16:16 +0000 (UTC)
Date: Thu, 18 Jul 2019 17:16:15 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 7/7] iommu/vt-d: Consolidate domain_init() to avoid
	duplication
Message-ID: <20190718171615.2ed56280@x1.home>
In-Reply-To: <20190612002851.17103-8-baolu.lu@linux.intel.com>
References: <20190612002851.17103-1-baolu.lu@linux.intel.com>
	<20190612002851.17103-8-baolu.lu@linux.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 18 Jul 2019 23:16:17 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
	David Woodhouse <dwmw2@infradead.org>
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

On Wed, 12 Jun 2019 08:28:51 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> The domain_init() and md_domain_init() do almost the same job.
> Consolidate them to avoid duplication.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel-iommu.c | 123 +++++++++++-------------------------
>  1 file changed, 36 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 5215dcd535a1..b8c6cf1d5f90 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -1825,63 +1825,6 @@ static inline int guestwidth_to_adjustwidth(int gaw)
>  	return agaw;
>  }
>  
> -static int domain_init(struct dmar_domain *domain, struct intel_iommu *iommu,
> -		       int guest_width)
> -{
> -	int adjust_width, agaw;
> -	unsigned long sagaw;
> -	int err;
> -
> -	init_iova_domain(&domain->iovad, VTD_PAGE_SIZE, IOVA_START_PFN);
> -
> -	err = init_iova_flush_queue(&domain->iovad,
> -				    iommu_flush_iova, iova_entry_free);
> -	if (err)
> -		return err;
> -
> -	domain_reserve_special_ranges(domain);
> -
> -	/* calculate AGAW */
> -	if (guest_width > cap_mgaw(iommu->cap))
> -		guest_width = cap_mgaw(iommu->cap);
> -	domain->gaw = guest_width;
> -	adjust_width = guestwidth_to_adjustwidth(guest_width);
> -	agaw = width_to_agaw(adjust_width);
> -	sagaw = cap_sagaw(iommu->cap);
> -	if (!test_bit(agaw, &sagaw)) {
> -		/* hardware doesn't support it, choose a bigger one */
> -		pr_debug("Hardware doesn't support agaw %d\n", agaw);
> -		agaw = find_next_bit(&sagaw, 5, agaw);
> -		if (agaw >= 5)
> -			return -ENODEV;
> -	}
> -	domain->agaw = agaw;
> -
> -	if (ecap_coherent(iommu->ecap))
> -		domain->iommu_coherency = 1;
> -	else
> -		domain->iommu_coherency = 0;
> -
> -	if (ecap_sc_support(iommu->ecap))
> -		domain->iommu_snooping = 1;
> -	else
> -		domain->iommu_snooping = 0;
> -
> -	if (intel_iommu_superpage)
> -		domain->iommu_superpage = fls(cap_super_page_val(iommu->cap));
> -	else
> -		domain->iommu_superpage = 0;
> -
> -	domain->nid = iommu->node;
> -
> -	/* always allocate the top pgd */
> -	domain->pgd = (struct dma_pte *)alloc_pgtable_page(domain->nid);
> -	if (!domain->pgd)
> -		return -ENOMEM;
> -	__iommu_flush_cache(iommu, domain->pgd, PAGE_SIZE);
> -	return 0;
> -}
> -
>  static void domain_exit(struct dmar_domain *domain)
>  {
>  	struct page *freelist;
> @@ -2563,6 +2506,31 @@ static int get_last_alias(struct pci_dev *pdev, u16 alias, void *opaque)
>  	return 0;
>  }
>  
> +static int domain_init(struct dmar_domain *domain, int guest_width)
> +{
> +	int adjust_width;
> +
> +	init_iova_domain(&domain->iovad, VTD_PAGE_SIZE, IOVA_START_PFN);
> +	domain_reserve_special_ranges(domain);
> +
> +	/* calculate AGAW */
> +	domain->gaw = guest_width;
> +	adjust_width = guestwidth_to_adjustwidth(guest_width);
> +	domain->agaw = width_to_agaw(adjust_width);


How do we justify that domain->agaw is nothing like it was previously
here?  I spent some more time working on the failure to boot that I
thought was caused by 4ec066c7b147, but there are so many breakages and
fixes in Joerg's x86/vt-d branch that I think my bisect zero'd in on
the wrong one.  Instead I cherry-picked every commit from Joerg's tree
and matched Fixes patches to their original commit, which led me to
this patch, mainline commit 123b2ffc376e.  The issue I'm seeing is that
we call domain_context_mapping_one() and we are in this section:

        struct dma_pte *pgd = domain->pgd;
        int agaw;

        context_set_domain_id(context, did);

        if (translation != CONTEXT_TT_PASS_THROUGH) {
                /*
                 * Skip top levels of page tables for iommu which has
                 * less agaw than default. Unnecessary for PT mode.
                 */
                for (agaw = domain->agaw; agaw > iommu->agaw; agaw--) {
                        ret = -ENOMEM;
                        pgd = phys_to_virt(dma_pte_addr(pgd));
                        if (!dma_pte_present(pgd))
                                goto out_unlock;
                }

Prior to this commit, we had domain->agaw=1 and iommu->agaw=1, so we
don't enter the loop.  With this commit, we have domain->agaw=3,
iommu->agaw=1 with pgd->val=0!

I don't really follow how the setting of these fields above is
equivalent to what they were previously or if they're supposed to be
updated lazily, but the current behavior is non-functional.  Commit
123b2ffc376e can be reverted with only a bit of offset, which brings
Linus' tree back into working operation for me.  Should we revert or is
there an obvious fix here?  Thanks,

Alex
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
