Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A0327860
	for <lists.iommu@lfdr.de>; Mon,  1 Mar 2021 08:45:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAEFD842D7;
	Mon,  1 Mar 2021 07:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aP9KPvF_GLOX; Mon,  1 Mar 2021 07:45:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB289842D0;
	Mon,  1 Mar 2021 07:45:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A40CC0015;
	Mon,  1 Mar 2021 07:45:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA8ECC000B
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D421842D1
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ubuLFbr_rMN for <iommu@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 07:45:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA941842D0
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jOUIvbpH1p3Q/dfE+7zDHmmKowLb7E/HssGmywq4qaM=; b=iiWXchTzp1z6tMwlARGVdg7qFd
 Jl5fCXY5v6vpmDrkF3TdnBigIdjyRi1EYbprKN/1D4IWDPlTOnJ7qGmZuPx8fCSdhV6gYXkdVXilz
 lMRq0qveYM+qGvCgIg+kOUnvXAV2GvvUvDQNP6xUFLQw1EBbP4PWEhY5Dt7Efsr5yOvBwA+G5tdDL
 IXM4bsZPzfNakZV6/kSBDPUsMIZLv9Shumi2xDaFpURz7TXDi9YPfYWJ+n8Xb4hRpph8JY36bzgpN
 I1aPhiWMrPFf4XDSHTeM18WNJetLSA8Rk2qjCMPvrj9Zx9X1OfH9nLC1/QFByOA9CBTSSNP3VF0/O
 sAzslN5g==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdEa-00FR4x-UN; Mon, 01 Mar 2021 07:44:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 01/14] powerpc/svm: stop using io_tlb_start
Date: Mon,  1 Mar 2021 08:44:23 +0100
Message-Id: <20210301074436.919889-2-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org, Dongli Zhang <dongli.zhang@oracle.com>
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

Use the local variable that is passed to swiotlb_init_with_tbl for
freeing the memory in the failure case to isolate the code a little
better from swiotlb internals.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/platforms/pseries/svm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 7b739cc7a8a93e..1d829e257996fb 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -55,9 +55,9 @@ void __init svm_swiotlb_init(void)
 	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
 		return;
 
-	if (io_tlb_start)
-		memblock_free_early(io_tlb_start,
-				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+
+	memblock_free_early(__pa(vstart),
+			    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
 
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
