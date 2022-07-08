Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5345456CD7E
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5DF282A26;
	Sun, 10 Jul 2022 06:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5DF282A26
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=M+C7MCh5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KV8NUivSn24J; Sun, 10 Jul 2022 06:37:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 35D0B813BD;
	Sun, 10 Jul 2022 06:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35D0B813BD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70DC4C008E;
	Sun, 10 Jul 2022 06:37:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 089F8C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E465041624
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E465041624
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com
 header.a=rsa-sha256 header.s=20200525 header.b=M+C7MCh5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtvi4r2qpvg0 for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 16:51:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B761E405F3
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B761E405F3
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=zRvvqf/soJ+YHmVk4fjT2lplFRBLbHW1+J+sEuwQeuA=; b=M+C7MCh5IhiXo+bB1Y7x/O53/T
 bYM37YlM895SHeEuRs3ZbWhoaYCQlOhBf8GwHDGLlSwIi5Xb8IbIZ3FZnoiMEuOafM92vPolonVxA
 NlALP2XdNi6k9ErgcWKJf4q3eiMHH8NISZMcCgZ6wZLYwgnl0xLupoJbJWPlr/S5sJRnwiLK0Yx41
 f1Mac8DOupVrKjsHxnwY+REQ2GxotG87bRZsr/7D+5ZCd0T/4UKc3i1TIDNMfe1oYTcmeBJTp7KbI
 2/ps/9MSnUsrstFXF5zCuC03Po0S8UbJKropq/fSuN53/R95HgGrnbxrTBryQdVbKy9xOmO1dqYFC
 vJ6zB6Ew==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gunthorp@deltatee.com>)
 id 1o9rCF-009xkG-4M; Fri, 08 Jul 2022 10:51:15 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim
 4.94.2) (envelope-from <gunthorp@deltatee.com>)
 id 1o9rC9-0001K4-Uw; Fri, 08 Jul 2022 10:51:09 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, iommu@lists.linux.dev
Date: Fri,  8 Jul 2022 10:50:58 -0600
Message-Id: <20220708165104.5005-8-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708165104.5005-1-logang@deltatee.com>
References: <20220708165104.5005-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, iommu@lists.linux.dev, sbates@raithlin.com,
 hch@lst.de, jgg@ziepe.ca, christian.koenig@amd.com, ddutile@redhat.com,
 willy@infradead.org, daniel.vetter@ffwll.ch, jason@jlekstrand.net,
 dave.hansen@linux.intel.com, helgaas@kernel.org, dan.j.williams@intel.com,
 dave.b.minturn@intel.com, jianxin.xiong@intel.com, ira.weiny@intel.com,
 robin.murphy@arm.com, martin.oliveira@eideticom.com, ckulkarnilinux@gmail.com,
 jhubbard@nvidia.com, rcampbell@nvidia.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v8 07/13] iommu: Explicitly skip bus address marked segments
 in __iommu_map_sg()
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Xiong Jianxin <jianxin.xiong@intel.com>
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

In order to support PCI P2PDMA mappings with dma-iommu, explicitly skip
any segments marked with sg_dma_mark_bus_address() in __iommu_map_sg().

These segments should not be mapped into the IOVA and will be handled
separately in as subsequent patch for dma-iommu.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 847ad47a2dfd..2844a3e02a89 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2457,6 +2457,9 @@ static ssize_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			len = 0;
 		}
 
+		if (sg_is_dma_bus_address(sg))
+			goto next;
+
 		if (len) {
 			len += sg->length;
 		} else {
@@ -2464,6 +2467,7 @@ static ssize_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 			start = s_phys;
 		}
 
+next:
 		if (++i < nents)
 			sg = sg_next(sg);
 	}
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
