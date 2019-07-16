Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB3F6B12B
	for <lists.iommu@lfdr.de>; Tue, 16 Jul 2019 23:38:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4CD3DE6F;
	Tue, 16 Jul 2019 21:38:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C93DBB7A
	for <iommu@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 21:38:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E766D892
	for <iommu@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 21:38:09 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u25so9704282wmc.4
	for <iommu@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 14:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arista.com; s=googlenew;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H3eudHJjvbxuD13KwrHicc1JmjafoBpBMmTNZ/oegRQ=;
	b=ey5VfHNmGSlDC0DDsLvbGKRYgHwTGQongQ0lo1Eno08EJte+AeeVZINJzftxHNlaaD
	4rGzTknZ7V8vQ7ix8TDmzSgCTNm8iwN5UX7mKGWK7ZLHAdhReZEUbDoLtnIAKtsslGbw
	G319+d3jMGLrvMAZW260knyuGk1Bk/qlEPT0u8GbTd9MO8XUzpc1y/Va6/xZUOQY+Vnx
	5PI2y1J5Ogny9caIbWPP2NOPgLZ80bO0IraxKIb29SFvZdb/aINmJolUkFe0c/XpILld
	QwAaf+lVKVbjmWyl9ASqw77DybybNHx7Ek8r/fdpRWfo10dy83jRv1DzlCJxPTgzjxX/
	ouUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H3eudHJjvbxuD13KwrHicc1JmjafoBpBMmTNZ/oegRQ=;
	b=Wfi/iL4q42M3W3NQk3YcnpwGOQp9BlNu3B2Ht4dv8qYdvGGU2BILvuIknycbxOcI4K
	HOD3PKb5o+R7zqv+fnIIFkKFVqaMXr7NoFJe4CeKCOlUWB+QmKt1fVfrzFJKjAXNwcLw
	IZ15tDV6OeP3zX5bFCEqoasjuVOtqopeB2Q51+oI0m/A1ZRfLKXPQJvWeomhabljEeoZ
	YVVBfmrSg/FzyH050+GmZXNZcehmsgWg9FrPpuLUP/leo5bT/9oIMVGteqYZ7a/zybtw
	7EmA+yB7OveOwgFnePeThrjsNR0jBqvQhJ36q7rMCUe6leQ8jrMQ04DyfgMJcHZJqVwi
	/MCg==
X-Gm-Message-State: APjAAAXzhWSvkJfaQJNmEm04QOeNqlX55/51QOzcT8pDMYZI0tkdKlBk
	adJUqAz1EBA4bUtdIJg71PG4p/qNhBxb8HN+/aY+mYFuYpjEeM3f+4Bgns3iIm2+ct4mv68sYgU
	E3QC6jb1FdLjIXJrv8WFMt8r81a7SGomyTEWUuaGD7Ohh0C4c1IV8nZ5QCy0Mb3xR9tX3p3TVzU
	Q48Ls+cjnjtAi8/armexkox/QFOA+qCO5QyZUB3FelzPh3
X-Google-Smtp-Source: APXvYqzXAPiCfMPhiPEqldBeMIFt/Ky+9UheM3jiHmtKkPgTcsW5NgbqIexEnJGUe2DVQhGoXCYKNg==
X-Received: by 2002:a05:600c:118a:: with SMTP id
	i10mr31601585wmf.162.1563313088482; 
	Tue, 16 Jul 2019 14:38:08 -0700 (PDT)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
	by smtp.gmail.com with ESMTPSA id
	v5sm22496878wre.50.2019.07.16.14.38.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 14:38:07 -0700 (PDT)
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] iommu/vt-d: Don't queue_iova() if there is no flush queue
Date: Tue, 16 Jul 2019 22:38:05 +0100
Message-Id: <20190716213806.20456-1-dima@arista.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CLOUD-SEC-AV-Info: arista,google_mail,monitor
X-CLOUD-SEC-AV-Sent: true
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Dmitry Safonov <dima@arista.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
	stable@vger.kernel.org, iommu@lists.linux-foundation.org,
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
From: Dmitry Safonov via iommu <iommu@lists.linux-foundation.org>
Reply-To: Dmitry Safonov <dima@arista.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Intel VT-d driver was reworked to use common deferred flushing
implementation. Previously there was one global per-cpu flush queue,
afterwards - one per domain.

Before deferring a flush, the queue should be allocated and initialized.

Currently only domains with IOMMU_DOMAIN_DMA type initialize their flush
queue. It's probably worth to init it for static or unmanaged domains
too, but it may be arguable - I'm leaving it to iommu folks.

Prevent queuing an iova flush if the domain doesn't have a queue.
The defensive check seems to be worth to keep even if queue would be
initialized for all kinds of domains. And is easy backportable.

On 4.19.43 stable kernel it has a user-visible effect: previously for
devices in si domain there were crashes, on sata devices:

 BUG: spinlock bad magic on CPU#6, swapper/0/1
  lock: 0xffff88844f582008, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
 CPU: 6 PID: 1 Comm: swapper/0 Not tainted 4.19.43 #1
 Call Trace:
  <IRQ>
  dump_stack+0x61/0x7e
  spin_bug+0x9d/0xa3
  do_raw_spin_lock+0x22/0x8e
  _raw_spin_lock_irqsave+0x32/0x3a
  queue_iova+0x45/0x115
  intel_unmap+0x107/0x113
  intel_unmap_sg+0x6b/0x76
  __ata_qc_complete+0x7f/0x103
  ata_qc_complete+0x9b/0x26a
  ata_qc_complete_multiple+0xd0/0xe3
  ahci_handle_port_interrupt+0x3ee/0x48a
  ahci_handle_port_intr+0x73/0xa9
  ahci_single_level_irq_intr+0x40/0x60
  __handle_irq_event_percpu+0x7f/0x19a
  handle_irq_event_percpu+0x32/0x72
  handle_irq_event+0x38/0x56
  handle_edge_irq+0x102/0x121
  handle_irq+0x147/0x15c
  do_IRQ+0x66/0xf2
  common_interrupt+0xf/0xf
 RIP: 0010:__do_softirq+0x8c/0x2df

The same for usb devices that use ehci-pci:
 BUG: spinlock bad magic on CPU#0, swapper/0/1
  lock: 0xffff88844f402008, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
 CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.43 #4
 Call Trace:
  <IRQ>
  dump_stack+0x61/0x7e
  spin_bug+0x9d/0xa3
  do_raw_spin_lock+0x22/0x8e
  _raw_spin_lock_irqsave+0x32/0x3a
  queue_iova+0x77/0x145
  intel_unmap+0x107/0x113
  intel_unmap_page+0xe/0x10
  usb_hcd_unmap_urb_setup_for_dma+0x53/0x9d
  usb_hcd_unmap_urb_for_dma+0x17/0x100
  unmap_urb_for_dma+0x22/0x24
  __usb_hcd_giveback_urb+0x51/0xc3
  usb_giveback_urb_bh+0x97/0xde
  tasklet_action_common.isra.4+0x5f/0xa1
  tasklet_action+0x2d/0x30
  __do_softirq+0x138/0x2df
  irq_exit+0x7d/0x8b
  smp_apic_timer_interrupt+0x10f/0x151
  apic_timer_interrupt+0xf/0x20
  </IRQ>
 RIP: 0010:_raw_spin_unlock_irqrestore+0x17/0x39

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: <stable@vger.kernel.org> # 4.14+
Fixes: 13cf01744608 ("iommu/vt-d: Make use of iova deferred flushing")
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 drivers/iommu/intel-iommu.c |  3 ++-
 drivers/iommu/iova.c        | 18 ++++++++++++++----
 include/linux/iova.h        |  6 ++++++
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index ac4172c02244..6d1510284d21 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3564,7 +3564,8 @@ static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
 
 	freelist = domain_unmap(domain, start_pfn, last_pfn);
 
-	if (intel_iommu_strict || (pdev && pdev->untrusted)) {
+	if (intel_iommu_strict || (pdev && pdev->untrusted) ||
+			!has_iova_flush_queue(&domain->iovad)) {
 		iommu_flush_iotlb_psi(iommu, domain, start_pfn,
 				      nrpages, !freelist, 0);
 		/* free iova */
diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index d499b2621239..8413ae54904a 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -54,9 +54,14 @@ init_iova_domain(struct iova_domain *iovad, unsigned long granule,
 }
 EXPORT_SYMBOL_GPL(init_iova_domain);
 
+bool has_iova_flush_queue(struct iova_domain *iovad)
+{
+	return !!iovad->fq;
+}
+
 static void free_iova_flush_queue(struct iova_domain *iovad)
 {
-	if (!iovad->fq)
+	if (!has_iova_flush_queue(iovad))
 		return;
 
 	if (timer_pending(&iovad->fq_timer))
@@ -74,13 +79,14 @@ static void free_iova_flush_queue(struct iova_domain *iovad)
 int init_iova_flush_queue(struct iova_domain *iovad,
 			  iova_flush_cb flush_cb, iova_entry_dtor entry_dtor)
 {
+	struct iova_fq __percpu *queue;
 	int cpu;
 
 	atomic64_set(&iovad->fq_flush_start_cnt,  0);
 	atomic64_set(&iovad->fq_flush_finish_cnt, 0);
 
-	iovad->fq = alloc_percpu(struct iova_fq);
-	if (!iovad->fq)
+	queue = alloc_percpu(struct iova_fq);
+	if (!queue)
 		return -ENOMEM;
 
 	iovad->flush_cb   = flush_cb;
@@ -89,13 +95,17 @@ int init_iova_flush_queue(struct iova_domain *iovad,
 	for_each_possible_cpu(cpu) {
 		struct iova_fq *fq;
 
-		fq = per_cpu_ptr(iovad->fq, cpu);
+		fq = per_cpu_ptr(queue, cpu);
 		fq->head = 0;
 		fq->tail = 0;
 
 		spin_lock_init(&fq->lock);
 	}
 
+	smp_wmb();
+
+	iovad->fq = queue;
+
 	timer_setup(&iovad->fq_timer, fq_flush_timeout, 0);
 	atomic_set(&iovad->fq_timer_on, 0);
 
diff --git a/include/linux/iova.h b/include/linux/iova.h
index 781b96ac706f..cd0f1de901a8 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -155,6 +155,7 @@ struct iova *reserve_iova(struct iova_domain *iovad, unsigned long pfn_lo,
 void copy_reserved_iova(struct iova_domain *from, struct iova_domain *to);
 void init_iova_domain(struct iova_domain *iovad, unsigned long granule,
 	unsigned long start_pfn);
+bool has_iova_flush_queue(struct iova_domain *iovad);
 int init_iova_flush_queue(struct iova_domain *iovad,
 			  iova_flush_cb flush_cb, iova_entry_dtor entry_dtor);
 struct iova *find_iova(struct iova_domain *iovad, unsigned long pfn);
@@ -235,6 +236,11 @@ static inline void init_iova_domain(struct iova_domain *iovad,
 {
 }
 
+bool has_iova_flush_queue(struct iova_domain *iovad)
+{
+	return false;
+}
+
 static inline int init_iova_flush_queue(struct iova_domain *iovad,
 					iova_flush_cb flush_cb,
 					iova_entry_dtor entry_dtor)
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
