Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A81DA924B7
	for <lists.iommu@lfdr.de>; Mon, 19 Aug 2019 15:23:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2F5C2E32;
	Mon, 19 Aug 2019 13:23:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 06FC5DA8
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 13:23:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 659628A7
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 13:23:01 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 020F33F3; Mon, 19 Aug 2019 15:22:58 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 02/11] iommu: Add helpers to set/get default domain type
Date: Mon, 19 Aug 2019 15:22:47 +0200
Message-Id: <20190819132256.14436-3-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819132256.14436-1-joro@8bytes.org>
References: <20190819132256.14436-1-joro@8bytes.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: fenghua.yu@intel.com, tony.luck@intel.com, linux-ia64@vger.kernel.org,
	corbet@lwn.net, Joerg Roedel <jroedel@suse.de>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
	Thomas.Lendacky@amd.com, hpa@zytor.com, tglx@linutronix.de
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Joerg Roedel <jroedel@suse.de>

Add a couple of functions to allow changing the default
domain type from architecture code and a function for iommu
drivers to request whether the default domain is
passthrough.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 22 ++++++++++++++++++++++
 include/linux/iommu.h | 16 ++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3361ca5ef769..84acd47936ac 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2211,6 +2211,28 @@ int iommu_request_dma_domain_for_dev(struct device *dev)
 	return request_default_domain_for_dev(dev, IOMMU_DOMAIN_DMA);
 }
 
+void iommu_set_default_passthrough(bool cmd_line)
+{
+	if (cmd_line)
+		iommu_set_cmd_line_dma_api();
+
+	iommu_def_domain_type = IOMMU_DOMAIN_IDENTITY;
+}
+
+void iommu_set_default_translated(bool cmd_line)
+{
+	if (cmd_line)
+		iommu_set_cmd_line_dma_api();
+
+	iommu_def_domain_type = IOMMU_DOMAIN_DMA;
+}
+
+bool iommu_default_passthrough(void)
+{
+	return iommu_def_domain_type == IOMMU_DOMAIN_IDENTITY;
+}
+EXPORT_SYMBOL_GPL(iommu_default_passthrough);
+
 const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
 {
 	const struct iommu_ops *ops = NULL;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index fdc355ccc570..4955498204a9 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -413,6 +413,9 @@ extern void iommu_get_resv_regions(struct device *dev, struct list_head *list);
 extern void iommu_put_resv_regions(struct device *dev, struct list_head *list);
 extern int iommu_request_dm_for_dev(struct device *dev);
 extern int iommu_request_dma_domain_for_dev(struct device *dev);
+extern void iommu_set_default_passthrough(bool cmd_line);
+extern void iommu_set_default_translated(bool cmd_line);
+extern bool iommu_default_passthrough(void);
 extern struct iommu_resv_region *
 iommu_alloc_resv_region(phys_addr_t start, size_t length, int prot,
 			enum iommu_resv_type type);
@@ -694,6 +697,19 @@ static inline int iommu_request_dma_domain_for_dev(struct device *dev)
 	return -ENODEV;
 }
 
+static inline void iommu_set_default_passthrough(bool cmd_line)
+{
+}
+
+static inline void iommu_set_default_translated(bool cmd_line)
+{
+}
+
+static inline bool iommu_default_passthrough(void)
+{
+	return true;
+}
+
 static inline int iommu_attach_group(struct iommu_domain *domain,
 				     struct iommu_group *group)
 {
-- 
2.16.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
