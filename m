Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F28FA3CA3BD
	for <lists.iommu@lfdr.de>; Thu, 15 Jul 2021 19:16:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 822AE60C0F;
	Thu, 15 Jul 2021 17:16:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVWSCAOjG_tf; Thu, 15 Jul 2021 17:16:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7B3C260C04;
	Thu, 15 Jul 2021 17:16:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F06FC001A;
	Thu, 15 Jul 2021 17:16:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F622C000E
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 17:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C0E283FAA
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 17:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpWh-ZReVSk9 for <iommu@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 17:16:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6FC883FC8
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 17:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=bxYuYkexdgjCkkzv9UnzPxUCVLmS0/r9pZcrAxTBVsI=; b=Lss1AvtDz5LUXxNmZLvnEi5Xde
 zNsqlgc9Jfm+oTis6ayJermYtPQlSU7FExSZG7YxLDzVUAjV3EZgudpLjdA49a+pQ5IoaupAkmrUj
 MBmKsrcgEudrKKHqygKF9x1/h8OG9HCtnZ6ksLTzwkUmB6vGkrWUyKuQf2SwXUyj9EiP/h+4XMAeI
 5942GhQ+bqkXDDvcsqx0b0E0wzNh4Dd0L/rKgGWHjBE4F1pg1VHlpxUpnp+SnapV7KhBrAH+jRe0k
 I5aj2hsoE9K9+DtJ37q/EQ4CjTJYY8q+bja6l5RiGMwjgqR841ENJ51Mn9zbG5mhOaFhmV7ciE2YO
 VNuGxQPg==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m44Ux-0001ye-4e; Thu, 15 Jul 2021 10:46:08 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m44Up-0001nl-Il; Thu, 15 Jul 2021 10:45:59 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Thu, 15 Jul 2021 10:45:42 -0600
Message-Id: <20210715164544.6827-15-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com,
 martin.oliveira@eideticom.com, logang@deltatee.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, hpa@zytor.com, schnelle@linux.ibm.com,
 tsbogend@alpha.franken.de, mpe@ellerman.id.au
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v1 14/16] x86/amd_gart: return error code from gart_map_sg()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Stephen Bates <sbates@raithlin.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
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

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

So make __dma_map_cont() return a valid errno (which is then propagated
to gart_map_sg() via dma_map_cont()) and return it in case of failure.

Also, return -EINVAL in case of invalid nents.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/x86/kernel/amd_gart_64.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 9ac696487b13..46aea9a4f26b 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -331,7 +331,7 @@ static int __dma_map_cont(struct device *dev, struct scatterlist *start,
 	int i;
 
 	if (iommu_start == -1)
-		return -1;
+		return -ENOMEM;
 
 	for_each_sg(start, s, nelems, i) {
 		unsigned long pages, addr;
@@ -380,13 +380,13 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		       enum dma_data_direction dir, unsigned long attrs)
 {
 	struct scatterlist *s, *ps, *start_sg, *sgmap;
-	int need = 0, nextneed, i, out, start;
+	int need = 0, nextneed, i, out, start, ret;
 	unsigned long pages = 0;
 	unsigned int seg_size;
 	unsigned int max_seg_size;
 
 	if (nents == 0)
-		return 0;
+		return -EINVAL;
 
 	out		= 0;
 	start		= 0;
@@ -414,8 +414,9 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 			if (!iommu_merge || !nextneed || !need || s->offset ||
 			    (s->length + seg_size > max_seg_size) ||
 			    (ps->offset + ps->length) % PAGE_SIZE) {
-				if (dma_map_cont(dev, start_sg, i - start,
-						 sgmap, pages, need) < 0)
+				ret = dma_map_cont(dev, start_sg, i - start,
+						   sgmap, pages, need);
+				if (ret < 0)
 					goto error;
 				out++;
 
@@ -432,7 +433,8 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		pages += iommu_num_pages(s->offset, s->length, PAGE_SIZE);
 		ps = s;
 	}
-	if (dma_map_cont(dev, start_sg, i - start, sgmap, pages, need) < 0)
+	ret = dma_map_cont(dev, start_sg, i - start, sgmap, pages, need);
+	if (ret < 0)
 		goto error;
 	out++;
 	flush_gart();
@@ -458,7 +460,7 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 	iommu_full(dev, pages << PAGE_SHIFT, dir);
 	for_each_sg(sg, s, nents, i)
 		s->dma_address = DMA_MAPPING_ERROR;
-	return 0;
+	return ret;
 }
 
 /* allocate and map a coherent mapping */
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
