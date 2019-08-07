Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E0D8474E
	for <lists.iommu@lfdr.de>; Wed,  7 Aug 2019 10:27:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DCC78EE7;
	Wed,  7 Aug 2019 08:27:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3FE91E9D
	for <iommu@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 08:27:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B5E0F8A3
	for <iommu@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 08:27:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x778R6XF037337;
	Wed, 7 Aug 2019 03:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565166426;
	bh=2VfralZpVXg2G4xQWm9bqylFtOHFCfQY0ty28WwVkbc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tO6WsfPlOhM9fyq1O5puZ3FT94o5u2IjcRTDsq6XOpdC38e5uJXsSl6K5YHfd2OUP
	PUPkusIKggQa6RrkK+3VtUwk0+AznojuV/lmuyDHrx/yFQsPhrBzsGUYhiNARjoFbm
	R/F+4oed9BU5vskFpQ8BnmxUs0lq7QgQM+JC6FHE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x778R6OD128808
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2019 03:27:06 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 7 Aug 2019 03:27:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 7 Aug 2019 03:27:06 -0500
Received: from gomoku.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x778QwO6046515;
	Wed, 7 Aug 2019 03:27:05 -0500
To: <joro@8bytes.org>, <iommu@lists.linux-foundation.org>
Subject: [PATCH 6/8] iommu/omap: introduce new API for runtime suspend/resume
	control
Date: Wed, 7 Aug 2019 11:26:50 +0300
Message-ID: <1565166412-31195-7-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565166412-31195-1-git-send-email-t-kristo@ti.com>
References: <1565166412-31195-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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
From: Tero Kristo via iommu <iommu@lists.linux-foundation.org>
Reply-To: Tero Kristo <t-kristo@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Suman Anna <s-anna@ti.com>

This patch adds the support for the OMAP IOMMUs to be suspended
during the auto suspend/resume of the OMAP remoteproc devices. The
remote processors are auto suspended after a certain time of idle
or inactivity period. This is done by introducing two new API,
omap_iommu_domain_deactivate() and omap_iommu_domain_activate()
to allow the client users/master devices of the IOMMU devices to
deactivate & activate the IOMMU devices from their runtime
suspend/resume operations. There is no API exposed by the IOMMU
layer at present, and so these new API are added directly in the
OMAP IOMMU driver to minimize framework changes.

The API simply decrements and increments the runtime usage count
of the IOMMU devices and let the context be saved/restored using
the existing runtime pm callbacks.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/iommu/omap-iommu.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/omap-iommu.h |  8 +++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 694cd38..5e0dfca 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -939,6 +939,64 @@ static void omap_iommu_restore_tlb_entries(struct omap_iommu *obj)
 }
 
 /**
+ * omap_iommu_domain_deactivate - deactivate attached iommu devices
+ * @domain: iommu domain attached to the target iommu device
+ *
+ * This API allows the client devices of IOMMU devices to suspend
+ * the IOMMUs they control at runtime, after they are idled and
+ * suspended all activity. System Suspend will leverage the PM
+ * driver late callbacks.
+ **/
+int omap_iommu_domain_deactivate(struct iommu_domain *domain)
+{
+	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
+	struct omap_iommu_device *iommu;
+	struct omap_iommu *oiommu;
+	int i;
+
+	if (!omap_domain->dev)
+		return 0;
+
+	iommu = omap_domain->iommus;
+	iommu += (omap_domain->num_iommus - 1);
+	for (i = 0; i < omap_domain->num_iommus; i++, iommu--) {
+		oiommu = iommu->iommu_dev;
+		pm_runtime_put_sync(oiommu->dev);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(omap_iommu_domain_deactivate);
+
+/**
+ * omap_iommu_domain_activate - activate attached iommu devices
+ * @domain: iommu domain attached to the target iommu device
+ *
+ * This API allows the client devices of IOMMU devices to resume the
+ * IOMMUs they control at runtime, before they can resume operations.
+ * System Resume will leverage the PM driver late callbacks.
+ **/
+int omap_iommu_domain_activate(struct iommu_domain *domain)
+{
+	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
+	struct omap_iommu_device *iommu;
+	struct omap_iommu *oiommu;
+	int i;
+
+	if (!omap_domain->dev)
+		return 0;
+
+	iommu = omap_domain->iommus;
+	for (i = 0; i < omap_domain->num_iommus; i++, iommu++) {
+		oiommu = iommu->iommu_dev;
+		pm_runtime_get_sync(oiommu->dev);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(omap_iommu_domain_activate);
+
+/**
  * omap_iommu_runtime_suspend - disable an iommu device
  * @dev:	iommu device
  *
diff --git a/include/linux/omap-iommu.h b/include/linux/omap-iommu.h
index 153bf25..36b6457 100644
--- a/include/linux/omap-iommu.h
+++ b/include/linux/omap-iommu.h
@@ -10,12 +10,20 @@
 #ifndef _OMAP_IOMMU_H_
 #define _OMAP_IOMMU_H_
 
+struct iommu_domain;
+
 #ifdef CONFIG_OMAP_IOMMU
 extern void omap_iommu_save_ctx(struct device *dev);
 extern void omap_iommu_restore_ctx(struct device *dev);
+
+int omap_iommu_domain_deactivate(struct iommu_domain *domain);
+int omap_iommu_domain_activate(struct iommu_domain *domain);
 #else
 static inline void omap_iommu_save_ctx(struct device *dev) {}
 static inline void omap_iommu_restore_ctx(struct device *dev) {}
+
+static inline int omap_iommu_domain_deactivate(struct iommu_domain *domain) {}
+static inline int omap_iommu_domain_activate(struct iommu_domain *domain) {}
 #endif
 
 #endif
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
