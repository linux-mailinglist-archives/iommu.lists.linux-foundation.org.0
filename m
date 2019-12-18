Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F40CD123E9D
	for <lists.iommu@lfdr.de>; Wed, 18 Dec 2019 05:40:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A87C686A99;
	Wed, 18 Dec 2019 04:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5WkMa4x9PCW; Wed, 18 Dec 2019 04:40:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A5ECC86AB5;
	Wed, 18 Dec 2019 04:40:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C914C1797;
	Wed, 18 Dec 2019 04:40:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9038C077D
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 04:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 952768833F
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 04:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xb0j9mdHYNaN for <iommu@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 04:40:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3D86C88338
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 04:40:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 4so485812pfz.9
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 20:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=buvyJgIJY0R4gHfuaJpwEN38gwzHGwHEA+PtuFw57xs=;
 b=fSA6/OU6RZ4QSFkEveLrXMk7xfGo5Yml/4SapAlwGdyCNgt6hZvHpVJXueStFSsHRU
 E8cFUeFs80hq2ijU88iVgMzJbyAijs5ff9wE+NkkPiF2iJ9XGAthOz03SFgeQWN93Knc
 sxUokcCF+H9YitQqotepfn0/Z+vKvmrvDGp4PEfaS7oVzHaxx05dJjcuH1bLCw0F3GqB
 lBkVZB4XUJaRNgt7fr2Hd2Q8sbpoGUwVLYsgo6nGcVoUf+zHKWshZZBBA+L+Wcw3OsUZ
 B1eLZ2zD8Fs8xMcZ7wPwo4dThIhjfnksWJgczgKpxlIh5m6nPrk12rGDUrhJgCbdp9tY
 aWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=buvyJgIJY0R4gHfuaJpwEN38gwzHGwHEA+PtuFw57xs=;
 b=tJzlAXdPTrnxBee1srkrZtbwVaFD0RC7rh8IA/HuCGylWj5fWOYPt/haE9FOwhj90c
 Vd89AN9/TL/9a30Nk7a2jRYMB2LCAmhGzSv7ap7RpMKLn28mGk479W2+HGXWRe8zIT8q
 KW+Rm8j9dAviSn7k/AQBGHKrRTXsw9Exm7UwUu2VTlLys7EI8HBqa//kzyG2qn43mwdA
 r7O334nJGs+ESKekW7Tf5SVz4OAJtTXSXjcrY1Jn1qLptIsMZesgXus7jN6rx9oFvNry
 33VAx5oIhnAuz/M2cgpKAxMWHLmlqYkpNU64+GJvCx8WQrKTJlNxUOTTGzb+z3/VecNr
 lnEw==
X-Gm-Message-State: APjAAAUnIBE8wNebYd0crk8vVp2aCy9WvgxuqxuM+YN8TAdYUATILhpF
 IJiz3kZ8zQ7brg1jLNT1lBpkDPFctto=
X-Google-Smtp-Source: APXvYqzYkNMV1tAM39yw129obSP47Du+yTcT5HVPg0cGDvNIcUAUzXmE7cRKZdrBA9z1l687aXPNXA==
X-Received: by 2002:a62:8205:: with SMTP id w5mr831686pfd.136.1576644020754;
 Tue, 17 Dec 2019 20:40:20 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
 by smtp.gmail.com with ESMTPSA id j21sm781105pfe.175.2019.12.17.20.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 20:40:20 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [Patch v3 3/3] iommu: avoid taking iova_rbtree_lock twice
Date: Tue, 17 Dec 2019 20:39:51 -0800
Message-Id: <20191218043951.10534-4-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191218043951.10534-1-xiyou.wangcong@gmail.com>
References: <20191218043951.10534-1-xiyou.wangcong@gmail.com>
MIME-Version: 1.0
Cc: Cong Wang <xiyou.wangcong@gmail.com>, robin.murphy@arm.com,
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

Both find_iova() and __free_iova() take iova_rbtree_lock,
there is no reason to take and release it twice inside
free_iova().

Fold them into one critical section by calling the unlock
versions instead.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: John Garry <john.garry@huawei.com>
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
---
 drivers/iommu/iova.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 184d4c0e20b5..f46f8f794678 100644
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
