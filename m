Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E237966D
	for <lists.iommu@lfdr.de>; Mon, 10 May 2021 19:50:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F67D83942;
	Mon, 10 May 2021 17:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQbVp8lZa2pC; Mon, 10 May 2021 17:50:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 421A783774;
	Mon, 10 May 2021 17:50:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21B9EC000E;
	Mon, 10 May 2021 17:50:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2BCCC0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 17:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C15DA83942
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 17:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9vcT0eoSaYX for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 17:50:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3410883774
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 17:50:48 +0000 (UTC)
IronPort-SDR: 1Zcax5EsQpJ0RlGrhFHuwraKbGXzT4XS66wQ3lL8K1+a/xd32Lr8u1oVz2juEr+nXw7s8LPfoF
 Gcx4TzUajslQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="186385431"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="186385431"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 10:50:47 -0700
IronPort-SDR: QXWSnJu/a4K4F33jQl+R2YMiw/7332eq0c9/dcWqpA6weLblSIdXEXiuw2KenWcrSqrICMIbv0
 6Q2zWQ9Th36w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="391062983"
Received: from lkp-server01.sh.intel.com (HELO f375d57c4ed4) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 10:50:44 -0700
Received: from kbuild by f375d57c4ed4 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lgA3H-0000J3-Gr; Mon, 10 May 2021 17:50:43 +0000
Date: Tue, 11 May 2021 01:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, hch@lst.de, m.szyprowski@samsung.com
Subject: [RFC PATCH] iova: __init_iova_domain can be static
Message-ID: <20210510175026.GA46391@b09f4beb6d7e>
References: <1620656249-68890-10-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620656249-68890-10-git-send-email-john.garry@huawei.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, linux-scsi@vger.kernel.org, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

drivers/iommu/iova.c:50:1: warning: symbol '__init_iova_domain' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 iova.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 273a689006c36..ae4901073a98a 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -46,7 +46,7 @@ static struct iova *to_iova(struct rb_node *node)
 	return rb_entry(node, struct iova, node);
 }
 
-void
+static void
 __init_iova_domain(struct iova_domain *iovad, unsigned long granule,
 	unsigned long start_pfn, unsigned long iova_len)
 {
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
