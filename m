Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 880711ECA5B
	for <lists.iommu@lfdr.de>; Wed,  3 Jun 2020 09:19:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F4B286A9E;
	Wed,  3 Jun 2020 07:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTUawygvnOUo; Wed,  3 Jun 2020 07:19:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E718886A73;
	Wed,  3 Jun 2020 07:19:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1185C016E;
	Wed,  3 Jun 2020 07:19:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BDA0C016E
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 07:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3B0048646F
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 07:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gYJwhY1tRPrW for <iommu@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 07:19:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DB27C86429
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 07:19:27 +0000 (UTC)
IronPort-SDR: oxAEhbxuA+nXaDbgzXFv0HVtJez0ywt7fa9q/8fO9PatJvqWylPVlwxaOIkT342mJCWAYI1dvE
 R6JDb3kDI8tw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 00:19:27 -0700
IronPort-SDR: Yyl9KM/4BH8YDORSPS8aPRUDVd45t282Vv6JqhEp+3M9F8OJHnZM2qMC0PwlIr7sc8Xw7TSkeA
 2KEjhPrZouhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; d="scan'208";a="444996268"
Received: from lkp-server02.sh.intel.com (HELO 8f84dc34deca) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 03 Jun 2020 00:19:22 -0700
Received: from kbuild by 8f84dc34deca with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jgNgH-000034-1X; Wed, 03 Jun 2020 07:19:21 +0000
Date: Wed, 3 Jun 2020 15:18:59 +0800
From: kbuild test robot <lkp@intel.com>
To: Barry Song <song.bao.hua@hisilicon.com>, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, catalin.marinas@arm.com
Subject: [RFC PATCH] dma-direct: dma_contiguous_pernuma_area[] can be static
Message-ID: <20200603071859.GA64477@6bb44d8ad825>
References: <20200603024231.61748-2-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603024231.61748-2-song.bao.hua@hisilicon.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 contiguous.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 4b10d0ca0456d..2094c8e0590ac 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -37,7 +37,7 @@
 #endif
 
 struct cma *dma_contiguous_default_area;
-struct cma *dma_contiguous_pernuma_area[MAX_NUMNODES];
+static struct cma *dma_contiguous_pernuma_area[MAX_NUMNODES];
 
 /*
  * Default global CMA area size can be defined in kernel's .config.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
