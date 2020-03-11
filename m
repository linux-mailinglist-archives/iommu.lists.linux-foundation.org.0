Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ED73F181890
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 13:47:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A34632263E;
	Wed, 11 Mar 2020 12:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8TuBtW2kOlJ; Wed, 11 Mar 2020 12:47:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AB6C82264A;
	Wed, 11 Mar 2020 12:47:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96D0BC0177;
	Wed, 11 Mar 2020 12:47:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37F0FC18D3
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 12:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E3B0A85F7D
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 12:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w97hyEcqdfm7 for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 12:47:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3844885F67
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 12:47:05 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a141so1973357wme.2
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FfMBk8SLNbiqvSQTKNw5nVOwT2ukh4ZsyZ4CcWYi0pU=;
 b=kGuexoqbuQJZfLJ6IRVhdgqXT2Li0ISoLXz0HBfWDMtpencXONYJHfL5BMvcPqfGns
 KTLe7/XryQ8otcvTvvBmXsfwat0eWTcx2+S3AY+1GUovN8spX6q7o2ijMrTUu5CI7XZi
 sXSmXpsBNPqNuYtOOjN0yT9WFBfYw8z72+I3JHP780/sn1m+qnJhj57OTTCF5Rl7VNbI
 I7+Cx38sOpBfHpJyAtHR0EJE+EL+xYVzqLpK9UKTABDAepAg9uvq1mm+y1d2lHqjsV/o
 5qIAXn96SgCfw69yQzALEut3rCN9yVu46I16Uc8TUdhIIoc5YfzmjtVW8PyrVvwzibNe
 fBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FfMBk8SLNbiqvSQTKNw5nVOwT2ukh4ZsyZ4CcWYi0pU=;
 b=N9jWeO83C2QW0IGDxJcj1ZkM+U54PKTvJ0iM2GXrLXv4Jf5Szjh0YOYGxn/zkMBceV
 vwZq4K4qMxKiFuY2P33t2OiebLZ0wWcJz5oFwEGgj3xr3BS0LTxzgxTebQaNsNU9IWpQ
 Gzk2PfsPiTdd4/eX0kyBzLJGyB7XcJRsJOxjKWowyhsvfLvrgJYHJjKrZCbq74Wskdf1
 PRqSiwRLCf4cihDr4ylXcC2YUv0+tGb9h4STcB4mPQUftX/0bn5ytIB/xC7dfVqH2kHg
 VtDuxVCvkO4oyVuR0YaP0dScnfqcd2cLvYGfVzPEDiDFbcgMtx4ZVOTKjsWFaORCG/5y
 yyMA==
X-Gm-Message-State: ANhLgQ0SLumSJ/HSHiS1+AyJ1XYGA8RK0NfaHk46/he85ZMIqELlsrfu
 7tUcVewuBNBfcnVw/z0fES2IlA==
X-Google-Smtp-Source: ADFU+vtntOL4brDxmDQGG6xeJrIuadRvitxT9k9QnLoTDiM4xzqU981cVjB7SKKNNlkYOG+EtlWXJA==
X-Received: by 2002:a1c:5443:: with SMTP id p3mr3479986wmi.149.1583930823712; 
 Wed, 11 Mar 2020 05:47:03 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id c2sm8380020wma.39.2020.03.11.05.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 05:47:03 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: bhelgaas@google.com, will@kernel.org, robh+dt@kernel.org, joro@8bytes.org,
 baolu.lu@linux.intel.com, sudeep.holla@arm.com, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: [PATCH v2 07/11] iommu/arm-smmu-v3: Use pci_ats_supported()
Date: Wed, 11 Mar 2020 13:45:02 +0100
Message-Id: <20200311124506.208376-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311124506.208376-1-jean-philippe@linaro.org>
References: <20200311124506.208376-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 frowand.list@gmail.com, corbet@lwn.net, liviu.dudau@arm.com, rjw@rjwysocki.net,
 guohanjun@huawei.com, amurray@thegoodpenguin.co.uk, robin.murphy@arm.com,
 dwmw2@infradead.org, lenb@kernel.org
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

The new pci_ats_supported() function checks if a device supports ATS and
is allowed to use it.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/arm-smmu-v3.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 4f0a38dae6db..87ae31ef35a1 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2592,26 +2592,14 @@ static void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master)
 	}
 }
 
-#ifdef CONFIG_PCI_ATS
 static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
 {
-	struct pci_dev *pdev;
+	struct device *dev = master->dev;
 	struct arm_smmu_device *smmu = master->smmu;
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
-
-	if (!(smmu->features & ARM_SMMU_FEAT_ATS) || !dev_is_pci(master->dev) ||
-	    !(fwspec->flags & IOMMU_FWSPEC_PCI_RC_ATS) || pci_ats_disabled())
-		return false;
 
-	pdev = to_pci_dev(master->dev);
-	return !pdev->untrusted && pdev->ats_cap;
+	return (smmu->features & ARM_SMMU_FEAT_ATS) && dev_is_pci(dev) &&
+		pci_ats_supported(to_pci_dev(dev));
 }
-#else
-static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
-{
-	return false;
-}
-#endif
 
 static void arm_smmu_enable_ats(struct arm_smmu_master *master)
 {
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
