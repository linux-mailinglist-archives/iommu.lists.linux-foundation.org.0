Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 751CEB41D1
	for <lists.iommu@lfdr.de>; Mon, 16 Sep 2019 22:29:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 207431439;
	Mon, 16 Sep 2019 20:29:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 17866142C
	for <iommu@lists.linux-foundation.org>;
	Mon, 16 Sep 2019 20:29:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.smtpout.orange.fr (smtp11.smtpout.orange.fr
	[80.12.242.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5CF59828
	for <iommu@lists.linux-foundation.org>;
	Mon, 16 Sep 2019 20:29:40 +0000 (UTC)
Received: from localhost.localdomain ([90.126.97.183]) by mwinf5d90 with ME
	id 2LVe2100A3xPcdm03LVfSU; Mon, 16 Sep 2019 22:29:39 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 16 Sep 2019 22:29:39 +0200
X-ME-IP: 90.126.97.183
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: agross@kernel.org,
	robdclark@gmail.com,
	joro@8bytes.org
Subject: [PATCH] iommu/qcom: Simplify a test in 'qcom_iommu_add_device()'
Date: Mon, 16 Sep 2019 22:29:36 +0200
Message-Id: <20190916202936.30403-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

'iommu_group_get_for_dev()' never returns NULL, so this test can be
simplified a bit.

This way, the test is consistent with all other calls to
'iommu_group_get_for_dev()'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iommu/qcom_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index c31e7bc4ccbe..3d99ec868892 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -539,8 +539,8 @@ static int qcom_iommu_add_device(struct device *dev)
 	}
 
 	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR_OR_NULL(group))
-		return PTR_ERR_OR_ZERO(group);
+	if (IS_ERR(group))
+		return PTR_ERR(group);
 
 	iommu_group_put(group);
 	iommu_device_link(&qcom_iommu->iommu, dev);
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
