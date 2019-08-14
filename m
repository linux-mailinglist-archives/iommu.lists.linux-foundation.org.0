Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66D8D948
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 19:07:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 59430DB7;
	Wed, 14 Aug 2019 17:07:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 583FFD4B
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 17:07:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 088C587E
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 17:07:07 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5AA8A21721;
	Wed, 14 Aug 2019 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565802426;
	bh=VtbA8zZWqby0Q8Drx6N71oFgtMUHUf+gQidEJvzWYpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lnp9yVpXPh5Cme8FyTmYMW8iprfxEZnpk+NcOKdraPHnrDynq2QL43vXrf5h6NSaH
	2VPEjrDrUiAbM4Ol4F8ixBKIiZD7C9pIe79jAWEoKLAumkZyamvRjGimpzewmNW3Ow
	17C8sTSU3rCPvz3gtDm/rwkPui7cXOMgqujJMRGo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.2 085/144] iommu/vt-d: Check if domain->pgd was allocated
Date: Wed, 14 Aug 2019 19:00:41 +0200
Message-Id: <20190814165803.429413517@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814165759.466811854@linuxfoundation.org>
References: <20190814165759.466811854@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Joerg Roedel <jroedel@suse.de>,
	Dmitry Safonov <dima@arista.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

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
