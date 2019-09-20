Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DE9B8C53
	for <lists.iommu@lfdr.de>; Fri, 20 Sep 2019 10:05:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F0B84B4B;
	Fri, 20 Sep 2019 08:04:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BB6FFA7F
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 08:04:57 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C655281A
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 08:04:56 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 9D0C4616DA; Fri, 20 Sep 2019 08:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1568966696;
	bh=GZAlYah0lgBo/IVKZbnqPeDUaKVAPxsY/Fvwv9PSHKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UWIj+svFQN9xdQ98RQokQz87grR5YRjwtNJMnfjSUteelihzZBUU69w5PCBv4WVf5
	z0yQ0YMaPyInNOEviUN93EKRIaqHLFxHmeErd509WOMdIIdr7Y2rS6hVzd86P4te+x
	X4IWUSYMuhmoJb6SccCjVMlyucaybNw7LWSPnHNA=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from blr-ubuntu-253.qualcomm.com
	(blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com
	[103.229.18.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: saiprakash.ranjan@codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 222DA615B0;
	Fri, 20 Sep 2019 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1568966693;
	bh=GZAlYah0lgBo/IVKZbnqPeDUaKVAPxsY/Fvwv9PSHKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WGsKuACjm+va54PNd5B52+3RSEiPIgjto5K7d/z5rkKuSxfsMe885V3/Z7BXqvPPp
	unVcHkPWN+RDmP00g82PrXM+PEkJTU5X1lssVS88BMtX3LSluDmVcd0CS78zdDT4in
	Z2CuPI7eJH5/H9o2bUHmld0nxEYrUYTlICmQeO3M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 222DA615B0
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none
	smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Stephen Boyd <swboyd@chromium.org>,
	Vivek Gautam <vivek.gautam@codeaurora.org>, bjorn.andersson@linaro.org,
	Andy Gross <agross@kernel.org>
Subject: [PATCHv7 2/3] firmware/qcom_scm: Add scm call to handle smmu errata
Date: Fri, 20 Sep 2019 13:34:28 +0530
Message-Id: <30e1aeb6032c869679edc4eb36783468adcc7e40.1568966170.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1568966170.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
	linux-kernel@vger.kernel.org
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

From: Vivek Gautam <vivek.gautam@codeaurora.org>

Qcom's smmu-500 needs to toggle wait-for-safe sequence to
handle TLB invalidation sync's.
Few firmwares allow doing that through SCM interface.
Add API to toggle wait for safe from firmware through a
SCM call.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c |  5 +++++
 drivers/firmware/qcom_scm-64.c | 13 +++++++++++++
 drivers/firmware/qcom_scm.c    |  6 ++++++
 drivers/firmware/qcom_scm.h    |  5 +++++
 include/linux/qcom_scm.h       |  2 ++
 5 files changed, 31 insertions(+)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 215061c581e1..bee8729525ec 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -614,3 +614,8 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 	return qcom_scm_call_atomic2(QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
 				     addr, val);
 }
+
+int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool enable)
+{
+	return -ENODEV;
+}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 65d772b7fd1e..76867868042a 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -552,3 +552,16 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 	return qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
 			     &desc, &res);
 }
+
+int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
+{
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+
+	desc.args[0] = QCOM_SCM_CONFIG_ERRATA1_CLIENT_ALL;
+	desc.args[1] = en;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	return qcom_scm_call_atomic(dev, QCOM_SCM_SVC_SMMU_PROGRAM,
+				    QCOM_SCM_CONFIG_ERRATA1, &desc, &res);
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 4802ab170fe5..a729e05c21b8 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -345,6 +345,12 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 }
 EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
 
+int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
+{
+	return __qcom_scm_qsmmu500_wait_safe_toggle(__scm->dev, en);
+}
+EXPORT_SYMBOL(qcom_scm_qsmmu500_wait_safe_toggle);
+
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
 {
 	return __qcom_scm_io_readl(__scm->dev, addr, val);
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 99506bd873c0..baee744dbcfe 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -91,10 +91,15 @@ extern int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
 				      u32 spare);
 #define QCOM_SCM_IOMMU_SECURE_PTBL_SIZE	3
 #define QCOM_SCM_IOMMU_SECURE_PTBL_INIT	4
+#define QCOM_SCM_SVC_SMMU_PROGRAM	0x15
+#define QCOM_SCM_CONFIG_ERRATA1		0x3
+#define QCOM_SCM_CONFIG_ERRATA1_CLIENT_ALL	0x2
 extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 					     size_t *size);
 extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
 					     u32 size, u32 spare);
+extern int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev,
+						bool enable);
 #define QCOM_MEM_PROT_ASSIGN_ID	0x16
 extern int  __qcom_scm_assign_mem(struct device *dev,
 				  phys_addr_t mem_region, size_t mem_sz,
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 2d5eff506e13..ffd72b3b14ee 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -58,6 +58,7 @@ extern int qcom_scm_set_remote_state(u32 state, u32 id);
 extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
+extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
 extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 #else
@@ -97,6 +98,7 @@ qcom_scm_set_remote_state(u32 state,u32 id) { return -ENODEV; }
 static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare) { return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size) { return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare) { return -ENODEV; }
+static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en) { return -ENODEV; }
 static inline int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val) { return -ENODEV; }
 static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val) { return -ENODEV; }
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
