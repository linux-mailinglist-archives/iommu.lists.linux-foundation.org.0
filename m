Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3B524BC98
	for <lists.iommu@lfdr.de>; Thu, 20 Aug 2020 14:49:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 70965878BB;
	Thu, 20 Aug 2020 12:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9QL8fxUEIuw; Thu, 20 Aug 2020 12:49:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A45E9878BA;
	Thu, 20 Aug 2020 12:49:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A408C07FF;
	Thu, 20 Aug 2020 12:49:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A70D5C07FF
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 12:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 951B421561
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 12:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fz+2ETXDVSIr for <iommu@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 12:49:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by silver.osuosl.org (Postfix) with ESMTPS id 610762107A
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 12:49:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597927785; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=BhNeirievu7ABUQ2mRSmIu+sWUN4ihC6bWjNuJCyjvc=;
 b=Pb8X4XWRQMphYyamDwoO1PK22VJNXOemGv19RoLKx+VwAcf8kmjgNi7XMYIIc/5s6zTyV/75
 gboAVCooyAxTPfNmBOAdkkUCfoybimuLOuq7cEo+HBT3QGAzovSeCi7wwVBPdGRnutohvqhf
 LnyoApLJHo9deIu8pTQtrU/L3XE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f3e71677eb4541d936431b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 Aug 2020 12:49:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4F691C433A0; Thu, 20 Aug 2020 12:49:42 +0000 (UTC)
Received: from vjitta-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: vjitta)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C862C433CA;
 Thu, 20 Aug 2020 12:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C862C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=vjitta@codeaurora.org
From: vjitta@codeaurora.org
To: joro@8bytes.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] iommu/iova: Retry from last rb tree node if iova
 search fails
Date: Thu, 20 Aug 2020 18:19:20 +0530
Message-Id: <1597927761-24441-1-git-send-email-vjitta@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Cc: vjitta@codeaurora.org, robin.murphy@arm.com, vinmenon@codeaurora.org,
 kernel-team@android.com
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

From: Vijayanand Jitta <vjitta@codeaurora.org>

When ever a new iova alloc request comes iova is always searched
from the cached node and the nodes which are previous to cached
node. So, even if there is free iova space available in the nodes
which are next to the cached node iova allocation can still fail
because of this approach.

Consider the following sequence of iova alloc and frees on
1GB of iova space

1) alloc - 500MB
2) alloc - 12MB
3) alloc - 499MB
4) free -  12MB which was allocated in step 2
5) alloc - 13MB

After the above sequence we will have 12MB of free iova space and
cached node will be pointing to the iova pfn of last alloc of 13MB
which will be the lowest iova pfn of that iova space. Now if we get an
alloc request of 2MB we just search from cached node and then look
for lower iova pfn's for free iova and as they aren't any, iova alloc
fails though there is 12MB of free iova space.

To avoid such iova search failures do a retry from the last rb tree node
when iova search fails, this will search the entire tree and get an iova
if its available.

Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>
---
 drivers/iommu/iova.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 49fc01f..4e77116 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -184,8 +184,9 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
 	struct rb_node *curr, *prev;
 	struct iova *curr_iova;
 	unsigned long flags;
-	unsigned long new_pfn;
+	unsigned long new_pfn, low_pfn_new;
 	unsigned long align_mask = ~0UL;
+	unsigned long high_pfn = limit_pfn, low_pfn = iovad->start_pfn;
 
 	if (size_aligned)
 		align_mask <<= fls_long(size - 1);
@@ -198,15 +199,25 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
 
 	curr = __get_cached_rbnode(iovad, limit_pfn);
 	curr_iova = rb_entry(curr, struct iova, node);
+	low_pfn_new = curr_iova->pfn_hi + 1;
+
+retry:
 	do {
-		limit_pfn = min(limit_pfn, curr_iova->pfn_lo);
-		new_pfn = (limit_pfn - size) & align_mask;
+		high_pfn = min(high_pfn, curr_iova->pfn_lo);
+		new_pfn = (high_pfn - size) & align_mask;
 		prev = curr;
 		curr = rb_prev(curr);
 		curr_iova = rb_entry(curr, struct iova, node);
-	} while (curr && new_pfn <= curr_iova->pfn_hi);
-
-	if (limit_pfn < size || new_pfn < iovad->start_pfn) {
+	} while (curr && new_pfn <= curr_iova->pfn_hi && new_pfn >= low_pfn);
+
+	if (high_pfn < size || new_pfn < low_pfn) {
+		if (low_pfn == iovad->start_pfn && low_pfn_new < limit_pfn) {
+			high_pfn = limit_pfn;
+			low_pfn = low_pfn_new;
+			curr = &iovad->anchor.node;
+			curr_iova = rb_entry(curr, struct iova, node);
+			goto retry;
+		}
 		iovad->max32_alloc_size = size;
 		goto iova32_full;
 	}
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
1.9.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
