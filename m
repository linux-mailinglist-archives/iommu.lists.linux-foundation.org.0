Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDEC104781
	for <lists.iommu@lfdr.de>; Thu, 21 Nov 2019 01:26:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C48D287CDA;
	Thu, 21 Nov 2019 00:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRmiYlJODuEC; Thu, 21 Nov 2019 00:26:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA26987CE4;
	Thu, 21 Nov 2019 00:26:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C451DC18DA;
	Thu, 21 Nov 2019 00:26:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22AE0C18DA
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 00:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1266586DC9
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 00:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7LFcOwp7utQ for <iommu@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 00:14:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ADD2386A2D
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 00:14:27 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b19so657584pfd.3
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 16:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udQXwBqwVUeF6xC6dQa8BSO4hgjarlIB0Nc7lZHwUEA=;
 b=PmTUpgmcsZD3GF/gHlUVnQ7Wd6qGzBXJRebg41O5KVp5B4SGj1iQoNT6vrG16K1vWv
 PMW+ss1KwBjjxcowPxX0G5tfmjwtDcoxYWSqXxGzroRbZ7+ReUh5wNat1j67hfHawzPy
 l5xUJpSiqCwH+BdW8gVIEMDYEv6S6X4xCId+oIOFcRvlf50SDCGE9o58neccf4tXAnEs
 Sz62fIvYg0WHp4Ade1Vfm0ToGQ26feG2MYMWjgmrAn+xJweDd/aN43V5GrGNfAS+ga9X
 VrjormozWMpTexqanVuLBV1MtPIsvqzloBjV4DEdsDLZT2uNeWG32eNAsY1glpl9Humz
 gGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udQXwBqwVUeF6xC6dQa8BSO4hgjarlIB0Nc7lZHwUEA=;
 b=nVg6ourhcLGSb2u99Eh5lNhQVv5oe6LIfnmaRQb/2OXAI6ebrbriqdRvpVlL9Shz5t
 z8RAfyiY2i8NNdKHKGTnOVI2RVScd0hx2ASNzjLxYgRSrSVbpEHw09Gp24HgEjufIurc
 A7ztVquuErKiPHajMsmkP46YO6ZcavGOYGyf9lLKfekCr531docxwW4lVVhoD7gzOGJD
 bF0KElsF4sFxWt2D3FmuSvSsMvG2XZ/6OCuymSHBFkczvDcoIhdUIN9vucNvZmLR8aQ1
 RXqo8IDbVDNiKdwNAEu8tnm6bfzjHxHlcE2gn+tYxjPu6O4HXlE1BWaK7uxs34npQPjl
 raVw==
X-Gm-Message-State: APjAAAXHHX95UDGCK71Wh6yvsvuqBxAJ9v4UP+YsHbU9aG/KEy4cE48K
 Bqi8AzTBL7Qp1husiQrB/E7BEodUlIA=
X-Google-Smtp-Source: APXvYqx70jN/lPvZpOJJEJjwiAVrjv2LEdf58Rsl9gZ8a1GGPTbJPowBV+wmAhPAjJGY0xKjB0p9Ag==
X-Received: by 2002:a63:5551:: with SMTP id f17mr6048190pgm.287.1574295267007; 
 Wed, 20 Nov 2019 16:14:27 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
 by smtp.gmail.com with ESMTPSA id r4sm565981pfl.61.2019.11.20.16.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 16:14:26 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 3/3] iommu: avoid taking iova_rbtree_lock twice
Date: Wed, 20 Nov 2019 16:13:48 -0800
Message-Id: <20191121001348.27230-4-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121001348.27230-1-xiyou.wangcong@gmail.com>
References: <20191121001348.27230-1-xiyou.wangcong@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Nov 2019 00:26:19 +0000
Cc: Cong Wang <xiyou.wangcong@gmail.com>, linux-kernel@vger.kernel.org
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

Both find_iova() and __free_iova() take iova_rbtree_lock,
there is no reason to take and release it twice inside
free_iova().

Fold them into the critical section by calling the unlock
versions instead.

Cc: Joerg Roedel <joro@8bytes.org>
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
---
 drivers/iommu/iova.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index b82c6f1cbfc2..ba6bd33f2b16 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -390,10 +390,14 @@ EXPORT_SYMBOL_GPL(__free_iova);
 void
 free_iova(struct iova_domain *iovad, unsigned long pfn)
 {
-	struct iova *iova = find_iova(iovad, pfn);
+	unsigned long flags;
+	struct iova *iova;
 
+	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
+	iova = private_find_iova(iovad, pfn);
 	if (iova)
-		__free_iova(iovad, iova);
+		private_free_iova(iovad, iova);
+	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
 
 }
 EXPORT_SYMBOL_GPL(free_iova);
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
