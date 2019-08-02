Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D427F889
	for <lists.iommu@lfdr.de>; Fri,  2 Aug 2019 15:21:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DB627138A;
	Fri,  2 Aug 2019 13:21:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5E21F1386
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 13:21:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 03FE5821
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 13:21:12 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D433B21841;
	Fri,  2 Aug 2019 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564752072;
	bh=1kTjorHKug1z3+zFnC5XiWcgikyUykEsK13olvWbKPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQIBhHvuS02pT/aBbxjg/vZDDDhNwLFWzH3U0q9vxl9NMHHkeW7A9jgBqQt18FwC8
	7tnhiNYNrqTpuNVxj0eN4NOZlGZc/CvcZ7zhWKesXyqUoc/9UJriZKsoKQcTk5NYM3
	UAoLem/NZ4xMcJICoYiUPawPprs2VqLN0XHw/uWI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 40/76] iommu/vt-d: Check if domain->pgd was
	allocated
Date: Fri,  2 Aug 2019 09:19:14 -0400
Message-Id: <20190802131951.11600-40-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Joerg Roedel <jroedel@suse.de>,
	Dmitry Safonov <dima@arista.com>, iommu@lists.linux-foundation.org,
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

From: Dmitry Safonov <dima@arista.com>

[ Upstream commit 3ee9eca760e7d0b68c55813243de66bbb499dc3b ]

There is a couple of places where on domain_init() failure domain_exit()
is called. While currently domain_init() can fail only if
alloc_pgtable_page() has failed.

Make domain_exit() check if domain->pgd present, before calling
domain_unmap(), as it theoretically should crash on clearing pte entries
in dma_pte_clear_level().

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/intel-iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 2101601adf57d..1ad24367373f4 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -1900,7 +1900,6 @@ static int domain_init(struct dmar_domain *domain, struct intel_iommu *iommu,
 
 static void domain_exit(struct dmar_domain *domain)
 {
-	struct page *freelist;
 
 	/* Remove associated devices and clear attached or cached domains */
 	rcu_read_lock();
@@ -1910,9 +1909,12 @@ static void domain_exit(struct dmar_domain *domain)
 	/* destroy iovas */
 	put_iova_domain(&domain->iovad);
 
-	freelist = domain_unmap(domain, 0, DOMAIN_MAX_PFN(domain->gaw));
+	if (domain->pgd) {
+		struct page *freelist;
 
-	dma_free_pagelist(freelist);
+		freelist = domain_unmap(domain, 0, DOMAIN_MAX_PFN(domain->gaw));
+		dma_free_pagelist(freelist);
+	}
 
 	free_domain_mem(domain);
 }
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
