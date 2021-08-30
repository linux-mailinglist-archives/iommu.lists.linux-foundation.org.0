Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5313FB208
	for <lists.iommu@lfdr.de>; Mon, 30 Aug 2021 09:42:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB58680E78;
	Mon, 30 Aug 2021 07:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OW9XfA3d01Y; Mon, 30 Aug 2021 07:42:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7059680E7A;
	Mon, 30 Aug 2021 07:42:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56E62C000E;
	Mon, 30 Aug 2021 07:42:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93B67C000E
 for <iommu@lists.linux-foundation.org>; Mon, 30 Aug 2021 07:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F2F8401FE
 for <iommu@lists.linux-foundation.org>; Mon, 30 Aug 2021 07:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETvsMitE_4ol for <iommu@lists.linux-foundation.org>;
 Mon, 30 Aug 2021 07:42:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AC1F401E3
 for <iommu@lists.linux-foundation.org>; Mon, 30 Aug 2021 07:42:39 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gyhy56NSCz8sZd;
 Mon, 30 Aug 2021 15:38:21 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 30 Aug 2021 15:42:34 +0800
Received: from huawei.com (10.174.28.241) by dggpemm500004.china.huawei.com
 (7.185.36.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 30 Aug
 2021 15:42:34 +0800
From: Bixuan Cui <cuibixuan@huawei.com>
To: <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next v4 1/2] platform-msi: Save the msg context to desc in
 platform_msi_write_msg()
Date: Mon, 30 Aug 2021 15:38:57 +0800
Message-ID: <20210830073858.47084-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.174.28.241]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected
Cc: jean-philippe@linaro.org, maz@kernel.org, rafael@kernel.org,
 gregkh@linuxfoundation.org, robin.murphy@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

Save the msg context to desc when when the msi interrupt is requested.
The drivers can use it in special scenarios(such as resume).

Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/base/platform-msi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 3d6c8f9caf43..60962a224fcc 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -90,6 +90,9 @@ static void platform_msi_write_msg(struct irq_data *data, struct msi_msg *msg)
 
 	priv_data = desc->platform.msi_priv_data;
 
+	desc->msg.address_lo = msg->address_lo;
+	desc->msg.address_hi = msg->address_hi;
+	desc->msg.data = msg->data;
 	priv_data->write_msg(desc, msg);
 }
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
