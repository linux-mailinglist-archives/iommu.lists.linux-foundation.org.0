Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7555DB8C4D
	for <lists.iommu@lfdr.de>; Fri, 20 Sep 2019 10:04:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C9A50B2F;
	Fri, 20 Sep 2019 08:04:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8B07EA7F
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 08:04:50 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0070A108
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 08:04:50 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 7ADBD6141B; Fri, 20 Sep 2019 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1568966689;
	bh=dtqHsPhtW5H517mcc0CRDclGSrF1OpbkTABdPLde/h4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ds84Je9Ded7HbrweuU9kyxdTZD2zKBTinhPedC43cBa3ntfCyXNF+gaDyYpVjDMh5
	/yn6O119uVYrGsACKbVSLNA7K14ps+++jPP73rzUvIDMZxk2jEir37jMphSz2Pe/kb
	0MSf2Y52eqwGp5cTJKWEejLi7c0h48IMDIpMqRr4=
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
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 2078F61576;
	Fri, 20 Sep 2019 08:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1568966688;
	bh=dtqHsPhtW5H517mcc0CRDclGSrF1OpbkTABdPLde/h4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQFST/cjycoosEF/0JnwweaD+GCFxPaDnFvvUxepYKg2ZoQsVff4ziiotj5gjWz9T
	9hMMlkIHLuI52tCwLEUTaEyemgr+JQAvqrZaZA3Cq0MBzCViC7U+TWgTefFHoB8B/w
	Qp3EhgkrhHNz/7+MZqXG0BJFixGYPVB8A0zJCinw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2078F61576
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
Subject: [PATCHv7 1/3] firmware: qcom_scm-64: Add atomic version of
	qcom_scm_call
Date: Fri, 20 Sep 2019 13:34:27 +0530
Message-Id: <07c27aa7d7785cb280ea17cdadf5326ae9c3cfd5.1568966170.git.saiprakash.ranjan@codeaurora.org>
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

There are scnenarios where drivers are required to make a
scm call in atomic context, such as in one of the qcom's
arm-smmu-500 errata [1].

[1] ("https://source.codeaurora.org/quic/la/kernel/msm-4.9/
      tree/drivers/iommu/arm-smmu.c?h=msm-4.9#n4842")

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 138 ++++++++++++++++++++++-----------
 1 file changed, 94 insertions(+), 44 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 91d5ad7cf58b..65d772b7fd1e 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -62,32 +62,72 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define FIRST_EXT_ARG_IDX 3
 #define N_REGISTER_ARGS (MAX_QCOM_SCM_ARGS - N_EXT_QCOM_SCM_ARGS + 1)
 
-/**
- * qcom_scm_call() - Invoke a syscall in the secure world
- * @dev:	device
- * @svc_id:	service identifier
- * @cmd_id:	command identifier
- * @desc:	Descriptor structure containing arguments and return values
- *
- * Sends a command to the SCM and waits for the command to finish processing.
- * This should *only* be called in pre-emptible context.
-*/
-static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
-			 const struct qcom_scm_desc *desc,
-			 struct arm_smccc_res *res)
+static void __qcom_scm_call_do(const struct qcom_scm_desc *desc,
+			       struct arm_smccc_res *res, u32 fn_id,
+			       u64 x5, u32 type)
+{
+	u64 cmd;
+	struct arm_smccc_quirk quirk = { .id = ARM_SMCCC_QUIRK_QCOM_A6 };
+
+	cmd = ARM_SMCCC_CALL_VAL(type, qcom_smccc_convention,
+				 ARM_SMCCC_OWNER_SIP, fn_id);
+
+	quirk.state.a6 = 0;
+
+	do {
+		arm_smccc_smc_quirk(cmd, desc->arginfo, desc->args[0],
+				    desc->args[1], desc->args[2], x5,
+				    quirk.state.a6, 0, res, &quirk);
+
+		if (res->a0 == QCOM_SCM_INTERRUPTED)
+			cmd = res->a0;
+
+	} while (res->a0 == QCOM_SCM_INTERRUPTED);
+}
+
+static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
+			     struct arm_smccc_res *res, u32 fn_id,
+			     u64 x5, bool atomic)
+{
+	int retry_count = 0;
+
+	if (atomic) {
+		__qcom_scm_call_do(desc, res, fn_id, x5, ARM_SMCCC_FAST_CALL);
+		return;
+	}
+
+	do {
+		mutex_lock(&qcom_scm_lock);
+
+		__qcom_scm_call_do(desc, res, fn_id, x5,
+				   ARM_SMCCC_STD_CALL);
+
+		mutex_unlock(&qcom_scm_lock);
+
+		if (res->a0 == QCOM_SCM_V2_EBUSY) {
+			if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
+				break;
+			msleep(QCOM_SCM_EBUSY_WAIT_MS);
+		}
+	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
+}
+
+static int ___qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
+			    const struct qcom_scm_desc *desc,
+			    struct arm_smccc_res *res, bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
-	int retry_count = 0, i;
+	int i;
 	u32 fn_id = QCOM_SCM_FNID(svc_id, cmd_id);
-	u64 cmd, x5 = desc->args[FIRST_EXT_ARG_IDX];
+	u64 x5 = desc->args[FIRST_EXT_ARG_IDX];
 	dma_addr_t args_phys = 0;
 	void *args_virt = NULL;
 	size_t alloc_len;
-	struct arm_smccc_quirk quirk = {.id = ARM_SMCCC_QUIRK_QCOM_A6};
+	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
 
 	if (unlikely(arglen > N_REGISTER_ARGS)) {
 		alloc_len = N_EXT_QCOM_SCM_ARGS * sizeof(u64);
-		args_virt = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
+		args_virt = kzalloc(PAGE_ALIGN(alloc_len), flag);
 
 		if (!args_virt)
 			return -ENOMEM;
@@ -117,33 +157,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 		x5 = args_phys;
 	}
 
-	do {
-		mutex_lock(&qcom_scm_lock);
-
-		cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL,
-					 qcom_smccc_convention,
-					 ARM_SMCCC_OWNER_SIP, fn_id);
-
-		quirk.state.a6 = 0;
-
-		do {
-			arm_smccc_smc_quirk(cmd, desc->arginfo, desc->args[0],
-				      desc->args[1], desc->args[2], x5,
-				      quirk.state.a6, 0, res, &quirk);
-
-			if (res->a0 == QCOM_SCM_INTERRUPTED)
-				cmd = res->a0;
-
-		} while (res->a0 == QCOM_SCM_INTERRUPTED);
-
-		mutex_unlock(&qcom_scm_lock);
-
-		if (res->a0 == QCOM_SCM_V2_EBUSY) {
-			if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
-				break;
-			msleep(QCOM_SCM_EBUSY_WAIT_MS);
-		}
-	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
+	qcom_scm_call_do(desc, res, fn_id, x5, atomic);
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
@@ -156,6 +170,42 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 	return 0;
 }
 
+/**
+ * qcom_scm_call() - Invoke a syscall in the secure world
+ * @dev:	device
+ * @svc_id:	service identifier
+ * @cmd_id:	command identifier
+ * @desc:	Descriptor structure containing arguments and return values
+ *
+ * Sends a command to the SCM and waits for the command to finish processing.
+ * This should *only* be called in pre-emptible context.
+ */
+static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
+			 const struct qcom_scm_desc *desc,
+			 struct arm_smccc_res *res)
+{
+	might_sleep();
+	return ___qcom_scm_call(dev, svc_id, cmd_id, desc, res, false);
+}
+
+/**
+ * qcom_scm_call_atomic() - atomic variation of qcom_scm_call()
+ * @dev:	device
+ * @svc_id:	service identifier
+ * @cmd_id:	command identifier
+ * @desc:	Descriptor structure containing arguments and return values
+ * @res:	Structure containing results from SMC/HVC call
+ *
+ * Sends a command to the SCM and waits for the command to finish processing.
+ * This can be called in atomic context.
+ */
+static int qcom_scm_call_atomic(struct device *dev, u32 svc_id, u32 cmd_id,
+				const struct qcom_scm_desc *desc,
+				struct arm_smccc_res *res)
+{
+	return ___qcom_scm_call(dev, svc_id, cmd_id, desc, res, true);
+}
+
 /**
  * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
  * @entry: Entry point function for the cpus
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
