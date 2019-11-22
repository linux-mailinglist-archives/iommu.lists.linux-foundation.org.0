Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 77414106D30
	for <lists.iommu@lfdr.de>; Fri, 22 Nov 2019 11:58:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 371B386AB1;
	Fri, 22 Nov 2019 10:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAgQeps-y2W4; Fri, 22 Nov 2019 10:58:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BDD6D86A70;
	Fri, 22 Nov 2019 10:58:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A92DEC18DA;
	Fri, 22 Nov 2019 10:58:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11B89C18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 10:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 01318261D5
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 10:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IC4DK18Wmg5D for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:58:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by silver.osuosl.org (Postfix) with ESMTPS id B5CAA261E0
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 10:58:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3so8084988wru.3
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 02:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MfTtXiG/W/rObmsyirkEQ0i6+kv30tKWKHAFlzXsK50=;
 b=KGaaTyS3Lc/ef+t1SZuZlTE1UsU+JnOw0CHre56ANUeiS1fG2WU5O/YFQcBx5DFQ+g
 C3eEzhT3EtsVVDaPXc0JJnwFtgO1xkFqrrE6GycrJ2S4YEKOcx4s42s4o+D2QSUmsenY
 giJa7ayJtTWwW60SOcSL7s5TyIuTMeag5BlKYTNd2Vpv5b3Ku4VoOfgVTWmpiuNgZfga
 0U9jEO3Ob60MHJopefjx77FsOCYeO+1ZpoKfR2ZI8XHgbGZFlpcgyTQN/mBvo0haJZcQ
 4WN5cxwZz8VzF5n+E1gDTt+EyPoR0GPG3uAOf5O3TZXJzM8psHGvEWv0Dabay2iZKY72
 vmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MfTtXiG/W/rObmsyirkEQ0i6+kv30tKWKHAFlzXsK50=;
 b=VyVjztTkLWBy450IjECuYAbvZcF4k0Ja1Q9LnWjDh2DnxMnGeVb4S1T9WsKhK4QCVk
 Ni2sfHC4VkWS0JENM++n4PshGpGembbtHap/hBu08sOUyY7W2WS86/3L0GrVypw+1A3p
 STy5WN82zXsW2H7H+p718Xk3CfMwDhfHqSLaXd/g7vICc1xoORvrEttbC0SnqaP+DxKW
 o81ryo2+lvh5uv2o2kR+XRkjDramUk18r+M8AJCkoLBcV1+T/v1FjGMmwUH/mjzvoB6i
 4HSd9rgATGxeXPAOTnHWswJcoss/8Y3tB8t8ZTbx7P7Y47z2wmFMi+8EAwpPUyHgj7pW
 nMAg==
X-Gm-Message-State: APjAAAWmx4oOb3AHZVTSlUwIdpJpfyj04KgoZoYP7i6QiBVxFaZDIXq4
 eAjj0Q+bEY7RPb2cALw7r6v0Bw==
X-Google-Smtp-Source: APXvYqzYWFFlrhHka1Vw/6sChVYtvTiOJin0SbfQOyNoZG5nnElEymYjGNuUm72JutIfgIh/3EoY2g==
X-Received: by 2002:adf:e885:: with SMTP id d5mr17167901wrm.117.1574419856320; 
 Fri, 22 Nov 2019 02:50:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:50:55 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC 04/13] ACPI/IORT: Add node categories
Date: Fri, 22 Nov 2019 11:49:51 +0100
Message-Id: <20191122105000.800410-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191122105000.800410-1-jean-philippe@linaro.org>
References: <20191122105000.800410-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: kevin.tian@intel.com, mst@redhat.com, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, guohanjun@huawei.com, bhelgaas@google.com,
 jasowang@redhat.com, lenb@kernel.org
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

The current node filtering won't work when introducing node types
greater than 63 (such as the virtio-iommu nodes). Add
node_type_matches() to filter nodes by category.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/acpi/iort.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/iort.c b/drivers/acpi/iort.c
index 9c6c91e06f8f..1d43fbc0001f 100644
--- a/drivers/acpi/iort.c
+++ b/drivers/acpi/iort.c
@@ -18,10 +18,10 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#define IORT_TYPE_MASK(type)	(1 << (type))
-#define IORT_MSI_TYPE		(1 << ACPI_IORT_NODE_ITS_GROUP)
-#define IORT_IOMMU_TYPE		((1 << ACPI_IORT_NODE_SMMU) |	\
-				(1 << ACPI_IORT_NODE_SMMU_V3))
+enum iort_node_category {
+	IORT_MSI_TYPE,
+	IORT_IOMMU_TYPE,
+};
 
 struct iort_its_msi_chip {
 	struct list_head	list;
@@ -38,6 +38,20 @@ struct iort_fwnode {
 static LIST_HEAD(iort_fwnode_list);
 static DEFINE_SPINLOCK(iort_fwnode_lock);
 
+static bool iort_type_matches(u8 type, enum iort_node_category category)
+{
+	switch (category) {
+	case IORT_IOMMU_TYPE:
+		return type == ACPI_IORT_NODE_SMMU ||
+		       type == ACPI_IORT_NODE_SMMU_V3;
+	case IORT_MSI_TYPE:
+		return type == ACPI_IORT_NODE_ITS_GROUP;
+	default:
+		WARN_ON(1);
+		return false;
+	}
+}
+
 /**
  * iort_set_fwnode() - Create iort_fwnode and use it to register
  *		       iommu data in the iort_fwnode_list
@@ -397,7 +411,7 @@ static int iort_get_id_mapping_index(struct acpi_iort_node *node)
 
 static struct acpi_iort_node *iort_node_map_id(struct acpi_iort_node *node,
 					       u32 id_in, u32 *id_out,
-					       u8 type_mask)
+					       enum iort_node_category category)
 {
 	u32 id = id_in;
 
@@ -406,7 +420,7 @@ static struct acpi_iort_node *iort_node_map_id(struct acpi_iort_node *node,
 		struct acpi_iort_id_mapping *map;
 		int i, index;
 
-		if (IORT_TYPE_MASK(node->type) & type_mask) {
+		if (iort_type_matches(node->type, category)) {
 			if (id_out)
 				*id_out = id;
 			return node;
@@ -458,8 +472,8 @@ static struct acpi_iort_node *iort_node_map_id(struct acpi_iort_node *node,
 }
 
 static struct acpi_iort_node *iort_node_map_platform_id(
-		struct acpi_iort_node *node, u32 *id_out, u8 type_mask,
-		int index)
+		struct acpi_iort_node *node, u32 *id_out,
+		enum iort_node_category category, int index)
 {
 	struct acpi_iort_node *parent;
 	u32 id;
@@ -475,8 +489,8 @@ static struct acpi_iort_node *iort_node_map_platform_id(
 	 * as NC (named component) -> SMMU -> ITS. If the type is matched,
 	 * return the initial dev id and its parent pointer directly.
 	 */
-	if (!(IORT_TYPE_MASK(parent->type) & type_mask))
-		parent = iort_node_map_id(parent, id, id_out, type_mask);
+	if (!iort_type_matches(parent->type, category))
+		parent = iort_node_map_id(parent, id, id_out, category);
 	else
 		if (id_out)
 			*id_out = id;
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
