Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 898CC87F22
	for <lists.iommu@lfdr.de>; Fri,  9 Aug 2019 18:13:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2063FDDF;
	Fri,  9 Aug 2019 16:13:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7604ED8B
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:13:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 078AC67F
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:13:07 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id EC0963D0; Fri,  9 Aug 2019 18:13:05 +0200 (CEST)
Date: Fri, 9 Aug 2019 18:13:05 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH] iommu/omap: Fix compilation warnings suspend/resume control
Message-ID: <20190809161305.GA1213@8bytes.org>
References: <1565166412-31195-1-git-send-email-t-kristo@ti.com>
	<1565166412-31195-7-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565166412-31195-7-git-send-email-t-kristo@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org
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

On Wed, Aug 07, 2019 at 11:26:50AM +0300, Tero Kristo wrote:
> +static inline int omap_iommu_domain_deactivate(struct iommu_domain *domain) {}
> +static inline int omap_iommu_domain_activate(struct iommu_domain *domain) {}

This caused compilation warnings, I queued the fix below.

From 70c8a42adf482fba35e9e39ccd441a5ff8ffb657 Mon Sep 17 00:00:00 2001
From: Joerg Roedel <jroedel@suse.de>
Date: Fri, 9 Aug 2019 18:09:13 +0200
Subject: [PATCH] iommu/omap: Fix compilation warnings

A recent patches introduced a new compiler warning because
two functions with non-void return type have no return
statement in omap-iommu.h for CONFIG_OMAP_IOMMU=n.

Fix this by adding return statements to these functions.

Fixes: d9c4d8a6cc0f8 ('iommu/omap: introduce new API for runtime suspend/resume control')
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 include/linux/omap-iommu.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/omap-iommu.h b/include/linux/omap-iommu.h
index 36b645726813..2c32ca09df02 100644
--- a/include/linux/omap-iommu.h
+++ b/include/linux/omap-iommu.h
@@ -22,8 +22,15 @@ int omap_iommu_domain_activate(struct iommu_domain *domain);
 static inline void omap_iommu_save_ctx(struct device *dev) {}
 static inline void omap_iommu_restore_ctx(struct device *dev) {}
 
-static inline int omap_iommu_domain_deactivate(struct iommu_domain *domain) {}
-static inline int omap_iommu_domain_activate(struct iommu_domain *domain) {}
+static inline int omap_iommu_domain_deactivate(struct iommu_domain *domain)
+{
+	return -ENODEV;
+}
+
+static inline int omap_iommu_domain_activate(struct iommu_domain *domain)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif
-- 
2.16.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
