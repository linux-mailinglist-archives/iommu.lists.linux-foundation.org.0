Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E13A3B05E6
	for <lists.iommu@lfdr.de>; Tue, 22 Jun 2021 15:34:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93123605C3;
	Tue, 22 Jun 2021 13:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GUpFFv7ZZCmJ; Tue, 22 Jun 2021 13:34:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 52BE860830;
	Tue, 22 Jun 2021 13:34:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 209E4C000E;
	Tue, 22 Jun 2021 13:34:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74106C000E
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 13:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5501C402DF
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 13:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qg3w9Ibd3vfi for <iommu@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 13:34:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 784CC402D5
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 13:34:26 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a11so22953410lfg.11
 for <iommu@lists.linux-foundation.org>; Tue, 22 Jun 2021 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VpDilbWjWRuwm2Y0aj2xxaAxAvje8bBd6jPUCV3pOXQ=;
 b=fMPS6tmNxJ4WajUXO/WI+lAB/0vRCw/g40VCYzUAplHrCiShgYL4/pOWQt53jgsCrf
 grGcdhQjl09EnXls7tfkPf8x+Ekama0Z44pP8gN135yakp6jJ7WWKkoYaJkmCL6OFLUP
 nzOd+zztLMvLPOmX/8NCU+Nk6hN+3hpThfa+ReQZO3uaXdRMX34IHf9sOOvRgnLkv9G6
 alLI1QKAtA9yVaF6DuEsmIzeEi1WOWG1sjS4RoyJ/m5jVWPmmDB72ai9HnffPCdZGRoU
 45nWuPRiQFyqomMSwjaZkjlqTkynSdsmN1sLTW+F35Ra3uJpZOrA6cn28uqXYgBBKVYK
 yvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VpDilbWjWRuwm2Y0aj2xxaAxAvje8bBd6jPUCV3pOXQ=;
 b=Mhhfuwo7yaz6Zc6C/ugo/xjdPdgcyUvdC+E+y/rrcHZhtiVqjOULb3d8AnIv7q3LtE
 I3mKeUWnul/RdxCD4VSA2Ua9yy7vOJ+IixE63UVUY+lZ0gMIO5MfkY/enrBwsiIBKnb2
 iAriXnRNE0GYUpcCQsMu4eT3LGqy4Li7oX16KxPI7feKheWBObBLQFRpdhamXSAi0HOq
 Xd8qcHY5m6TA4D4SSrrHDDJyyy3eQVcX3Bg/u0sJksJVzV3DrW84KT9TQUwnZm0kNw7D
 7MMp071e7+gnIVuAXI2sPcAUnKdr4yzXdMZAkwophBmFEwgqr3461wgoWwLwKyJmhWtz
 n8Uw==
X-Gm-Message-State: AOAM5321InzLx0vGIegDnlXoRMEuD0N/wXu4Rac14ett+piK7cjislNu
 7yXaenz2HXO8ug5b13pe14M=
X-Google-Smtp-Source: ABdhPJyfiEMp266a5Vc5gXIKMSmpRt+IMoLHqhjEwQPGGcLOElP7Q+Iu0ooyEO/TCg6nVx1MPndmrQ==
X-Received: by 2002:ac2:5192:: with SMTP id u18mr2841831lfi.619.1624368864308; 
 Tue, 22 Jun 2021 06:34:24 -0700 (PDT)
Received: from localhost ([178.151.124.169])
 by smtp.gmail.com with ESMTPSA id l27sm2790583ljb.90.2021.06.22.06.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 06:34:23 -0700 (PDT)
From: Roman Skakun <rm.skakun@gmail.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc addresses
Date: Tue, 22 Jun 2021 16:34:14 +0300
Message-Id: <20210622133414.132754-1-rm.skakun@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616154436.GA7619@lst.de>
References: <20210616154436.GA7619@lst.de>
MIME-Version: 1.0
Cc: Andrii Anisov <andrii_anisov@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Roman Skakun <roman_skakun@epam.com>, Roman Skakun <rm.skakun@gmail.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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

This commit is dedicated to fix incorrect conversion from
cpu_addr to page address in cases when we get virtual
address which allocated in the vmalloc range.
As the result, virt_to_page() cannot convert this address
properly and return incorrect page address.

Need to detect such cases and obtains the page address using
vmalloc_to_page() instead.

Signed-off-by: Roman Skakun <roman_skakun@epam.com>
Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
---
Hey!
Thanks for suggestions, Christoph!
I updated the patch according to your advice.
But, I'm so surprised because nobody catches this problem
in the common code before. It looks a bit strange as for me. 


 kernel/dma/ops_helpers.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 910ae69cae77..782728d8a393 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -5,6 +5,14 @@
  */
 #include <linux/dma-map-ops.h>
 
+static struct page *cpu_addr_to_page(void *cpu_addr)
+{
+	if (is_vmalloc_addr(cpu_addr))
+		return vmalloc_to_page(cpu_addr);
+	else
+		return virt_to_page(cpu_addr);
+}
+
 /*
  * Create scatter-list for the already allocated DMA buffer.
  */
@@ -12,7 +20,7 @@ int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
 		 void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		 unsigned long attrs)
 {
-	struct page *page = virt_to_page(cpu_addr);
+	struct page *page = cpu_addr_to_page(cpu_addr);
 	int ret;
 
 	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
@@ -43,7 +51,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
 		return -ENXIO;
 
 	return remap_pfn_range(vma, vma->vm_start,
-			page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
+			page_to_pfn(cpu_addr_to_page(cpu_addr)) + vma->vm_pgoff,
 			user_count << PAGE_SHIFT, vma->vm_page_prot);
 #else
 	return -ENXIO;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
