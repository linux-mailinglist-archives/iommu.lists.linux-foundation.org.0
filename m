Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7061A7C10
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 15:14:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 341A720512;
	Tue, 14 Apr 2020 13:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SdnM3Z+LApy; Tue, 14 Apr 2020 13:14:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7AA812052F;
	Tue, 14 Apr 2020 13:14:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75AA0C0172;
	Tue, 14 Apr 2020 13:14:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF984C0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C95318560C
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39cLcaDLddlq for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 13:14:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 707188459B
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rwITWnodxtxB053rM9yCZzqiIs1QEdMouA7A3MKpqno=; b=JmhKVjFD6Qtc4Rks1WP0QRtOVI
 EaUL8ftEcKjawkCLWwPZDx4nRVBGbezEGtvLPT7IDbJMqMtSZ0+oyd24qvIsLdHerkTY/1FXTSdPs
 0p/noJIRPKmpuCZ19LecM57WC4hX/A33Cu7yHqAkJLCi4OvogbDj8zG0XdAH449MXmpUkwaaSj5up
 BVU/IFkT02nQTe7GDbtoRwsW3rlw3BwvxQ0SoRXia5xnTqKDb2L345edsRt7JsBVPlfVpwyZYySBG
 KviL7yjkAqDpJns8JZZrIzBdzsIgTRzvlKYT1z+2QI98z8/54DvBiUpaKLdBF+Gzu/QUyteboQQqB
 NHgrMHoQ==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLO3-0006Gl-Fp; Tue, 14 Apr 2020 13:13:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: [PATCH 02/29] x86: fix vmap arguments in map_irq_stack
Date: Tue, 14 Apr 2020 15:13:21 +0200
Message-Id: <20200414131348.444715-3-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414131348.444715-1-hch@lst.de>
References: <20200414131348.444715-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

vmap does not take a gfp_t, the flags argument is for VM_* flags.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/kernel/irq_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/irq_64.c b/arch/x86/kernel/irq_64.c
index 12df3a4abfdd..6b32ab009c19 100644
--- a/arch/x86/kernel/irq_64.c
+++ b/arch/x86/kernel/irq_64.c
@@ -43,7 +43,7 @@ static int map_irq_stack(unsigned int cpu)
 		pages[i] = pfn_to_page(pa >> PAGE_SHIFT);
 	}
 
-	va = vmap(pages, IRQ_STACK_SIZE / PAGE_SIZE, GFP_KERNEL, PAGE_KERNEL);
+	va = vmap(pages, IRQ_STACK_SIZE / PAGE_SIZE, VM_MAP, PAGE_KERNEL);
 	if (!va)
 		return -ENOMEM;
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
