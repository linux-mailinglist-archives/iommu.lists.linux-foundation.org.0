Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9E01158B1
	for <lists.iommu@lfdr.de>; Fri,  6 Dec 2019 22:38:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D6746204DE;
	Fri,  6 Dec 2019 21:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oNl4yoVUeDek; Fri,  6 Dec 2019 21:38:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 24409204F7;
	Fri,  6 Dec 2019 21:38:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D34DC077D;
	Fri,  6 Dec 2019 21:38:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AF40C077D
 for <iommu@lists.linux-foundation.org>; Fri,  6 Dec 2019 21:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3FBFA204EF
 for <iommu@lists.linux-foundation.org>; Fri,  6 Dec 2019 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLNjPh-Z7CVE for <iommu@lists.linux-foundation.org>;
 Fri,  6 Dec 2019 21:38:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 41C9D204DE
 for <iommu@lists.linux-foundation.org>; Fri,  6 Dec 2019 21:38:50 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id s35so3277413pjb.7
 for <iommu@lists.linux-foundation.org>; Fri, 06 Dec 2019 13:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZlgEGCoRBrwllaA7U2SAUVjC8HUYX60EMP5Y/3amAn0=;
 b=jgEJU+As5FSIOZlub2wjdTo8pVKmMIzTJr5KFD9NVZW/pwk10dhIFY3kkKPd4uQkFO
 K2Pqze31q2Jb6OFBkKYzHRkpGKc2zYgv86fBdP3lKy6CrfnOojTUndvbyEApTpueuk5R
 LKbZ+99rTKeaT/6kNTrom+qf0z0Av2QEHX6p6SyxL2rdjsCMLEwsn8Sn4KLopjGJz6ws
 occ+gBZw7JWqH4qyUz3ZFM+2dPMLO0rtttxR0MlqSqORqjBIy/vvqAFLfmWshGWgPlX7
 zn596lEZj6+KeNMMIMLPT9rzjagTBbwVfZm/KvV6lAFnc4D/pUjk63kJ5CTxy+X+xNtG
 Po0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZlgEGCoRBrwllaA7U2SAUVjC8HUYX60EMP5Y/3amAn0=;
 b=m5TFq2Ffac+IiFQgBRxSXFO/jhzE1u9JVPVTKy0Wv/MxOVwObbBZ3BsPEkVT1ba/E8
 PNG8iCV0KKoHsNCkVbgijq9GaMFKEybDYDRtAfof75lRmTh5bADBc/80Cn/m5FCuEy9r
 8CmrIZSWUrWhm94GbBXIlayzT8wk3vzC/jMIRz4PNbpcAOfl7/QwABCmzXX2sVSW9QhS
 kAZOqUoYtAuRQW4IsVuZ6FRF0xqtkhugQsaPro2aHlrigZclXTYl5E2DfnwkCRy1tDWJ
 dNyvH3PPNzbhZX9EJlphblRcjM+jfZxYh595KOkj1rU5ugUoGRvu5e9nI6OmHZCgQMu8
 te4w==
X-Gm-Message-State: APjAAAXw+yZCmFc6xjaS/xLgxKcK7qQkSGM40ircWsAqgFaJGIJPJZEu
 Y6gvAqwmgmGPPtasWBzjdAvWwqfP+Y4=
X-Google-Smtp-Source: APXvYqxe4zVmJNJ/Y2SwMtb3yAWgZFOU/4WmWsfv9qXCGeY4gymy26reF+DXb4wxVC87ebaO89EKMQ==
X-Received: by 2002:a17:90a:8c12:: with SMTP id
 a18mr9384987pjo.53.1575668329626; 
 Fri, 06 Dec 2019 13:38:49 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
 by smtp.gmail.com with ESMTPSA id d65sm17368579pfa.159.2019.12.06.13.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 13:38:48 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [Patch v3 0/3] iommu: reduce spinlock contention on fast path
Date: Fri,  6 Dec 2019 13:38:00 -0800
Message-Id: <20191206213803.12580-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.0
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

This patchset contains three small optimizations for the global spinlock
contention in IOVA cache. Our memcache perf test shows this reduced its
p999 latency down by 45% on AMD when IOMMU is enabled.

Cong Wang (3):
  iommu: avoid unnecessary magazine allocations
  iommu: optimize iova_magazine_free_pfns()
  iommu: avoid taking iova_rbtree_lock twice
---
 drivers/iommu/iova.c | 75 ++++++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 30 deletions(-)

-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
