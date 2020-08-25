Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3A1251256
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 08:48:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C3A3887E5F;
	Tue, 25 Aug 2020 06:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4y0vaEty93Cl; Tue, 25 Aug 2020 06:48:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A21DB87E58;
	Tue, 25 Aug 2020 06:48:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F114C0051;
	Tue, 25 Aug 2020 06:48:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C1C8C0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 06:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 91A4F84CE6
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 06:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kg1JBSrsSOU0 for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 06:48:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ZXSHCAS2.zhaoxin.com (unknown [203.148.12.82])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B143E84CC2
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 06:48:39 +0000 (UTC)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 25 Aug
 2020 14:48:27 +0800
Received: from localhost.localdomain (61.148.243.98) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 25 Aug
 2020 14:48:25 +0800
From: FelixCuioc <FelixCui-oc@zhaoxin.com>
To: Joerg Roedel <joro@8bytes.org>, <iommu@lists.linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, "Lu
 Baolu" <baolu.lu@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 <kbuild@lists.01.org>
Subject: [PATCH 2/2] iommu/vt-d:Add support for probing ACPI device in RMRR
Date: Tue, 25 Aug 2020 02:48:12 -0400
Message-ID: <20200825064812.13254-1-FelixCui-oc@zhaoxin.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [61.148.243.98]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Cc: kbuild-all@lists.01.org, CobeChen-oc@zhaoxin.com
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

In the probe_acpi_namespace_devices function,when the physical
node of the acpi device is NULL,the unlock function is missing.
Add mutex_unlock(&adev->physical_node_lock).

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: FelixCuioc <FelixCui-oc@zhaoxin.com>
---
 drivers/iommu/intel/iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index b31f02f41c96..25e9853cba1b 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4851,6 +4851,7 @@ static int __init probe_acpi_namespace_devices(void)
 			if (pn_dev == NULL) {
 				dev->bus->iommu_ops = &intel_iommu_ops;
 				ret = iommu_probe_device(dev);
+				mutex_unlock(&adev->physical_node_lock);
 				if (ret) {
 					pr_err("acpi_device probe fail! ret:%d\n", ret);
 					return ret;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
