Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A02DB12A296
	for <lists.iommu@lfdr.de>; Tue, 24 Dec 2019 15:47:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5730E203C3;
	Tue, 24 Dec 2019 14:47:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ha6jTBU7X9kI; Tue, 24 Dec 2019 14:47:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 61A9520369;
	Tue, 24 Dec 2019 14:47:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F69DC1D87;
	Tue, 24 Dec 2019 14:47:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A36BDC0881
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 14:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8E41284A0F
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 14:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xkJeNXPljHw8 for <iommu@lists.linux-foundation.org>;
 Tue, 24 Dec 2019 14:47:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 23F31849B7
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 14:47:02 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so5596783plp.6
 for <iommu@lists.linux-foundation.org>; Tue, 24 Dec 2019 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GkExCG2DHt8H34ZdrbZclhbhYd3kEbl8+/TGe4GGMP0=;
 b=VXjpYhuu3thC1XwrKwpLpDUSlTSqgYCLMqu0SGmI+o9BU46mP8HIuzIc89AGazUJMd
 gJV72undeLZ/zt0TS2y9ntI2kSKTn1tnb452AB/fkMOrTH1H1XmW7Tjvw25mZ9sbfczJ
 I0komnqdUDVep8gfiW4TxaVJJ67sGIkej84tnVFgjOnYSll5aID0HKJFqLwDOzeVQr+I
 N9nqHZw69egm8hJSRYBsGOVIFeTXHIQCZall/9A5F4SEL4kw9P2+WSqqYPM61G38jokP
 OtTQQlW2MBzii8G5u9XCZijHbM6/tIP4nSxHQw3JdM9F4/PoZ0iG/pYS5cSkuAFYJJWx
 rlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GkExCG2DHt8H34ZdrbZclhbhYd3kEbl8+/TGe4GGMP0=;
 b=M85l9NHKCNNoLfCQT34ZVmgsk8xPNkgmlPfm7MPO7ED7ovjv9xwoUSntW6iw1o2tlN
 etlqDDh8SQXf5RtfBaCDs/PQIs3E3aiaW9obBB2GZQNe6j3fCNGwJR3Hb6782PC61J2q
 JDVPCWZJaeYsSmrkWMAir5Wl7i8xkRCyaQv1gwepGWEVEkhpn8ONDMNQnqUK76KtMkql
 EsT5LTsURpARyomZClcobXNq3Ro/foKwfBrlI5IFBPGoQJrFaZEAH/mVenwIw9KXD30l
 0hyOSZnJhAruSIlkmpJqdE1j2xydJ8Xwks9Auj2zeAmdUDhR0nxplYgWRbvj7E8DIOjI
 aOxA==
X-Gm-Message-State: APjAAAVpaDJmCKO5OnwS68koQhFKbygJ1JhJA+XcmHjmroM9TpW4ex+H
 4XuYRQamM6Owjq8IGQsmOls=
X-Google-Smtp-Source: APXvYqxCiOjvtxh8ME8+8SviNtQ09l3KRj6BrsO6yTe6mxFuxeEdSvyRMFJIpoqSA7jkKsMvq7VmoA==
X-Received: by 2002:a17:902:ba86:: with SMTP id
 k6mr1106802pls.96.1577198821605; 
 Tue, 24 Dec 2019 06:47:01 -0800 (PST)
Received: from AHUANG12-1LT7M0.lenovo.com (1-175-124-65.dynamic-ip.hinet.net.
 [1.175.124.65])
 by smtp.googlemail.com with ESMTPSA id m6sm3586861pjn.21.2019.12.24.06.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2019 06:47:00 -0800 (PST)
From: Adrian Huang <adrianhuang0701@gmail.com>
X-Google-Original-From: Adrian Huang <ahuang12@lenovo.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/1] iommu/amd: Remove local variables
Date: Tue, 24 Dec 2019 22:46:47 +0800
Message-Id: <20191224144647.17885-1-ahuang12@lenovo.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>
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

From: Adrian Huang <ahuang12@lenovo.com>

The usage of the local variables 'range' and 'misc' was removed
from commit 226e889b20a9 ("iommu/amd: Remove first/last_device handling")
and commit 23c742db2171 ("iommu/amd: Split out PCI related parts of
IOMMU initialization"). So, remove them accrodingly.

Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
---
 drivers/iommu/amd_iommu_init.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
index ba7ee4aa04f9..2cc7d61b1802 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd_iommu_init.c
@@ -1718,7 +1718,7 @@ static const struct attribute_group *amd_iommu_groups[] = {
 static int __init iommu_init_pci(struct amd_iommu *iommu)
 {
 	int cap_ptr = iommu->cap_ptr;
-	u32 range, misc, low, high;
+	u32 low, high;
 	int ret;
 
 	iommu->dev = pci_get_domain_bus_and_slot(0, PCI_BUS_NUM(iommu->devid),
@@ -1731,10 +1731,6 @@ static int __init iommu_init_pci(struct amd_iommu *iommu)
 
 	pci_read_config_dword(iommu->dev, cap_ptr + MMIO_CAP_HDR_OFFSET,
 			      &iommu->cap);
-	pci_read_config_dword(iommu->dev, cap_ptr + MMIO_RANGE_OFFSET,
-			      &range);
-	pci_read_config_dword(iommu->dev, cap_ptr + MMIO_MISC_OFFSET,
-			      &misc);
 
 	if (!(iommu->cap & (1 << IOMMU_CAP_IOTLB)))
 		amd_iommu_iotlb_sup = false;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
