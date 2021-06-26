Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CA93B4D5C
	for <lists.iommu@lfdr.de>; Sat, 26 Jun 2021 09:27:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C47DD4038F;
	Sat, 26 Jun 2021 07:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwSa8FcaS5Zx; Sat, 26 Jun 2021 07:27:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A239A40384;
	Sat, 26 Jun 2021 07:27:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65AE3C001D;
	Sat, 26 Jun 2021 07:27:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACDCDC000E
 for <iommu@lists.linux-foundation.org>; Sat, 26 Jun 2021 07:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8552940379
 for <iommu@lists.linux-foundation.org>; Sat, 26 Jun 2021 07:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zNmgsGKr-1y for <iommu@lists.linux-foundation.org>;
 Sat, 26 Jun 2021 07:27:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1DA640375
 for <iommu@lists.linux-foundation.org>; Sat, 26 Jun 2021 07:27:04 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GBlj962tnz74RW;
 Sat, 26 Jun 2021 15:23:41 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 15:26:58 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 15:26:57 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Arnd Bergmann <arnd@arndb.de>, <linux-arch@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/9] sections: Unify kernel sections range check and use
Date: Sat, 26 Jun 2021 15:34:30 +0800
Message-ID: <20210626073439.150586-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Cc: linux-s390@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org
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

There are three head files(kallsyms.h, kernel.h and sections.h) which
include the kernel sections range check, let's make some cleanup and
unify them.

1. cleanup arch specific text/data check and fix address boundary check in kallsyms.h
2. make all the basic kernel range check function into sections.h
3. update all the callers, and use the helper in sections.h to simplify the code
4. use memory_intersects() in sections.h instead of private overlap for dma-debug

Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-arch@vger.kernel.org 
Cc: iommu@lists.linux-foundation.org
Cc: bpf@vger.kernel.org 

Kefeng Wang (9):
  kallsyms: Remove arch specific text and data check
  kallsyms: Fix address-checks for kernel related range
  sections: Move and rename core_kernel_data() to is_kernel_data()
  sections: Move is_kernel_inittext() into sections.h
  kallsyms: Rename is_kernel() and is_kernel_text()
  sections: Add new is_kernel() and is_kernel_text()
  s390: kprobes: Use is_kernel() helper
  powerpc/mm: Use is_kernel_text() and is_kernel_inittext() helper
  dma-debug: Use memory_intersects() directly

 arch/powerpc/mm/pgtable_32.c   |  7 +---
 arch/s390/kernel/kprobes.c     |  9 +----
 arch/x86/kernel/unwind_orc.c   |  2 +-
 arch/x86/net/bpf_jit_comp.c    |  2 +-
 include/asm-generic/sections.h | 71 ++++++++++++++++++++++++++--------
 include/linux/kallsyms.h       | 21 +++-------
 include/linux/kernel.h         |  2 -
 kernel/cfi.c                   |  2 +-
 kernel/dma/debug.c             | 14 +------
 kernel/extable.c               | 33 ++--------------
 kernel/locking/lockdep.c       |  3 --
 kernel/trace/ftrace.c          |  2 +-
 mm/kasan/report.c              |  2 +-
 net/sysctl_net.c               |  2 +-
 14 files changed, 76 insertions(+), 96 deletions(-)

-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
