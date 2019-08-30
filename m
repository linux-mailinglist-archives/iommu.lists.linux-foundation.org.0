Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F40F9A2E5F
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 06:28:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8FAA75834;
	Fri, 30 Aug 2019 04:28:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A4EC856F4
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 04:26:40 +0000 (UTC)
X-Greylist: delayed 00:23:09 by SQLgrey-1.7.6
Received: from gateway36.websitewelcome.com (gateway36.websitewelcome.com
	[192.185.186.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2CE1CF1
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 04:26:40 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
	by gateway36.websitewelcome.com (Postfix) with ESMTP id ED4F5400CA244
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:29:27 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
	id 3Y8Ii5cG2iQer3Y8IiOrvR; Thu, 29 Aug 2019 23:03:30 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default;
	h=Content-Type:MIME-Version:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zz/0wpgN2ENh4FQXIHSRXfkBLUkCd7zskZL3on01EzE=;
	b=oQs0gzkJRMLi3VddvYsTgCuCS2
	Zy0BSVb2v7chIF0n9k5a8APzIDvlfVkgmuxK85a6V5yOo4cvNNvw4sQ9mDVD3ODts8EPYTgWg64kq
	NUaWGu0+9nvpU16wqnYE79GWGWmyAw/bwMh1ah2OIripkNO/tYtKzrSqeZ3eAYCLtIdAZPN0NJX75
	okpqlC+fUwKLL4ouyLhKhshhNyqsyqDv/sXMC/+ZFVfxXzlQaLQiaFOOU7brW1GhZmL2D6cskj7iq
	3X7yDXdgPiwx8OF+6Wn/Pv+M6e7KtUmlYr1jkuhT9VbiYAR8xGyVn6OELg47IbTzK3652Fnb85JsA
	uVHdlg8A==;
Received: from [189.152.216.116] (port=55676 helo=embeddedor)
	by gator4166.hostgator.com with esmtpa (Exim 4.92)
	(envelope-from <gustavo@embeddedor.com>)
	id 1i3Y8G-002GKz-VA; Thu, 29 Aug 2019 23:03:29 -0500
Date: Thu, 29 Aug 2019 23:03:27 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu/qcom_iommu: Use struct_size() helper
Message-ID: <20190830040327.GA6483@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux-foundation.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.152.216.116
X-Source-L: No
X-Exim-ID: 1i3Y8G-002GKz-VA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.152.216.116]:55676
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE autolearn=unavailable
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct qcom_iommu_dev {
	...
        struct qcom_iommu_ctx   *ctxs[0];   /* indexed by asid-1 */
};

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

So, replace the following form:

sizeof(*qcom_iommu) + (max_asid * sizeof(qcom_iommu->ctxs[0]))

with:

struct_size(qcom_iommu, ctxs, max_asid)

Also, notice that, in this case, variable sz is not necessary,
hence it is removed.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/iommu/qcom_iommu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 3608f58f1ea8..c18168fd7fe7 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -801,7 +801,7 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	struct qcom_iommu_dev *qcom_iommu;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
-	int ret, sz, max_asid = 0;
+	int ret, max_asid = 0;
 
 	/* find the max asid (which is 1:1 to ctx bank idx), so we know how
 	 * many child ctx devices we have:
@@ -809,9 +809,8 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	for_each_child_of_node(dev->of_node, child)
 		max_asid = max(max_asid, get_asid(child));
 
-	sz = sizeof(*qcom_iommu) + (max_asid * sizeof(qcom_iommu->ctxs[0]));
-
-	qcom_iommu = devm_kzalloc(dev, sz, GFP_KERNEL);
+	qcom_iommu = devm_kzalloc(dev, struct_size(qcom_iommu, ctxs, max_asid),
+				  GFP_KERNEL);
 	if (!qcom_iommu)
 		return -ENOMEM;
 	qcom_iommu->num_ctxs = max_asid;
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
