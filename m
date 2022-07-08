Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 580B456CD7F
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09BCC4055F;
	Sun, 10 Jul 2022 06:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09BCC4055F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=qf67dDm/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJFdv1tPkOq8; Sun, 10 Jul 2022 06:37:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 771FA408C3;
	Sun, 10 Jul 2022 06:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 771FA408C3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2C40C00A8;
	Sun, 10 Jul 2022 06:37:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04230C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42E0E84840
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E0E84840
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com
 header.a=rsa-sha256 header.s=20200525 header.b=qf67dDm/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqjBTjIzXwlX for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 16:51:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9127D84842
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9127D84842
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=LmGCYzInizLDoaY0nxdRNakEEV5uOH/M0iEEe8ldOrY=; b=qf67dDm/FK9cXJ3/XdFWopqX6+
 Iv1TZsACNs3pjKs21M6ptQoc0wfPVDyASStV1w0FQb5ySqhvcbNG5wnaIzGMcR/X4iT/kVgAHBblk
 Q/q1iuEdRmEM30tKuo17TTPPN6BSacuMvrfE+/fNMkc6NmqtAA7LiEuMHT7SMOA2Vrw5avcJDsSzp
 Lk3JJaWyU1OONu0c5C0Uv3Tg5jwM1OniviPLdZZm9OnITYVnqlg7tRRIxKHX262Ht3nwzB8zILp1l
 Cppr2vavZt+CKBcCUdIMd7Bg+UJBp+wY2RzwD4Ms7r+IRGv5g4vsp95b5XKQLR1T/RQD8u9TM5C4n
 ZtKl6cDQ==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gunthorp@deltatee.com>)
 id 1o9rCB-009xkG-SB; Fri, 08 Jul 2022 10:51:13 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim
 4.94.2) (envelope-from <gunthorp@deltatee.com>)
 id 1o9rC9-0001Jo-68; Fri, 08 Jul 2022 10:51:09 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, iommu@lists.linux.dev
Date: Fri,  8 Jul 2022 10:50:53 -0600
Message-Id: <20220708165104.5005-3-logang@deltatee.com>
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
 logang@deltatee.com, bhelgaas@google.com, jhubbard@nvidia.com,
 rcampbell@nvidia.com, kch@nvidia.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v8 02/13] PCI/P2PDMA: Attempt to set map_type if it has not
 been set
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, Stephen Bates <sbates@raithlin.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ralph Campbell <rcampbell@nvidia.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Xiong Jianxin <jianxin.xiong@intel.com>, Logan Gunthorpe <logang@deltatee.com>,
 Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

Attempt to find the mapping type for P2PDMA pages on the first
DMA map attempt if it has not been done ahead of time.

Previously, the mapping type was expected to be calculated ahead of
time, but if pages are to come from userspace then there's no
way to ensure the path was checked ahead of time.

This change will calculate the mapping type if it hasn't pre-calculated
so it is no longer invalid to call pci_p2pdma_map_sg() before the mapping
type is calculated, so drop the WARN_ON when that is the case.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/pci/p2pdma.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 462b429ad243..4e8bc457e29a 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -854,6 +854,7 @@ static enum pci_p2pdma_map_type pci_p2pdma_map_type(struct dev_pagemap *pgmap,
 	struct pci_dev *provider = to_p2p_pgmap(pgmap)->provider;
 	struct pci_dev *client;
 	struct pci_p2pdma *p2pdma;
+	int dist;
 
 	if (!provider->p2pdma)
 		return PCI_P2PDMA_MAP_NOT_SUPPORTED;
@@ -870,6 +871,10 @@ static enum pci_p2pdma_map_type pci_p2pdma_map_type(struct dev_pagemap *pgmap,
 		type = xa_to_value(xa_load(&p2pdma->map_types,
 					   map_types_idx(client)));
 	rcu_read_unlock();
+
+	if (type == PCI_P2PDMA_MAP_UNKNOWN)
+		return calc_map_type_and_dist(provider, client, &dist, true);
+
 	return type;
 }
 
@@ -912,7 +917,7 @@ int pci_p2pdma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
 	case PCI_P2PDMA_MAP_BUS_ADDR:
 		return __pci_p2pdma_map_sg(p2p_pgmap, dev, sg, nents);
 	default:
-		WARN_ON_ONCE(1);
+		/* Mapping is not Supported */
 		return 0;
 	}
 }
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
