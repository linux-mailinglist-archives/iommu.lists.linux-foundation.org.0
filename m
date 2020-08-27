Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 79456254874
	for <lists.iommu@lfdr.de>; Thu, 27 Aug 2020 17:07:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 32E0486B47;
	Thu, 27 Aug 2020 15:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1KHjs7xMkjW; Thu, 27 Aug 2020 15:07:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF3C3876F9;
	Thu, 27 Aug 2020 15:07:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1147C016F;
	Thu, 27 Aug 2020 15:07:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16336C0895
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 15:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0437220763
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 15:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMLIANBJurPD for <iommu@lists.linux-foundation.org>;
 Thu, 27 Aug 2020 15:07:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by silver.osuosl.org (Postfix) with ESMTPS id E50A3203D7
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 15:07:00 +0000 (UTC)
IronPort-SDR: xLgS6ANGb/AEz8temxNshwbdQPhMxgq/oirrZ4HMXBUfH/S6qUTRPalWfNgOpjZ1+gvwPKL8V1
 OhPuYBvfJegA==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="144175672"
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="144175672"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 08:06:59 -0700
IronPort-SDR: KrAJ8zjxYoaxJcH0+y/mqYckOx4xFJudbvlmx8E9Nn+98cPELi7ivn513WINRbRUujwJrWTj8b
 4rLVBM1Vu8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="332212848"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2020 08:06:58 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H Peter Anvin" <hpa@zytor.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Jean-Philippe Brucker" <jean-philippe@linaro.org>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 "Dave Hansen" <dave.hansen@intel.com>, "Tony Luck" <tony.luck@intel.com>,
 "Ashok Raj" <ashok.raj@intel.com>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Dave Jiang" <dave.jiang@intel.com>, "Sohil Mehta" <sohil.mehta@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH v7 2/9] iommu/vt-d: Change flags type to unsigned int in
 binding mm
Date: Thu, 27 Aug 2020 08:06:27 -0700
Message-Id: <1598540794-132666-3-git-send-email-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1598540794-132666-1-git-send-email-fenghua.yu@intel.com>
References: <1598540794-132666-1-git-send-email-fenghua.yu@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, iommu@lists.linux-foundation.org,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

"flags" passed to intel_svm_bind_mm() is a bit mask and should be
defined as "unsigned int" instead of "int".

Change its type to "unsigned int".

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
---
v5:
- Reviewed by Lu Baolu

v2:
- Add this new patch per Thomas' comment.

 drivers/iommu/intel/svm.c   | 7 ++++---
 include/linux/intel-iommu.h | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index e78a74a9c1cf..fc90a079e228 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -446,7 +446,8 @@ int intel_svm_unbind_gpasid(struct device *dev, u32 pasid)
 
 /* Caller must hold pasid_mutex, mm reference */
 static int
-intel_svm_bind_mm(struct device *dev, int flags, struct svm_dev_ops *ops,
+intel_svm_bind_mm(struct device *dev, unsigned int flags,
+		  struct svm_dev_ops *ops,
 		  struct mm_struct *mm, struct intel_svm_dev **sd)
 {
 	struct intel_iommu *iommu = device_to_iommu(dev, NULL, NULL);
@@ -1033,7 +1034,7 @@ intel_svm_bind(struct device *dev, struct mm_struct *mm, void *drvdata)
 {
 	struct iommu_sva *sva = ERR_PTR(-EINVAL);
 	struct intel_svm_dev *sdev = NULL;
-	int flags = 0;
+	unsigned int flags = 0;
 	int ret;
 
 	/*
@@ -1042,7 +1043,7 @@ intel_svm_bind(struct device *dev, struct mm_struct *mm, void *drvdata)
 	 * and intel_svm etc.
 	 */
 	if (drvdata)
-		flags = *(int *)drvdata;
+		flags = *(unsigned int *)drvdata;
 	mutex_lock(&pasid_mutex);
 	ret = intel_svm_bind_mm(dev, flags, NULL, mm, &sdev);
 	if (ret)
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 7322073f62d0..9c3e8337442a 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -765,7 +765,7 @@ struct intel_svm {
 	struct mm_struct *mm;
 
 	struct intel_iommu *iommu;
-	int flags;
+	unsigned int flags;
 	u32 pasid;
 	int gpasid; /* In case that guest PASID is different from host PASID */
 	struct list_head devs;
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
