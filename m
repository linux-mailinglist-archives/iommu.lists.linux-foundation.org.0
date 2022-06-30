Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBFF561CA3
	for <lists.iommu@lfdr.de>; Thu, 30 Jun 2022 16:00:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDE93423F2;
	Thu, 30 Jun 2022 14:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDE93423F2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CrZpADPV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMVBtvjN5ZXZ; Thu, 30 Jun 2022 14:00:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BB5A0423C2;
	Thu, 30 Jun 2022 14:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB5A0423C2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F026C0036;
	Thu, 30 Jun 2022 14:00:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 207F2C0011
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 06:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 082DA40A65
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 06:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 082DA40A65
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CrZpADPV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EwcD0cxFTbkg for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jun 2022 06:40:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39DAD4010E
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39DAD4010E
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jun 2022 06:40:15 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id e2so25232252edv.3
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jun 2022 23:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5YRjk+I1tOU+IE/aXdonB59E6sy7aNXVn8XEDauefqQ=;
 b=CrZpADPV9qdNUMyNR0WCBSyyHAhUtDgoCe0NWzMNFi7M0+7nQsggCNreJqHql8H0fW
 KlM22JXiYUrKpr5EJ6rPKnNYXjnARkmT5KB4NB/pCauB+Th4HD0raxHvl2s5mWV+3lCm
 zKjto8Ywx97VLoTHMQqZGZbOjpJ792BwqAqHE9tXD5QOOFY2LVyk6NqsGsJWAz7hziTA
 4Vb1pWTLsq7a1L0ezJz/P61elhmqGzWJ0UixxQAVgqv8biN+mLnS4NwvBP7Ly73s1ZyK
 PVskO49lOWESGRRH/ESlnaQ3KWrWC331sruD+A1XHMOePno/2SStnsvFH6rkf+tvQFSy
 LFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5YRjk+I1tOU+IE/aXdonB59E6sy7aNXVn8XEDauefqQ=;
 b=0BJldErV/SiL2W/+/wsWGPkmNevEmeiaOcf5vAXgrXAwsCxlpEO8Tfonms+If85qjP
 nm0CoZkirFWZvTOWaxMBLMYFhhkZn9K+Bzc4pQXOTmuznvJwK8RdNhgeQuTFtvEkNf7e
 Qb31MWl2Q4GJQjWWGsakHKPOVmgDCMfqUIpKausWNp+YS3km8ErwYt+40bWapF1hNGK2
 fvU1FBDbLPUJmVsH8xs24oypE0EPrZ+WTkWZOGDuBtXpmZ17gz9uNVUOGbMeMx7C4fiW
 WqxPNCQSQsUBOXzOjt9irKPvzHwzDYDSmnD/KUZYBxErfkO3E37boDkAnNsjm3oocKKT
 t8SA==
X-Gm-Message-State: AJIora9T/WeLtq3AH4TEuaPe2syD8Na1Er4M0cTsQOFBAwTeFAI23VhS
 /aw7Q5DonyuiIs7WhX8Ec4A=
X-Google-Smtp-Source: AGRyM1vRJhE//LmjjGmIeJh5OLMJsvM8XsEeSlrk8TO1LDZBLk7KUtQzYrQE/U3WiDU0tnr5r4BYPA==
X-Received: by 2002:a05:6402:50ce:b0:435:a2bf:e44d with SMTP id
 h14-20020a05640250ce00b00435a2bfe44dmr9465489edb.386.1656571213480; 
 Wed, 29 Jun 2022 23:40:13 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 g4-20020a170906868400b006fee98045cdsm8834469ejx.10.2022.06.29.23.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 23:40:13 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: will@kernel.org,
	joro@8bytes.org,
	robin.murphy@arm.com
Subject: [PATCH] iommu/arm-smmu-v3: Fix undefined behavior in GBPA_UPDATE
Date: Thu, 30 Jun 2022 09:39:59 +0300
Message-Id: <20220630063959.27226-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Jun 2022 14:00:37 +0000
Cc: iommu@lists.linux-foundation.org, Xenia Ragiadakou <burzalodowa@gmail.com>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

The expression 1 << 31 results in undefined behaviour because the type of
integer constant 1 is (signed) int and the result of shifting 1 by 31 bits
is not representable in the (signed) int type.

Change the type of 1 to unsigned int by adding the U suffix.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index cd48590ada30..44fbd499edea 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -96,7 +96,7 @@
 #define CR2_E2H				(1 << 0)
 
 #define ARM_SMMU_GBPA			0x44
-#define GBPA_UPDATE			(1 << 31)
+#define GBPA_UPDATE			(1U << 31)
 #define GBPA_ABORT			(1 << 20)
 
 #define ARM_SMMU_IRQ_CTRL		0x50
-- 
2.34.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
