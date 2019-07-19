Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E506E366
	for <lists.iommu@lfdr.de>; Fri, 19 Jul 2019 11:27:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 991B22426;
	Fri, 19 Jul 2019 09:27:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C26D6220E
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 09:27:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D72E9180
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 09:27:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2019 02:27:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; d="scan'208";a="179575053"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2019 02:27:18 -0700
Subject: Re: [PATCH 1/2] iommu/vt-d: Don't queue_iova() if there is no flush
	queue
To: Dmitry Safonov <dima@arista.com>, linux-kernel@vger.kernel.org
References: <20190716213806.20456-1-dima@arista.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <d22175ca-817a-fa20-cd23-9f8a5ea9b642@linux.intel.com>
Date: Fri, 19 Jul 2019 17:26:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190716213806.20456-1-dima@arista.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Dmitry Safonov <0x7f454c46@gmail.com>, stable@vger.kernel.org,
	iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 7/17/19 5:38 AM, Dmitry Safonov wrote:
> Intel VT-d driver was reworked to use common deferred flushing
> implementation. Previously there was one global per-cpu flush queue,
> afterwards - one per domain.
> 
> Before deferring a flush, the queue should be allocated and initialized.
> 
> Currently only domains with IOMMU_DOMAIN_DMA type initialize their flush
> queue. It's probably worth to init it for static or unmanaged domains
> too, but it may be arguable - I'm leaving it to iommu folks.

We will submit per-device dma ops soon. Then we don't need to call
intel_unmap() for the identity (static) domain. For unmanaged domains,
the map/unmap happen only during VM startup/shutdown, I am not sure
whether it's worth a flush queue.

This fix looks good to me anyway. We should always avoid deferring a
flush if there's no flush queue there.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
Baolu

> 
> Prevent queuing an iova flush if the domain doesn't have a queue.
> The defensive check seems to be worth to keep even if queue would be
> initialized for all kinds of domains. And is easy backportable.
> 
> On 4.19.43 stable kernel it has a user-visible effect: previously for
> devices in si domain there were crashes, on sata devices:
> 
>   BUG: spinlock bad magic on CPU#6, swapper/0/1
>    lock: 0xffff88844f582008, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
>   CPU: 6 PID: 1 Comm: swapper/0 Not tainted 4.19.43 #1
>   Call Trace:
>    <IRQ>
>    dump_stack+0x61/0x7e
>    spin_bug+0x9d/0xa3
>    do_raw_spin_lock+0x22/0x8e
>    _raw_spin_lock_irqsave+0x32/0x3a
>    queue_iova+0x45/0x115
>    intel_unmap+0x107/0x113
>    intel_unmap_sg+0x6b/0x76
>    __ata_qc_complete+0x7f/0x103
>    ata_qc_complete+0x9b/0x26a
>    ata_qc_complete_multiple+0xd0/0xe3
>    ahci_handle_port_interrupt+0x3ee/0x48a
>    ahci_handle_port_intr+0x73/0xa9
>    ahci_single_level_irq_intr+0x40/0x60
>    __handle_irq_event_percpu+0x7f/0x19a
>    handle_irq_event_percpu+0x32/0x72
>    handle_irq_event+0x38/0x56
>    handle_edge_irq+0x102/0x121
>    handle_irq+0x147/0x15c
>    do_IRQ+0x66/0xf2
>    common_interrupt+0xf/0xf
>   RIP: 0010:__do_softirq+0x8c/0x2df
> 
> The same for usb devices that use ehci-pci:
>   BUG: spinlock bad magic on CPU#0, swapper/0/1
>    lock: 0xffff88844f402008, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
>   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.43 #4
>   Call Trace:
>    <IRQ>
>    dump_stack+0x61/0x7e
>    spin_bug+0x9d/0xa3
>    do_raw_spin_lock+0x22/0x8e
>    _raw_spin_lock_irqsave+0x32/0x3a
>    queue_iova+0x77/0x145
>    intel_unmap+0x107/0x113
>    intel_unmap_page+0xe/0x10
>    usb_hcd_unmap_urb_setup_for_dma+0x53/0x9d
>    usb_hcd_unmap_urb_for_dma+0x17/0x100
>    unmap_urb_for_dma+0x22/0x24
>    __usb_hcd_giveback_urb+0x51/0xc3
>    usb_giveback_urb_bh+0x97/0xde
>    tasklet_action_common.isra.4+0x5f/0xa1
>    tasklet_action+0x2d/0x30
>    __do_softirq+0x138/0x2df
>    irq_exit+0x7d/0x8b
>    smp_apic_timer_interrupt+0x10f/0x151
>    apic_timer_interrupt+0xf/0x20
>    </IRQ>
>   RIP: 0010:_raw_spin_unlock_irqrestore+0x17/0x39
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: <stable@vger.kernel.org> # 4.14+
> Fixes: 13cf01744608 ("iommu/vt-d: Make use of iova deferred flushing")
> Signed-off-by: Dmitry Safonov <dima@arista.com>
> ---
>   drivers/iommu/intel-iommu.c |  3 ++-
>   drivers/iommu/iova.c        | 18 ++++++++++++++----
>   include/linux/iova.h        |  6 ++++++
>   3 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index ac4172c02244..6d1510284d21 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -3564,7 +3564,8 @@ static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
>   
>   	freelist = domain_unmap(domain, start_pfn, last_pfn);
>   
> -	if (intel_iommu_strict || (pdev && pdev->untrusted)) {
> +	if (intel_iommu_strict || (pdev && pdev->untrusted) ||
> +			!has_iova_flush_queue(&domain->iovad)) {
>   		iommu_flush_iotlb_psi(iommu, domain, start_pfn,
>   				      nrpages, !freelist, 0);
>   		/* free iova */
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index d499b2621239..8413ae54904a 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -54,9 +54,14 @@ init_iova_domain(struct iova_domain *iovad, unsigned long granule,
>   }
>   EXPORT_SYMBOL_GPL(init_iova_domain);
>   
> +bool has_iova_flush_queue(struct iova_domain *iovad)
> +{
> +	return !!iovad->fq;
> +}
> +
>   static void free_iova_flush_queue(struct iova_domain *iovad)
>   {
> -	if (!iovad->fq)
> +	if (!has_iova_flush_queue(iovad))
>   		return;
>   
>   	if (timer_pending(&iovad->fq_timer))
> @@ -74,13 +79,14 @@ static void free_iova_flush_queue(struct iova_domain *iovad)
>   int init_iova_flush_queue(struct iova_domain *iovad,
>   			  iova_flush_cb flush_cb, iova_entry_dtor entry_dtor)
>   {
> +	struct iova_fq __percpu *queue;
>   	int cpu;
>   
>   	atomic64_set(&iovad->fq_flush_start_cnt,  0);
>   	atomic64_set(&iovad->fq_flush_finish_cnt, 0);
>   
> -	iovad->fq = alloc_percpu(struct iova_fq);
> -	if (!iovad->fq)
> +	queue = alloc_percpu(struct iova_fq);
> +	if (!queue)
>   		return -ENOMEM;
>   
>   	iovad->flush_cb   = flush_cb;
> @@ -89,13 +95,17 @@ int init_iova_flush_queue(struct iova_domain *iovad,
>   	for_each_possible_cpu(cpu) {
>   		struct iova_fq *fq;
>   
> -		fq = per_cpu_ptr(iovad->fq, cpu);
> +		fq = per_cpu_ptr(queue, cpu);
>   		fq->head = 0;
>   		fq->tail = 0;
>   
>   		spin_lock_init(&fq->lock);
>   	}
>   
> +	smp_wmb();
> +
> +	iovad->fq = queue;
> +
>   	timer_setup(&iovad->fq_timer, fq_flush_timeout, 0);
>   	atomic_set(&iovad->fq_timer_on, 0);
>   
> diff --git a/include/linux/iova.h b/include/linux/iova.h
> index 781b96ac706f..cd0f1de901a8 100644
> --- a/include/linux/iova.h
> +++ b/include/linux/iova.h
> @@ -155,6 +155,7 @@ struct iova *reserve_iova(struct iova_domain *iovad, unsigned long pfn_lo,
>   void copy_reserved_iova(struct iova_domain *from, struct iova_domain *to);
>   void init_iova_domain(struct iova_domain *iovad, unsigned long granule,
>   	unsigned long start_pfn);
> +bool has_iova_flush_queue(struct iova_domain *iovad);
>   int init_iova_flush_queue(struct iova_domain *iovad,
>   			  iova_flush_cb flush_cb, iova_entry_dtor entry_dtor);
>   struct iova *find_iova(struct iova_domain *iovad, unsigned long pfn);
> @@ -235,6 +236,11 @@ static inline void init_iova_domain(struct iova_domain *iovad,
>   {
>   }
>   
> +bool has_iova_flush_queue(struct iova_domain *iovad)
> +{
> +	return false;
> +}
> +
>   static inline int init_iova_flush_queue(struct iova_domain *iovad,
>   					iova_flush_cb flush_cb,
>   					iova_entry_dtor entry_dtor)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
