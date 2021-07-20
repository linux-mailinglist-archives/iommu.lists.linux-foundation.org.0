Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9552B3CFACC
	for <lists.iommu@lfdr.de>; Tue, 20 Jul 2021 15:38:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C4A7400FC;
	Tue, 20 Jul 2021 13:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PL6w_aQrJxoz; Tue, 20 Jul 2021 13:38:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0ABF440392;
	Tue, 20 Jul 2021 13:38:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E35E8C000E;
	Tue, 20 Jul 2021 13:38:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04FF2C0022
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 13:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9E454024A
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 13:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yC2KEqMKWlUE for <iommu@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 13:38:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA07E401DB
 for <iommu@lists.linux-foundation.org>; Tue, 20 Jul 2021 13:38:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BB4661107;
 Tue, 20 Jul 2021 13:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626788316;
 bh=yix51yf07Z8qDxgST7yPFtC4zAsHbFq/kObexAIh79w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eBA3j5jxeHAyFRsjt09covbtUAO/5KX9Omg/7cPGyvA0TIQgNXHvi1zvf5dhdlnzx
 GAIp1VEY64vEoXex6YONdYCNQLl8nAsdbRkL555eq+hrvyg/UzND1hwVdy7/tCEL/5
 j4pW9n5VkHYSJan2fC4E1WX90urMLxwiX1qe7YMrdneCugVC3iAtVMHM93hqVv5/UL
 gp0+BPlllg1t01yzrqD4YfHOwEiuyE3IHzR4Wcn/42MlYwyn8S+2nohti8o12TDZr/
 DcXGpJiz/hB9I9PsDO0nvHGx/RiyuTNZ+d+KIcwjdtVpA5K5soy/sPY2/8OvK6LBIx
 eHw9iBh0w3FEQ==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 1/4] of: Return success from of_dma_set_restricted_buffer()
 when !OF_ADDRESS
Date: Tue, 20 Jul 2021 14:38:23 +0100
Message-Id: <20210720133826.9075-2-will@kernel.org>
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

When CONFIG_OF_ADDRESS=n, of_dma_set_restricted_buffer() returns -ENODEV
and breaks the boot for sparc[64] machines. Return 0 instead, since the
function is essentially a glorified NOP in this configuration.

Cc: Claire Chang <tientzu@chromium.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Reported-by: Guenter Roeck <linux@roeck-us.net>
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/r/20210702030807.GA2685166@roeck-us.net
Fixes: fec9b625095f ("of: Add plumbing for restricted DMA pool")
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/of/of_private.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 376462798f7e..f557bd22b0cf 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -173,7 +173,8 @@ static inline int of_dma_get_range(struct device_node *np,
 static inline int of_dma_set_restricted_buffer(struct device *dev,
 					       struct device_node *np)
 {
-	return -ENODEV;
+	/* Do nothing, successfully. */
+	return 0;
 }
 #endif
 
-- 
2.32.0.402.g57bb445576-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
