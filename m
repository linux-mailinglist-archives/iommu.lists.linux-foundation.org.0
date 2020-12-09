Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 596C32D422C
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 13:35:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 10BAA87452;
	Wed,  9 Dec 2020 12:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vs8kElfzxFdt; Wed,  9 Dec 2020 12:35:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 21D238740D;
	Wed,  9 Dec 2020 12:35:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECDD7C013B;
	Wed,  9 Dec 2020 12:35:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 703F7C013B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 55F742E242
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ohKNYEkj3U4 for <iommu@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 12:34:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from zg8tmtm5lju5ljm3lje2naaa.icoremail.net
 (zg8tmtm5lju5ljm3lje2naaa.icoremail.net [139.59.37.164])
 by silver.osuosl.org (Postfix) with SMTP id B707F2050E
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 12:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mails.tsinghua.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:
 Date:Message-Id; bh=B2aGZVvzwAUzN2gSBED1w4X3+sMCVpQQjLP3aeJ+pqU=;
 b=nLODwqH+dlA03ldgG+rcW7oQVPCUNKBCLzphmKOEdb+1t8hz0QzCIoLx7ivk/V
 xDHJfFBwafN403qf3zmgNKdQfIvCbmFMNu6zTLeLTepvNIkEYrIbP7wENMMvuirR
 Ygu2h1wfkTB0po4LOuSo+kDUyrRa+6TFEg2iUIP2+TruQ=
Received: from ubuntu.localdomain (unknown [166.111.83.82])
 by web2 (Coremail) with SMTP id yQQGZQC3qwFkxNBf6gMHAA--.17667S4;
 Wed, 09 Dec 2020 20:34:44 +0800 (CST)
From: tangzhenhao <tzh18@mails.tsinghua.edu.cn>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] drivers/iommu: fix a null-ptr-deref bug in fsl_pamu_domain.c
Date: Wed,  9 Dec 2020 04:34:30 -0800
Message-Id: <20201209123430.35310-1-tzh18@mails.tsinghua.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: yQQGZQC3qwFkxNBf6gMHAA--.17667S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4kGr4xGr1DJw1kArWrZrb_yoW3urXEkF
 y8ZF9xGryjyrsrCryIgrn3ZrWv9w4qvasF9FW0g3ZxAFy3Zw1kJw45ZrZ3Xa1xWw17CF17
 AayDJFn3Ary8ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbskFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
 IFyTuYvjfUeAwIDUUUU
X-CM-SenderInfo: pw2kimo6pdxz3vow2x5qjk3toohg3hdfq/1tbiAgQFEV7nE6ek0gAAsp
Cc: tangzhenhao <tzh18@mails.tsinghua.edu.cn>
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

    At line 362 in drivers/iommu/fsl_pamu_domain.c, the ret-val of kmem_cache_zalloc should be checked to avoid null-ptr-deref bug.

Signed-off-by: tangzhenhao <tzh18@mails.tsinghua.edu.cn>
---
 drivers/iommu/fsl_pamu_domain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index b2110767caf4..9ebd5135f4a8 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -360,6 +360,10 @@ static void attach_device(struct fsl_dma_domain *dma_domain, int liodn, struct d
 	}
 
 	info = kmem_cache_zalloc(iommu_devinfo_cache, GFP_ATOMIC);
+	if (!info) {
+		pr_debug("device_domain_info allocation failed\n");
+		return;
+	}
 
 	info->dev = dev;
 	info->liodn = liodn;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
