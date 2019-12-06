Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FBD1158B7
	for <lists.iommu@lfdr.de>; Fri,  6 Dec 2019 22:39:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A813926423;
	Fri,  6 Dec 2019 21:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmpoO4O2rzqY; Fri,  6 Dec 2019 21:39:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C0561263F9;
	Fri,  6 Dec 2019 21:39:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEC96C077D;
	Fri,  6 Dec 2019 21:39:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B40AC077D
 for <iommu@lists.linux-foundation.org>; Fri,  6 Dec 2019 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EE70489275
 for <iommu@lists.linux-foundation.org>; Fri,  6 Dec 2019 21:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9O+a5Ftv5ku for <iommu@lists.linux-foundation.org>;
 Fri,  6 Dec 2019 21:38:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6E48D89278
 for <iommu@lists.linux-foundation.org>; Fri,  6 Dec 2019 21:38:59 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s18so3995432pfd.8
 for <iommu@lists.linux-foundation.org>; Fri, 06 Dec 2019 13:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=buvyJgIJY0R4gHfuaJpwEN38gwzHGwHEA+PtuFw57xs=;
 b=R8nRiiaFenf0S2R88EQdmqaDdEkzal1TT5LYPVJqdE3YdqF26NIAT4aivvlxoTcAha
 43Qgzo49EYxnR0j9ZtNH5O0d4se9QbhWp20Quu0EUliNxt370LnVL1eMI/iUwXJMPulq
 YA9lXAYBcBjysIKsp5Z0O098mvIt7WiCWJd0Dawa02xDJ59xsEmE3boZLhKwOm9dUfBe
 9YkFdTfRyqwt0tHr92XgZYHKaE0ovo7PPK8V1p1S9PsV00qsYj410ybPklavLDpdDWIE
 kpqNijDRaMCrK39LX80p2gPtUZ1FQGgeQcDI/qIMd51lrKgLSBpjH/bcKVFQwt4Seqog
 E3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=buvyJgIJY0R4gHfuaJpwEN38gwzHGwHEA+PtuFw57xs=;
 b=X6SXpUr314t30pG91tMWK+GoGcLPCP63fZaxIIEddNv9MAEKGwPitDiLbWxavKnMlf
 aANt80qC0yqzZG+AsHAAur2fRVrenfTj41WxXg+9G/IyvCiZekH0srGmXmBgwgo2Anpf
 MlZMjAqxOJUT5+7VCIoXH761CLBDj9nTwk53OSSL0ucs45J9hsbME0B/399IVGuukOgU
 JptTC9wpAK5pYvCaGRoyUReqUQqRBLjZ1QZfomJOySVrpjOD8wiZTvB4YbSdy5Q/vt1/
 /nraNYTS8hsMmV/eSwwkZykZriWOBYwx+a4QEx+c3POAnwWDMAGQrWkFEMjaarxMzrRP
 jf3A==
X-Gm-Message-State: APjAAAXTv7t1an3w+OlRkdgwLuqMT8/uK8OV4x6lRGesheAzOYsld0g5
 CSj9WsJPu8DPLTDqFatmkDQfN6/BACM=
X-Google-Smtp-Source: APXvYqxXY0wRv1On4fHZpoVxEfqL3TRfZrkRbl55+hRkNwdTrHFwMh1XpW6Bq564Df40fsqvpr5qbQ==
X-Received: by 2002:a65:4d46:: with SMTP id j6mr6030301pgt.63.1575668338823;
 Fri, 06 Dec 2019 13:38:58 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
 by smtp.gmail.com with ESMTPSA id d65sm17368579pfa.159.2019.12.06.13.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 13:38:58 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [Patch v3 3/3] iommu: avoid taking iova_rbtree_lock twice
Date: Fri,  6 Dec 2019 13:38:03 -0800
Message-Id: <20191206213803.12580-4-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206213803.12580-1-xiyou.wangcong@gmail.com>
References: <20191206213803.12580-1-xiyou.wangcong@gmail.com>
MIME-Version: 1.0
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
