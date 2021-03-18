Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA034030A
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 11:21:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74CCE606A5;
	Thu, 18 Mar 2021 10:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJ70uuewYCEs; Thu, 18 Mar 2021 10:21:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 802246001E;
	Thu, 18 Mar 2021 10:21:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58C1FC0010;
	Thu, 18 Mar 2021 10:21:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B861C0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 10:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 121E483E9F
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 10:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYmMGKULEy7i for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:21:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1817F83CE6
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 10:21:16 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 084412D8; Thu, 18 Mar 2021 11:21:13 +0100 (CET)
Date: Thu, 18 Mar 2021 11:21:12 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Fix lockdep splat in
 intel_pasid_get_entry()
Message-ID: <YFMpmLNd73IVcgWq@8bytes.org>
References: <20210317005834.173503-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317005834.173503-1-baolu.lu@linux.intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
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

On Wed, Mar 17, 2021 at 08:58:34AM +0800, Lu Baolu wrote:
> The pasid_lock is used to synchronize different threads from modifying a
> same pasid directory entry at the same time. It causes below lockdep splat.
> 
> [   83.296538] ========================================================
> [   83.296538] WARNING: possible irq lock inversion dependency detected
> [   83.296539] 5.12.0-rc3+ #25 Tainted: G        W
> [   83.296539] --------------------------------------------------------
> [   83.296540] bash/780 just changed the state of lock:
> [   83.296540] ffffffff82b29c98 (device_domain_lock){..-.}-{2:2}, at:
>            iommu_flush_dev_iotlb.part.0+0x32/0x110
> [   83.296547] but this lock took another, SOFTIRQ-unsafe lock in the past:
> [   83.296547]  (pasid_lock){+.+.}-{2:2}
> [   83.296548]
> 
>            and interrupts could create inverse lock ordering between them.
> 
> [   83.296549] other info that might help us debug this:
> [   83.296549] Chain exists of:
>                  device_domain_lock --> &iommu->lock --> pasid_lock
> [   83.296551]  Possible interrupt unsafe locking scenario:
> 
> [   83.296551]        CPU0                    CPU1
> [   83.296552]        ----                    ----
> [   83.296552]   lock(pasid_lock);
> [   83.296553]                                local_irq_disable();
> [   83.296553]                                lock(device_domain_lock);
> [   83.296554]                                lock(&iommu->lock);
> [   83.296554]   <Interrupt>
> [   83.296554]     lock(device_domain_lock);
> [   83.296555]
>                 *** DEADLOCK ***
> 
> Fix it by replacing the pasid_lock with an atomic exchange operation.
> 
> Reported-and-tested-by: Dave Jiang <dave.jiang@intel.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/pasid.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
> index 9fb3d3e80408..1ddcb8295f72 100644
> --- a/drivers/iommu/intel/pasid.c
> +++ b/drivers/iommu/intel/pasid.c
> @@ -24,7 +24,6 @@
>  /*
>   * Intel IOMMU system wide PASID name space:
>   */
> -static DEFINE_SPINLOCK(pasid_lock);
>  u32 intel_pasid_max_id = PASID_MAX;
>  
>  int vcmd_alloc_pasid(struct intel_iommu *iommu, u32 *pasid)
> @@ -259,19 +258,18 @@ struct pasid_entry *intel_pasid_get_entry(struct device *dev, u32 pasid)
>  	dir_index = pasid >> PASID_PDE_SHIFT;
>  	index = pasid & PASID_PTE_MASK;
>  
> -	spin_lock(&pasid_lock);
>  	entries = get_pasid_table_from_pde(&dir[dir_index]);
>  	if (!entries) {
>  		entries = alloc_pgtable_page(info->iommu->node);
> -		if (!entries) {
> -			spin_unlock(&pasid_lock);
> +		if (!entries)
>  			return NULL;
> -		}
>  
> -		WRITE_ONCE(dir[dir_index].val,
> -			   (u64)virt_to_phys(entries) | PASID_PTE_PRESENT);
> +		if (cmpxchg64(&dir[dir_index].val, 0ULL,
> +			      (u64)virt_to_phys(entries) | PASID_PTE_PRESENT)) {
> +			free_pgtable_page(entries);
> +			entries = get_pasid_table_from_pde(&dir[dir_index]);

This is racy, someone could have already cleared the pasid-entry again.
What you need to do here is to retry the whole path by adding a goto
to before  the first get_pasid_table_from_pde() call.

Btw, what makes sure that the pasid_entry does not go away when it is
returned here?

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
