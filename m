Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEFCA02D0
	for <lists.iommu@lfdr.de>; Wed, 28 Aug 2019 15:13:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4D80E2F63;
	Wed, 28 Aug 2019 13:13:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 264C81F26
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 13:13:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com
	[209.85.221.202])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 73EBA13A
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 13:13:43 +0000 (UTC)
Received: by mail-vk1-f202.google.com with SMTP id v63so1184292vkb.18
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=2uraJyf6YkQQQi+GjgA0Euznea67jY0h3NcNTgfEE6E=;
	b=krpjyvPl4LV2Qp+9bxrX89f65tIa90HGC+HFV5rCeRCZ2Kify9kiCPez94yN8srqEe
	lF+iaLa/UcZn4j756/FDjGcCZ0fi4GAImCz5nAKjfHbDVT4WihMlJOA0Oqe8/oU0YGwb
	Ld33DNMmuOqncMmBjsxdkFdvO20z+TkgT4PefRIYKIBpXFcXzihDFcx0+HYRLWrzVt0z
	Y7v7VnMqtFJ/H51CNlWRxy/3Fa6SCQyge9Dfc/AvqyjN+8IBUTQoqfTpv9OXaM4uCDMu
	tTEYpdiWaBNUKVP37xirxcot4wu+OthQfooyIBAkDMtVrRe6c9qMKF2yFsg7vRx5S76T
	eOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=2uraJyf6YkQQQi+GjgA0Euznea67jY0h3NcNTgfEE6E=;
	b=rLq7qQ+kC2Z+4KosDHhhjzrus+MSWipXFj8lhRXSgLC7tl0Q1eN4rLqLdJvSukBPt9
	Dt9jHGYve0ysQqZ48Pp1O6DH8GrsijuZHcVUiNGHERUNmJRMfrwH6hX2zv98WQwX85QI
	/UgIFaceuhDhhHJ0k0vZQZGUi0K7fQ+CZuE6uzTJFzOwyqlyIL572mR2OT1fNJMMI5Tm
	42Vq6U3cUnpCpuAuuypaZ5C9Mcm/EiA34bhWgn/P6Y1sDUuspUQDflCWAD6KPUB8o2kr
	eKKo6d2goR4bJZLglAkK2h/jb0vbXrRqLf5hKd76UVpaJ6ZCBWD3W5PkxaCDHaf2X3Lq
	Wp/w==
X-Gm-Message-State: APjAAAVGJSWjLqRvaY2xwn33/Cz7pLwJRs8PIkVslS042WbuG1Qy7+jZ
	ATtSfW18wFcWnFHc1GCI2xhuSotM/KYbVA==
X-Google-Smtp-Source: APXvYqxwaE69Ih/IcaBEjoZYAtqpyYGYen7SRacn6ADCDqJa8PItgJpR3VuZvxi6a1jkwLHNsHIcq0P0fvxZJQ==
X-Received: by 2002:a67:d02:: with SMTP id 2mr2090357vsn.43.1566998022308;
	Wed, 28 Aug 2019 06:13:42 -0700 (PDT)
Date: Wed, 28 Aug 2019 06:13:38 -0700
Message-Id: <20190828131338.89832-1-edumazet@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH] iommu/iova: avoid false sharing on fq_timer_on
To: Joerg Roedel <jroedel@suse.de>
X-Spam-Status: No, score=-9.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jinyu Qi <jinyuqi@huawei.com>, iommu@lists.linux-foundation.org,
	Eric Dumazet <eric.dumazet@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Eric Dumazet <edumazet@google.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
From: Eric Dumazet via iommu <iommu@lists.linux-foundation.org>
Reply-To: Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

In commit 14bd9a607f90 ("iommu/iova: Separate atomic variables
to improve performance") Jinyu Qi identified that the atomic_cmpxchg()
in queue_iova() was causing a performance loss and moved critical fields
so that the false sharing would not impact them.

However, avoiding the false sharing in the first place seems easy.
We should attempt the atomic_cmpxchg() no more than 100 times
per second. Adding an atomic_read() will keep the cache
line mostly shared.

This false sharing came with commit 9a005a800ae8
("iommu/iova: Add flush timer").

Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Jinyu Qi <jinyuqi@huawei.com>
Cc: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iova.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 3e1a8a6755723a927a7942a7429ab7e6c19a0027..41c605b0058f9615c2dbdd83f1de2404a9b1d255 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -577,7 +577,9 @@ void queue_iova(struct iova_domain *iovad,
 
 	spin_unlock_irqrestore(&fq->lock, flags);
 
-	if (atomic_cmpxchg(&iovad->fq_timer_on, 0, 1) == 0)
+	/* Avoid false sharing as much as possible. */
+	if (!atomic_read(&iovad->fq_timer_on) &&
+	    !atomic_cmpxchg(&iovad->fq_timer_on, 0, 1))
 		mod_timer(&iovad->fq_timer,
 			  jiffies + msecs_to_jiffies(IOVA_FQ_TIMEOUT));
 }
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
