Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB081BF7C2
	for <lists.iommu@lfdr.de>; Thu, 30 Apr 2020 14:01:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3BD6C88273;
	Thu, 30 Apr 2020 12:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTclnTgwowsO; Thu, 30 Apr 2020 12:01:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C1DEE881C8;
	Thu, 30 Apr 2020 12:01:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7A13C016F;
	Thu, 30 Apr 2020 12:01:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6526BC016F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 12:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5415B85D9B
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 12:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OoQYOspPSUV3 for <iommu@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 12:01:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4E10085D56
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 12:01:41 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9265320775;
 Thu, 30 Apr 2020 12:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588248101;
 bh=QHBgJX+bF1tiYlvZ2bwMjSrr69d3qjVxEKw5dkxCP/c=;
 h=From:To:Cc:Subject:Date:From;
 b=NZLQpPWef+GBjsg/pN3t91fyQ94VxV5o0/gImgoefZVdSqi5qzHAkNIJfTy7hZb/w
 X+VKGviFUl66UjhteoPhSeCjnWfpymRRCmjtS8nO1/jauLy64+H1VTorW01zC3fh+o
 UXjEWNgcdD3lfdgLnHTsbwBBefKMUZpryGU/LrzU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: joro@8bytes.org
Subject: [PATCH] drivers/iommu: properly export iommu_group_get_for_dev
Date: Thu, 30 Apr 2020 14:01:20 +0200
Message-Id: <20200430120120.2948448-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Joerg Roedel <jroedel@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>
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

In commit a7ba5c3d008d ("drivers/iommu: Export core IOMMU API symbols to
permit modular drivers") a bunch of iommu symbols were exported, all
with _GPL markings except iommu_group_get_for_dev().  That export should
also be _GPL like the others.

Cc: Will Deacon <will@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: John Garry <john.garry@huawei.com>
Fixes: a7ba5c3d008d ("drivers/iommu: Export core IOMMU API symbols to permit modular drivers")
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/iommu/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2b471419e26c..1ecbc8788fe7 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1428,7 +1428,7 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 
 	return group;
 }
-EXPORT_SYMBOL(iommu_group_get_for_dev);
+EXPORT_SYMBOL_GPL(iommu_group_get_for_dev);
 
 struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)
 {
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
