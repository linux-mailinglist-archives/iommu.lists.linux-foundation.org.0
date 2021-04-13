Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EB59B35E765
	for <lists.iommu@lfdr.de>; Tue, 13 Apr 2021 22:03:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 320AC4060F;
	Tue, 13 Apr 2021 20:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCDSICDR1pR2; Tue, 13 Apr 2021 20:03:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4582640609;
	Tue, 13 Apr 2021 20:03:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AF53C000A;
	Tue, 13 Apr 2021 20:03:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EFBDC000A
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 19:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3698843A3
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 19:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RWfjeU4ob8WX for <iommu@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 19:54:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 569308439C
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 19:54:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 59B5D613B1;
 Tue, 13 Apr 2021 19:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618343641;
 bh=aQ0sL/CtSIpmqSH+Y8uXo9Dlmv+4Dn7h4gts/aYLS0Y=;
 h=Date:From:To:Cc:Subject:From;
 b=ashQWDCNaUuDS2zXVNRMUkGpM6HVQrcbYTKAcRIaXm1Fh4slwpuvuPPvTyq8Hwugv
 7b0Io+RETbDsjMb0pCxmWVfgBsqmvsO/xvlpd4OJMBzi3DpHnSWlZttNzMswUO7n4g
 LIpdvvuRQdqvPH1PL8FLBrwOK89XjDvLe5wYC2FYuTQpe4NCWudhEkmlKLND+4dmX6
 bkX033gOCyuxs3uXecqylb8jWB0hglDS32HeN4dW0CA56YTro6jjEdej/sURztlzJL
 O9V9lin5B1Y2qamg9MJywPUmDpRn7i4+X59RpfeMgI24tO5Pq7rlRn0v9vU2GYmJa0
 XfVkUHQJymfjg==
Date: Tue, 13 Apr 2021 14:54:09 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
Subject: [PATCH][next] iommu/vt-d: Fix out-bounds-warning in
 intel_svm_page_response()
Message-ID: <20210413195409.GA322376@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 13 Apr 2021 20:03:38 +0000
Cc: iommu@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

Replace call to memcpy() with just a couple of simple assignments in
order to fix the following out-of-bounds warning:

drivers/iommu/intel/svm.c:1198:4: warning: 'memcpy' offset [25, 32] from the object at 'desc' is out of the bounds of referenced subobject 'qw2' with type 'long long unsigned int' at offset 16 [-Warray-bounds]

The problem is that the original code is trying to copy data into a
couple of struct members adjacent to each other in a single call to
memcpy(). This causes a legitimate compiler warning because memcpy()
overruns the length of &desc.qw2.

This helps with the ongoing efforts to globally enable -Warray-bounds
and get us closer to being able to tighten the FORTIFY_SOURCE routines
on memcpy().

Link: https://github.com/KSPP/linux/issues/109
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/iommu/intel/svm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 5165cea90421..65909f504c50 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -1194,9 +1194,10 @@ int intel_svm_page_response(struct device *dev,
 		desc.qw1 = QI_PGRP_IDX(prm->grpid) | QI_PGRP_LPIG(last_page);
 		desc.qw2 = 0;
 		desc.qw3 = 0;
-		if (private_present)
-			memcpy(&desc.qw2, prm->private_data,
-			       sizeof(prm->private_data));
+		if (private_present) {
+			desc.qw2 = prm->private_data[0];
+			desc.qw3 = prm->private_data[1];
+		}
 
 		qi_submit_sync(iommu, &desc, 1, 0);
 	}
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
