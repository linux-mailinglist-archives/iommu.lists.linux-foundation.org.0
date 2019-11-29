Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364610D49C
	for <lists.iommu@lfdr.de>; Fri, 29 Nov 2019 12:15:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A73FC230ED;
	Fri, 29 Nov 2019 11:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NWlP6wcU-Sy; Fri, 29 Nov 2019 11:15:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D74ED2042B;
	Fri, 29 Nov 2019 11:15:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C41FCC0881;
	Fri, 29 Nov 2019 11:15:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 245B1C0881
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 11:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 12D40230F3
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 11:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XG+oJewzornO for <iommu@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 11:03:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 42FC223026
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 11:03:46 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s18so344833pfm.4
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 03:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bQaztd6H//OV30Bo0EObWm1ZxBnDlIoPVUN9tARbU6I=;
 b=lqGFRRH9pbhHpEOMm/ZRBKVCNGOjw41RFz7C96kknAc4QXS8xriEdSjnXJU6es8mF5
 JhJPgCYXxWa5SXF5WXsnNdmwvc6whyOBQeerVYjBUi2wPLDpF41pTLEBnokBrjxClMt6
 JvDm3uKXTzlPPW36Y8QtdGuhK5vrlNLKc/9raQ1BMe49Jf8cl5B++UpuPzUyO2f6AtzW
 GFgi5RViqYrRkBxJHIeooswbzHCuTLoK2EvVI37YGE2RTUaEATXM16+dH4z08vzMT8Q1
 tou7qtPx9EQQNrHSkElpt1OOW9jTjbfwI+XDV9rkDBF1hpSW1ioQKf+nzvdB/wnK3rXf
 MI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bQaztd6H//OV30Bo0EObWm1ZxBnDlIoPVUN9tARbU6I=;
 b=Shth94vj+Jkwi5OpGV0ComQhI6Y2Fj218drQxv0GCOdo9pJ0AqFVCQYPG3yoUl65XQ
 4He/XOCqutxOAiUUTdbrxZNbmkevUqQzRkcHIsFhmgIiUaGGtKivKNomdGb8Wz6gyOLT
 tj+9EA7xk8VkBsn4J04ChXnNSG1U3aOuSlzPJ4VwA96RHPkU2jclNT+iqNrXIKWfXT0F
 1QoeiKixkvZklYK9dW3ncpyWSu1gMmSJeF+VZP49OGVwsUOU6xH2Qozh5uWyY8kQDABr
 avBlsPMS9vvKMcJuwYEgMeMVo2meMQPAzy3r3+YX4K0XvkRhDm6tGGk5gN06/sZ6zoYO
 XGlg==
X-Gm-Message-State: APjAAAU++7WKbYiXtFFza25gpKp3Tx9dkQoaU2CS/ZkVgYslK/cIrdY9
 PA+2hik/nDXWB0uSxKxz4Qo=
X-Google-Smtp-Source: APXvYqyQDiqV3ZEJNgdmU8kqllIQcJAoaYTF1cGPu5OJVURX2j0TSk6k0BbMdIOIzfr5R8QQxCr3oA==
X-Received: by 2002:a63:c406:: with SMTP id h6mr16520585pgd.213.1575025425828; 
 Fri, 29 Nov 2019 03:03:45 -0800 (PST)
Received: from localhost ([43.224.245.181])
 by smtp.gmail.com with ESMTPSA id g7sm23118907pgr.52.2019.11.29.03.03.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 03:03:44 -0800 (PST)
From: lijiazi <jqqlijiazi@gmail.com>
X-Google-Original-From: lijiazi <lijiazi@xiaomi.com>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] dma-mapping: do not mapping module memory
Date: Fri, 29 Nov 2019 19:03:40 +0800
Message-Id: <d6a63ad37b2556b8ba2fda16fc4dde95aa721741.1574997534.git.lijiazi@xiaomi.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 29 Nov 2019 11:15:55 +0000
Cc: lijiazi <lijiazi@xiaomi.com>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On ARM, x86_64, sparc64 platform, virt_to_page only convert a
_valid_ virtual address to struct page *, virt_addr_valid(x)
indicates whether a virtual address is valid. If ptr is point
to a static variable in module area, virt_to_page will return
a invalid value.

Signed-off-by: lijiazi <lijiazi@xiaomi.com>
---
 include/linux/dma-mapping.h | 10 +++++++---
 mm/vmalloc.c                |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 330ad58..37e645d 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -580,9 +580,13 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
 static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	/* DMA must never operate on areas that might be remapped. */
-	if (dev_WARN_ONCE(dev, is_vmalloc_addr(ptr),
-			  "rejecting DMA map of vmalloc memory\n"))
+	/* DMA must never operate on areas that might be remapped.
+	 * ARM, X86_64, sparc64 put module in a special place, if ptr
+	 * point to static variable in module area, virt_to_page will
+	 * return err page *.
+	 */
+	if (dev_WARN_ONCE(dev, is_vmalloc_or_module_addr(ptr),
+			  "rejecting DMA map of vmalloc or module memory\n"))
 		return DMA_MAPPING_ERROR;
 	debug_dma_map_single(dev, ptr, size);
 	return dma_map_page_attrs(dev, virt_to_page(ptr), offset_in_page(ptr),
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 588303a..71ce6dc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -262,6 +262,7 @@ int is_vmalloc_or_module_addr(const void *x)
 #endif
 	return is_vmalloc_addr(x);
 }
+EXPORT_SYMBOL(is_vmalloc_or_module_addr);
 
 /*
  * Walk a vmap address to the struct page it maps.
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
