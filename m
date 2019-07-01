Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B47AA4AD34
	for <lists.iommu@lfdr.de>; Tue, 18 Jun 2019 23:19:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CA3ABB3E;
	Tue, 18 Jun 2019 21:19:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 461FD3EE
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 21:19:05 +0000 (UTC)
X-Greylist: delayed 00:16:28 by SQLgrey-1.7.6
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5A51482F
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 21:19:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
	x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
	by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
	16945877-1500050 for multiple; Tue, 18 Jun 2019 22:02:17 +0100
MIME-Version: 1.0
To: Lu Baolu <baolu.lu@linux.intel.com>, dwmw2@infradead.org, joro@8bytes.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190521073016.27525-1-baolu.lu@linux.intel.com>
References: <20190521073016.27525-1-baolu.lu@linux.intel.com>
Message-ID: <156089173816.31375.3686352361646791464@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 1/2] iommu/vt-d: Fix lock inversion between iommu->lock and
	device_domain_lock
Date: Tue, 18 Jun 2019 22:02:18 +0100
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
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

Quoting Lu Baolu (2019-05-21 08:30:15)
> From: Dave Jiang <dave.jiang@intel.com>
> 
> Lockdep debug reported lock inversion related with the iommu code
> caused by dmar_insert_one_dev_info() grabbing the iommu->lock and
> the device_domain_lock out of order versus the code path in
> iommu_flush_dev_iotlb(). Expanding the scope of the iommu->lock and
> reversing the order of lock acquisition fixes the issue.

Which of course violates the property that device_domain_lock is the
outer lock...

<4>[    1.252997] ======================================================
<4>[    1.252999] WARNING: possible circular locking dependency detected
<4>[    1.253002] 5.2.0-rc5-CI-CI_DRM_6299+ #1 Not tainted
<4>[    1.253004] ------------------------------------------------------
<4>[    1.253006] swapper/0/1 is trying to acquire lock:
<4>[    1.253009] 0000000091462475 (&(&iommu->lock)->rlock){+.+.}, at: domain_context_mapping_one+0xa0/0x4f0
<4>[    1.253015]
                  but task is already holding lock:
<4>[    1.253017] 0000000069266737 (device_domain_lock){....}, at: domain_context_mapping_one+0x88/0x4f0
<4>[    1.253021]
                  which lock already depends on the new lock.

<4>[    1.253024]
                  the existing dependency chain (in reverse order) is:
<4>[    1.253027]
                  -> #1 (device_domain_lock){....}:
<4>[    1.253031]        _raw_spin_lock_irqsave+0x33/0x50
<4>[    1.253034]        dmar_insert_one_dev_info+0xb8/0x520
<4>[    1.253036]        set_domain_for_dev+0x66/0xf0
<4>[    1.253039]        iommu_prepare_identity_map+0x48/0x95
<4>[    1.253042]        intel_iommu_init+0xfd8/0x138d
<4>[    1.253045]        pci_iommu_init+0x11/0x3a
<4>[    1.253048]        do_one_initcall+0x58/0x300
<4>[    1.253051]        kernel_init_freeable+0x2c0/0x359
<4>[    1.253054]        kernel_init+0x5/0x100
<4>[    1.253056]        ret_from_fork+0x3a/0x50
<4>[    1.253058]
                  -> #0 (&(&iommu->lock)->rlock){+.+.}:
<4>[    1.253062]        lock_acquire+0xa6/0x1c0
<4>[    1.253064]        _raw_spin_lock+0x2a/0x40
<4>[    1.253067]        domain_context_mapping_one+0xa0/0x4f0
<4>[    1.253070]        pci_for_each_dma_alias+0x2b/0x160
<4>[    1.253072]        dmar_insert_one_dev_info+0x44e/0x520
<4>[    1.253075]        set_domain_for_dev+0x66/0xf0
<4>[    1.253077]        iommu_prepare_identity_map+0x48/0x95
<4>[    1.253080]        intel_iommu_init+0xfd8/0x138d
<4>[    1.253082]        pci_iommu_init+0x11/0x3a
<4>[    1.253084]        do_one_initcall+0x58/0x300
<4>[    1.253086]        kernel_init_freeable+0x2c0/0x359
<4>[    1.253089]        kernel_init+0x5/0x100
<4>[    1.253091]        ret_from_fork+0x3a/0x50
<4>[    1.253093]
                  other info that might help us debug this:

<4>[    1.253095]  Possible unsafe locking scenario:

<4>[    1.253095]        CPU0                    CPU1
<4>[    1.253095]        ----                    ----
<4>[    1.253095]   lock(device_domain_lock);
<4>[    1.253095]                                lock(&(&iommu->lock)->rlock);
<4>[    1.253095]                                lock(device_domain_lock);
<4>[    1.253095]   lock(&(&iommu->lock)->rlock);
<4>[    1.253095]
                   *** DEADLOCK ***

<4>[    1.253095] 2 locks held by swapper/0/1:
<4>[    1.253095]  #0: 0000000076465a1e (dmar_global_lock){++++}, at: intel_iommu_init+0x1d3/0x138d
<4>[    1.253095]  #1: 0000000069266737 (device_domain_lock){....}, at: domain_context_mapping_one+0x88/0x4f0
<4>[    1.253095]
                  stack backtrace:
<4>[    1.253095] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc5-CI-CI_DRM_6299+ #1
<4>[    1.253095] Hardware name:  /NUC5i7RYB, BIOS RYBDWi35.86A.0362.2017.0118.0940 01/18/2017
<4>[    1.253095] Call Trace:
<4>[    1.253095]  dump_stack+0x67/0x9b
<4>[    1.253095]  print_circular_bug+0x1c8/0x2b0
<4>[    1.253095]  __lock_acquire+0x1ce9/0x24c0
<4>[    1.253095]  ? lock_acquire+0xa6/0x1c0
<4>[    1.253095]  lock_acquire+0xa6/0x1c0
<4>[    1.253095]  ? domain_context_mapping_one+0xa0/0x4f0
<4>[    1.253095]  _raw_spin_lock+0x2a/0x40
<4>[    1.253095]  ? domain_context_mapping_one+0xa0/0x4f0
<4>[    1.253095]  domain_context_mapping_one+0xa0/0x4f0
<4>[    1.253095]  ? domain_context_mapping_one+0x4f0/0x4f0
<4>[    1.253095]  pci_for_each_dma_alias+0x2b/0x160
<4>[    1.253095]  dmar_insert_one_dev_info+0x44e/0x520
<4>[    1.253095]  set_domain_for_dev+0x66/0xf0
<4>[    1.253095]  iommu_prepare_identity_map+0x48/0x95
<4>[    1.253095]  intel_iommu_init+0xfd8/0x138d
<4>[    1.253095]  ? set_debug_rodata+0xc/0xc
<4>[    1.253095]  ? set_debug_rodata+0xc/0xc
<4>[    1.253095]  ? e820__memblock_setup+0x5b/0x5b
<4>[    1.253095]  ? pci_iommu_init+0x11/0x3a
<4>[    1.253095]  ? set_debug_rodata+0xc/0xc
<4>[    1.253095]  pci_iommu_init+0x11/0x3a
<4>[    1.253095]  do_one_initcall+0x58/0x300
<4>[    1.253095]  kernel_init_freeable+0x2c0/0x359
<4>[    1.253095]  ? rest_init+0x250/0x250
<4>[    1.253095]  kernel_init+0x5/0x100
<4>[    1.253095]  ret_from_fork+0x3a/0x50
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
