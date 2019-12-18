Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F3201123E98
	for <lists.iommu@lfdr.de>; Wed, 18 Dec 2019 05:40:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9B9752283A;
	Wed, 18 Dec 2019 04:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMSVwZ06wEq2; Wed, 18 Dec 2019 04:40:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0A12922844;
	Wed, 18 Dec 2019 04:40:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0849C077D;
	Wed, 18 Dec 2019 04:40:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23A62C077D
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 04:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 11894878A4
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 04:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GvaeYmzarcRm for <iommu@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 04:40:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7340384332
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 04:40:18 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s64so541361pgb.9
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 20:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HQJWlXLG6wIwMc0aEcbqaUZ0sC986f7UTtyRAVS20kc=;
 b=UL0PfpNM1vMMyCDUHBSnIFUHHrh3Vn6JWSKqsuKHxs34u58j2OEtg87+kqO/Fb0rNh
 NPFKLSPkfBl0slk9ERABT+HIp+YdWrEgxoroON1zDP/qhCOhurrsNhaL2isRr3rSJqj/
 Mpi2hqGwLa88m2W8+iX8YoOAJu7Pv0sPPdISUvl7y+0BNwfbydadsDOcLHEuwk28OwC4
 Lv2GbBcl1EGV5GvvXJQVWlMQKIrfRmFUJ0IciOmvObSVcO7BxFAGQLTeCfvVJIqa7oFr
 Lmo0wGhulCkYiVAjcLUcQfO6QwepXR8rks5XeNepM0CSJjFjWqCQYqW670YjSvNj1mlQ
 PVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HQJWlXLG6wIwMc0aEcbqaUZ0sC986f7UTtyRAVS20kc=;
 b=WTffR4CfXadZme0SIE+I34Nwp/rg6WwOuqHdNzmAlRwdh2dHROIApTcu2sorpdUCkr
 g/+YvJsqHO/1Pm39dpB80BVQmq/mV3KVdcp9Jmgb33ixs6jZfpC0jwIkqIdjwCZk9FkP
 4JoLu5E250/Kv8VyLuX01yWnOMlyvrbrhqJ+s1E4vSEb2D130q5eMrqpWXN7DOzUn6zw
 00QtMPJlXl2t037CRFd0gxeEG6jLdsQB+fF1BibFekjnTaU5x0oLOyTNeQS3ikddIp1W
 PXhgJzgCby2n/Lvp2UvTtyWOGSfZlSaTAgfTEA6fCh1BMJE5jMRMFkQ1K102T3udWI8O
 uFLw==
X-Gm-Message-State: APjAAAUQ0QGb7WOEuKIp+eEeQPt2KrHf5IiPZF7JhtsarJIpST2Lvkmr
 y5RZTHfWas/meWlW25Y5meQJUXPeILo=
X-Google-Smtp-Source: APXvYqx4iNPHn22Lr5oaFHZmr8Lnu+1lktiB7oRLjpeOEOd9kUF651mdDGt88/A5DCgd46IlHm3fVQ==
X-Received: by 2002:a63:f202:: with SMTP id v2mr679275pgh.420.1576644017839;
 Tue, 17 Dec 2019 20:40:17 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
 by smtp.gmail.com with ESMTPSA id j21sm781105pfe.175.2019.12.17.20.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 20:40:17 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [Patch v3 0/3] iommu: reduce spinlock contention on fast path
Date: Tue, 17 Dec 2019 20:39:48 -0800
Message-Id: <20191218043951.10534-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.0
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

This patchset contains three small optimizations for the global spinlock
contention in IOVA cache. Our memcache perf test shows this reduced its
p999 latency down by 45% on AMD when IOMMU is enabled.

(Resending v3 on Joerg's request.)

Cong Wang (3):
  iommu: avoid unnecessary magazine allocations
  iommu: optimize iova_magazine_free_pfns()
  iommu: avoid taking iova_rbtree_lock twice

---
v3: improve changelog, no code change
v2: fix a memory leak

 drivers/iommu/iova.c | 75 ++++++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 30 deletions(-)

-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
