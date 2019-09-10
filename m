Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DC17DAF0AB
	for <lists.iommu@lfdr.de>; Tue, 10 Sep 2019 19:49:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 81163E38;
	Tue, 10 Sep 2019 17:49:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AF4F0CAF
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 17:49:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 715278AC
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 17:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
	t=1568137790; x=1599673790;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TWMkQtCBlL578v4YLPeK5EGe2lJw/CTmN/BUW7ZfNjY=;
	b=m6ymIbjHXIOugDHnZgRdLjQ2DSlWujcyON7SrZx2LEGNn6vZZJH2k7qU
	fa4MKf2N21NNkKpv170/mH60B9wecXH85h5j08e0/adIbfkEXFFOhO6af
	IBwb9XiuEIssctkwNi7FZ4JihEAE2Qd1gyWqjOXA5AUxSoGcmxmm8kmDF s=;
X-IronPort-AV: E=Sophos;i="5.64,490,1559520000"; d="scan'208";a="750019361"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
	email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com)
	([10.124.125.2])
	by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
	10 Sep 2019 17:49:48 +0000
Received: from uf8b156e456a5587c9af4.ant.amazon.com
	(pdx2-ws-svc-lb17-vlan3.amazon.com [10.247.140.70])
	by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with
	ESMTPS id E6F6BA0464; Tue, 10 Sep 2019 17:49:46 +0000 (UTC)
Received: from uf8b156e456a5587c9af4.ant.amazon.com (localhost [127.0.0.1])
	by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Debian-3) with
	ESMTP id x8AHnjFI023835; Tue, 10 Sep 2019 19:49:45 +0200
Received: (from sironi@localhost)
	by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Submit) id
	x8AHniMh023833; Tue, 10 Sep 2019 19:49:44 +0200
To: sironi@amazon.de, joro@8bytes.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] iommu/amd: Hold the domain lock when calling
	iommu_map_page
Date: Tue, 10 Sep 2019 19:49:24 +0200
Message-Id: <1568137765-20278-5-git-send-email-sironi@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568137765-20278-1-git-send-email-sironi@amazon.de>
References: <1568137765-20278-1-git-send-email-sironi@amazon.de>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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
From: Filippo Sironi via iommu <iommu@lists.linux-foundation.org>
Reply-To: Filippo Sironi <sironi@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

iommu_map_page calls into __domain_flush_pages, which requires the
domain lock since it traverses the device list, which the lock protects.

Signed-off-by: Filippo Sironi <sironi@amazon.de>
---
 drivers/iommu/amd_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index d4f25767622e..3714ae5ded31 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -2562,6 +2562,7 @@ static int map_sg(struct device *dev, struct scatterlist *sglist,
 	unsigned long address;
 	u64 dma_mask;
 	int ret;
+	unsigned long flags;
 
 	domain = get_domain(dev);
 	if (IS_ERR(domain))
@@ -2587,7 +2588,9 @@ static int map_sg(struct device *dev, struct scatterlist *sglist,
 
 			bus_addr  = address + s->dma_address + (j << PAGE_SHIFT);
 			phys_addr = (sg_phys(s) & PAGE_MASK) + (j << PAGE_SHIFT);
+			spin_lock_irqsave(&domain->lock, flags);
 			ret = iommu_map_page(domain, bus_addr, phys_addr, PAGE_SIZE, prot, GFP_ATOMIC);
+			spin_unlock_irqrestore(&domain->lock, flags);
 			if (ret)
 				goto out_unmap;
 
@@ -3095,7 +3098,9 @@ static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
 		prot |= IOMMU_PROT_IW;
 
 	mutex_lock(&domain->api_lock);
+	spin_lock(&domain->lock);
 	ret = iommu_map_page(domain, iova, paddr, page_size, prot, GFP_KERNEL);
+	spin_unlock(&domain->lock);
 	mutex_unlock(&domain->api_lock);
 
 	domain_flush_np_cache(domain, iova, page_size);
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
