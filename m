Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 936543CFAD0
	for <lists.iommu@lfdr.de>; Tue, 20 Jul 2021 15:38:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EEA0830C5;
	Tue, 20 Jul 2021 13:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgGU_GTLZP-2; Tue, 20 Jul 2021 13:38:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9206E83096;
	Tue, 20 Jul 2021 13:38:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60C28C000E;
	Tue, 20 Jul 2021 13:38:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A44CC000E
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 13:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96AEC60853
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 13:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BhRC3zDsW0Td for <iommu@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 13:38:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 050E4605A6
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 13:38:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27A76611CE;
 Tue, 20 Jul 2021 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626788320;
 bh=IMx3IbZKVqWumlzk+zzCwsBjRHxMO3KKzzyWrJuP4hw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sWQtqGYkEIpAvbvqwuj9mdWRgtJu9R68msQKV1qtpcN/wsj1wj55RxLL39COKvDn+
 qMJmJXjgi/ohYEaf3TO0ZSniwMh+/CgrQpIosyyJsWW/eUQudlm4YwiALtnlGORJRh
 Uq07gOuLGQGbu1gXxGo3Ge0jNf+6fpdsmKQETkLgU4/fFm9zTe4sWnJMcedKCDRt4X
 g1JDVr2oNvT1P8TiiIJiRavMW7XJmR8xblWCMtLuxpMaeLNYfdCbrPfW57GupWI4hY
 51bIm5xUIT2pr28+KYFZmf18JTBUscU1kxiPctR7y64vKjqykK58NgtGcqMNZKWZDG
 Syi8UTjoqhZuw==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 3/4] swiotlb: Emit diagnostic in swiotlb_exit()
Date: Tue, 20 Jul 2021 14:38:25 +0100
Message-Id: <20210720133826.9075-4-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210720133826.9075-1-will@kernel.org>
References: <20210720133826.9075-1-will@kernel.org>
MIME-Version: 1.0
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Claire Chang <tientzu@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Guenter Roeck <linux@roeck-us.net>
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

A recent debugging session would have been made a little bit easier if
we had noticed sooner that swiotlb_exit() was being called during boot.

Add a simple diagnostic message to swiotlb_exit() to complement the one
from swiotlb_print_info() during initialisation.

Cc: Claire Chang <tientzu@chromium.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Link: https://lore.kernel.org/r/20210705190352.GA19461@willie-the-truck
Suggested-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Will Deacon <will@kernel.org>
---
 kernel/dma/swiotlb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 7948f274f9bb..b3c793ed9e64 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -334,6 +334,7 @@ void __init swiotlb_exit(void)
 	if (!mem->nslabs)
 		return;
 
+	pr_info("tearing down default memory pool\n");
 	size = array_size(sizeof(*mem->slots), mem->nslabs);
 	if (mem->late_alloc)
 		free_pages((unsigned long)mem->slots, get_order(size));
-- 
2.32.0.402.g57bb445576-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
