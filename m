Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F21318D3C9
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 17:11:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1510889CC;
	Fri, 20 Mar 2020 16:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAR-ORkjW83x; Fri, 20 Mar 2020 16:11:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3581C88A83;
	Fri, 20 Mar 2020 16:11:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FCFEC07FF;
	Fri, 20 Mar 2020 16:11:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDF28C07FF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D96F825DBB
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NB5oiMWHE1Ub for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 16:11:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by silver.osuosl.org (Postfix) with ESMTPS id ECEBA23223
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584720693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbLZORyF+FBzkvN/rkMPuIvUtFOE3LBT6liq8J+EO80=;
 b=Z/okJYl+r/nxxyaZPAH/PTKEGAK9CDdAdhEw64vgnMNs6ArQsNEGdq0oZIFpqSglE/qpjm
 1vHTiNrILm2kRELT+98lodYLmud/UhSuLXlleFOafZqmLQ4B5/TpoPGDtvrAOlsCjzKk3C
 id25Tpb+5E1F+7yxYxDmQq6yEliLMwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-Y8tekUm9MrK0M_UsvaplWw-1; Fri, 20 Mar 2020 12:11:31 -0400
X-MC-Unique: Y8tekUm9MrK0M_UsvaplWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4381C100550D;
 Fri, 20 Mar 2020 16:11:25 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 530F85C1D8;
 Fri, 20 Mar 2020 16:11:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com, jean-philippe.brucker@arm.com, will.deacon@arm.com,
 robin.murphy@arm.com
Subject: [PATCH v10 13/13] iommu/smmuv3: Report non recoverable faults
Date: Fri, 20 Mar 2020 17:09:32 +0100
Message-Id: <20200320160932.27222-14-eric.auger@redhat.com>
In-Reply-To: <20200320160932.27222-1-eric.auger@redhat.com>
References: <20200320160932.27222-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: marc.zyngier@arm.com, peter.maydell@linaro.org
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

When a stage 1 related fault event is read from the event queue,
let's propagate it to potential external fault listeners, ie. users
who registered a fault handler.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v8 -> v9:
- adapt to the removal of IOMMU_FAULT_UNRECOV_PERM_VALID:
  only look at IOMMU_FAULT_UNRECOV_ADDR_VALID which comes with
  perm
- do not advertise IOMMU_FAULT_UNRECOV_PASID_VALID faults for
  translation faults
- trace errors if !master
- test nested before calling iommu_report_device_fault
- call the fault handler unconditionnally in non nested mode

v4 -> v5:
- s/IOMMU_FAULT_PERM_INST/IOMMU_FAULT_PERM_EXEC
---
 drivers/iommu/arm-smmu-v3.c | 182 +++++++++++++++++++++++++++++++++---
 1 file changed, 171 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index c98ee8edf5cf..c906a07396e7 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -171,6 +171,26 @@
 #define ARM_SMMU_PRIQ_IRQ_CFG1		0xd8
 #define ARM_SMMU_PRIQ_IRQ_CFG2		0xdc
 
+/* Events */
+#define ARM_SMMU_EVT_F_UUT		0x01
+#define ARM_SMMU_EVT_C_BAD_STREAMID	0x02
+#define ARM_SMMU_EVT_F_STE_FETCH	0x03
+#define ARM_SMMU_EVT_C_BAD_STE		0x04
+#define ARM_SMMU_EVT_F_BAD_ATS_TREQ	0x05
+#define ARM_SMMU_EVT_F_STREAM_DISABLED	0x06
+#define ARM_SMMU_EVT_F_TRANSL_FORBIDDEN	0x07
+#define ARM_SMMU_EVT_C_BAD_SUBSTREAMID	0x08
+#define ARM_SMMU_EVT_F_CD_FETCH		0x09
+#define ARM_SMMU_EVT_C_BAD_CD		0x0a
+#define ARM_SMMU_EVT_F_WALK_EABT	0x0b
+#define ARM_SMMU_EVT_F_TRANSLATION	0x10
+#define ARM_SMMU_EVT_F_ADDR_SIZE	0x11
+#define ARM_SMMU_EVT_F_ACCESS		0x12
+#define ARM_SMMU_EVT_F_PERMISSION	0x13
+#define ARM_SMMU_EVT_F_TLB_CONFLICT	0x20
+#define ARM_SMMU_EVT_F_CFG_CONFLICT	0x21
+#define ARM_SMMU_EVT_E_PAGE_REQUEST	0x24
+
 /* Common MSI config fields */
 #define MSI_CFG0_ADDR_MASK		GENMASK_ULL(51, 2)
 #define MSI_CFG2_SH			GENMASK(5, 4)
@@ -387,6 +407,15 @@
 #define EVTQ_MAX_SZ_SHIFT		(Q_MAX_SZ_SHIFT - EVTQ_ENT_SZ_SHIFT)
 
 #define EVTQ_0_ID			GENMASK_ULL(7, 0)
+#define EVTQ_0_SSV			GENMASK_ULL(11, 11)
+#define EVTQ_0_SUBSTREAMID		GENMASK_ULL(31, 12)
+#define EVTQ_0_STREAMID			GENMASK_ULL(63, 32)
+#define EVTQ_1_PNU			GENMASK_ULL(33, 33)
+#define EVTQ_1_IND			GENMASK_ULL(34, 34)
+#define EVTQ_1_RNW			GENMASK_ULL(35, 35)
+#define EVTQ_1_S2			GENMASK_ULL(39, 39)
+#define EVTQ_1_CLASS			GENMASK_ULL(40, 41)
+#define EVTQ_3_FETCH_ADDR		GENMASK_ULL(51, 3)
 
 /* PRI queue */
 #define PRIQ_ENT_SZ_SHIFT		4
@@ -730,6 +759,57 @@ struct arm_smmu_domain {
 	spinlock_t			devices_lock;
 };
 
+/* fault propagation */
+struct arm_smmu_fault_propagation_data {
+	enum iommu_fault_reason reason;
+	bool s1_check;
+	u32 fields; /* IOMMU_FAULT_UNRECOV_*_VALID bits */
+};
+
+/*
+ * Describes how SMMU faults translate into generic IOMMU faults
+ * and if they need to be reported externally
+ */
+static const struct arm_smmu_fault_propagation_data fault_propagation[] = {
+[ARM_SMMU_EVT_F_UUT]			= { },
+[ARM_SMMU_EVT_C_BAD_STREAMID]		= { },
+[ARM_SMMU_EVT_F_STE_FETCH]		= { },
+[ARM_SMMU_EVT_C_BAD_STE]		= { },
+[ARM_SMMU_EVT_F_BAD_ATS_TREQ]		= { },
+[ARM_SMMU_EVT_F_STREAM_DISABLED]	= { },
+[ARM_SMMU_EVT_F_TRANSL_FORBIDDEN]	= { },
+[ARM_SMMU_EVT_C_BAD_SUBSTREAMID]	= {IOMMU_FAULT_REASON_PASID_INVALID,
+					   false,
+					   IOMMU_FAULT_UNRECOV_PASID_VALID
+					  },
+[ARM_SMMU_EVT_F_CD_FETCH]		= {IOMMU_FAULT_REASON_PASID_FETCH,
+					   false,
+					   IOMMU_FAULT_UNRECOV_FETCH_ADDR_VALID
+					  },
+[ARM_SMMU_EVT_C_BAD_CD]			= {IOMMU_FAULT_REASON_BAD_PASID_ENTRY,
+					   false,
+					  },
+[ARM_SMMU_EVT_F_WALK_EABT]		= {IOMMU_FAULT_REASON_WALK_EABT, true,
+					   IOMMU_FAULT_UNRECOV_ADDR_VALID |
+					   IOMMU_FAULT_UNRECOV_FETCH_ADDR_VALID
+					  },
+[ARM_SMMU_EVT_F_TRANSLATION]		= {IOMMU_FAULT_REASON_PTE_FETCH, true,
+					   IOMMU_FAULT_UNRECOV_ADDR_VALID
+					  },
+[ARM_SMMU_EVT_F_ADDR_SIZE]		= {IOMMU_FAULT_REASON_OOR_ADDRESS, true,
+					   IOMMU_FAULT_UNRECOV_ADDR_VALID
+					  },
+[ARM_SMMU_EVT_F_ACCESS]			= {IOMMU_FAULT_REASON_ACCESS, true,
+					   IOMMU_FAULT_UNRECOV_ADDR_VALID
+					  },
+[ARM_SMMU_EVT_F_PERMISSION]		= {IOMMU_FAULT_REASON_PERMISSION, true,
+					   IOMMU_FAULT_UNRECOV_ADDR_VALID
+					  },
+[ARM_SMMU_EVT_F_TLB_CONFLICT]		= { },
+[ARM_SMMU_EVT_F_CFG_CONFLICT]		= { },
+[ARM_SMMU_EVT_E_PAGE_REQUEST]		= { },
+};
+
 struct arm_smmu_option_prop {
 	u32 opt;
 	const char *prop;
@@ -2001,7 +2081,6 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
 	return 0;
 }
 
-__maybe_unused
 static struct arm_smmu_master *
 arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
 {
@@ -2027,25 +2106,106 @@ arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
 	return master;
 }
 
+/* Populates the record fields according to the input SMMU event */
+static bool arm_smmu_transcode_fault(u64 *evt, u8 type,
+				     struct iommu_fault_unrecoverable *record)
+{
+	const struct arm_smmu_fault_propagation_data *data;
+	u32 fields;
+
+	if (type >= ARRAY_SIZE(fault_propagation))
+		return false;
+
+	data = &fault_propagation[type];
+	if (!data->reason)
+		return false;
+
+	fields = data->fields;
+
+	if (data->s1_check & FIELD_GET(EVTQ_1_S2, evt[1]))
+		return false; /* S2 related fault, don't propagate */
+
+	if (fields & IOMMU_FAULT_UNRECOV_PASID_VALID)
+		record->pasid = FIELD_GET(EVTQ_0_SUBSTREAMID, evt[0]);
+	else {
+		/* all other transcoded errors have SSV */
+		if (FIELD_GET(EVTQ_0_SSV, evt[0])) {
+			record->pasid = FIELD_GET(EVTQ_0_SUBSTREAMID, evt[0]);
+			fields |= IOMMU_FAULT_UNRECOV_PASID_VALID;
+		}
+	}
+
+	if (fields & IOMMU_FAULT_UNRECOV_ADDR_VALID) {
+		if (FIELD_GET(EVTQ_1_RNW, evt[1]))
+			record->perm = IOMMU_FAULT_PERM_READ;
+		else
+			record->perm = IOMMU_FAULT_PERM_WRITE;
+		if (FIELD_GET(EVTQ_1_PNU, evt[1]))
+			record->perm |= IOMMU_FAULT_PERM_PRIV;
+		if (FIELD_GET(EVTQ_1_IND, evt[1]))
+			record->perm |= IOMMU_FAULT_PERM_EXEC;
+		record->addr = evt[2];
+	}
+
+	if (fields & IOMMU_FAULT_UNRECOV_FETCH_ADDR_VALID)
+		record->fetch_addr = FIELD_GET(EVTQ_3_FETCH_ADDR, evt[3]);
+
+	record->flags = fields;
+	record->reason = data->reason;
+	return true;
+}
+
+static void arm_smmu_report_event(struct arm_smmu_device *smmu, u64 *evt)
+{
+	u32 sid = FIELD_GET(EVTQ_0_STREAMID, evt[0]);
+	u8 type = FIELD_GET(EVTQ_0_ID, evt[0]);
+	struct arm_smmu_master *master;
+	struct iommu_fault_event event = {};
+	bool nested;
+	int i;
+
+	master = arm_smmu_find_master(smmu, sid);
+	if (!master || !master->domain)
+		goto out;
+
+	event.fault.type = IOMMU_FAULT_DMA_UNRECOV;
+
+	nested = (master->domain->stage == ARM_SMMU_DOMAIN_NESTED);
+
+	if (nested) {
+		if (arm_smmu_transcode_fault(evt, type, &event.fault.event)) {
+			/*
+			 * Only S1 related faults should be reported to the
+			 * guest and must not flood the host log.
+			 * Also a fault handler should have been registered
+			 * to guarantee the full nested functionality
+			 */
+			WARN_ON_ONCE(iommu_report_device_fault(master->dev,
+							       &event));
+			return;
+		}
+	} else {
+		iommu_report_device_fault(master->dev, &event);
+	}
+out:
+	dev_info(smmu->dev, "event 0x%02x received:\n", type);
+	for (i = 0; i < EVTQ_ENT_DWORDS; ++i) {
+		dev_info(smmu->dev, "\t0x%016llx\n",
+			 (unsigned long long)evt[i]);
+	}
+}
+
 /* IRQ and event handlers */
 static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
 {
-	int i;
 	struct arm_smmu_device *smmu = dev;
 	struct arm_smmu_queue *q = &smmu->evtq.q;
 	struct arm_smmu_ll_queue *llq = &q->llq;
 	u64 evt[EVTQ_ENT_DWORDS];
 
 	do {
-		while (!queue_remove_raw(q, evt)) {
-			u8 id = FIELD_GET(EVTQ_0_ID, evt[0]);
-
-			dev_info(smmu->dev, "event 0x%02x received:\n", id);
-			for (i = 0; i < ARRAY_SIZE(evt); ++i)
-				dev_info(smmu->dev, "\t0x%016llx\n",
-					 (unsigned long long)evt[i]);
-
-		}
+		while (!queue_remove_raw(q, evt))
+			arm_smmu_report_event(smmu, evt);
 
 		/*
 		 * Not much we can do on overflow, so scream and pretend we're
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
