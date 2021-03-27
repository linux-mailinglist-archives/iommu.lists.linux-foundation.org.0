Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 489D134B591
	for <lists.iommu@lfdr.de>; Sat, 27 Mar 2021 10:07:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB110418A3;
	Sat, 27 Mar 2021 09:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbIdKNXnAzGH; Sat, 27 Mar 2021 09:07:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA89141899;
	Sat, 27 Mar 2021 09:07:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98CB7C000A;
	Sat, 27 Mar 2021 09:07:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C7F0C000A
 for <iommu@lists.linux-foundation.org>; Sat, 27 Mar 2021 09:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFF2541899
 for <iommu@lists.linux-foundation.org>; Sat, 27 Mar 2021 09:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r6-hldXlTmpE for <iommu@lists.linux-foundation.org>;
 Sat, 27 Mar 2021 09:06:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E99B41896
 for <iommu@lists.linux-foundation.org>; Sat, 27 Mar 2021 09:06:58 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id x14so7727072qki.10
 for <iommu@lists.linux-foundation.org>; Sat, 27 Mar 2021 02:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3xFUEEjk1R6V954kOkR3VitDD2VOgrO9rQoJENyduVM=;
 b=tVd4FNWFbtE1uVol006rHitU7OnzHtpqv2PWXpH/WaU7RVXQ4QsFqTFqnYncHwxEAH
 jMy25cGOKWmDvkEnwuuaFc13Z+koWevLCH5H3VJjgaeMnL6vpG0tpTlLWrXHRsHNTM1F
 ZU/p4106B1OdoAau7ReKXMO7WY/ALV3seN2/yPOhY9yb27OB4ek8JzUSOghWnBQuXgAm
 Z50UJ1NXHd3FvKL3/0gNShW9urkUjJ92omGcP8mitYYclDiTyUsXVaZyrMSVGgJ1+WIA
 tgzm0x6ZPY4Vq7l57N5DfkUi/ErYKVK0sA/EHOnWr8vo7HNlvfh30dy/UzY8klfXoemV
 wkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3xFUEEjk1R6V954kOkR3VitDD2VOgrO9rQoJENyduVM=;
 b=Aajm56/GKnMAsvbHZdTFyLg5ZTeOcoIDAt/fqgxGSa3yqpro0M0gz2wZOc/thJ4P3m
 Mgu0m7p1/pm5tDpXv/vZufJWOMcO+B3kP51xLt57hg4HSSHJWrl7BzBiGHFIpG3swVY4
 p7Iapbbop97kkEaEt+oh64wD8w94dvScRVGhL9sR/+MhBO/Efwym5anfH31zddHMYi6H
 SBW1nG4SXKsRbMXDopkML2vEdAg9lM9o4qu69ocJUxpRW7guljpbIs5wLZ4Bu6VWfTnY
 mJiQJF2tmVHuPjs5QB/UcGG19AM5u2cjw3VPCg/Ae87qZFO2wgR06wehBTF9jcYXZ57V
 Ycig==
X-Gm-Message-State: AOAM532Xu9QYCib6NpxjbtyONsGuJmoZtrj5b7+pCXs3sDJ0a+RMTXTO
 nr9CPO7L6MBBXmsLgP3zYR2BGFmRL3s=
X-Google-Smtp-Source: ABdhPJwdo+J1vyCPh/ULDa+uc5x+NQEISd2er7Y6uUPd5uMhb02hSKnBeSRosTMAzfxCLjNMsOJiUQ==
X-Received: by 2002:a05:620a:11ad:: with SMTP id
 c13mr16877152qkk.282.1616836017124; 
 Sat, 27 Mar 2021 02:06:57 -0700 (PDT)
Received: from localhost.localdomain ([50.236.19.102])
 by smtp.gmail.com with ESMTPSA id c19sm8064126qkl.78.2021.03.27.02.06.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Mar 2021 02:06:56 -0700 (PDT)
From: xiangxia.m.yue@gmail.com
To: iommu@lists.linux-foundation.org
Subject: [PATCH] iommu: remove unused variable 'ops'
Date: Sat, 27 Mar 2021 17:02:25 +0800
Message-Id: <20210327090225.22737-1-xiangxia.m.yue@gmail.com>
X-Mailer: git-send-email 2.15.0
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

From: Tonghao Zhang <xiangxia.m.yue@gmail.com>

ops was not used in iommu_bus_init, remove it now.

Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
---
 drivers/iommu/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d0b0a15dba84..99462531a5ff 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1799,7 +1799,7 @@ int bus_iommu_probe(struct bus_type *bus)
 	return ret;
 }
 
-static int iommu_bus_init(struct bus_type *bus, const struct iommu_ops *ops)
+static int iommu_bus_init(struct bus_type *bus)
 {
 	struct notifier_block *nb;
 	int err;
@@ -1860,7 +1860,7 @@ int bus_set_iommu(struct bus_type *bus, const struct iommu_ops *ops)
 	bus->iommu_ops = ops;
 
 	/* Do IOMMU specific setup for this bus-type */
-	err = iommu_bus_init(bus, ops);
+	err = iommu_bus_init(bus);
 	if (err)
 		bus->iommu_ops = NULL;
 
-- 
2.14.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
