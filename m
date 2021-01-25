Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD29302411
	for <lists.iommu@lfdr.de>; Mon, 25 Jan 2021 12:08:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 392842E115;
	Mon, 25 Jan 2021 11:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSGHIZzlT5bY; Mon, 25 Jan 2021 11:08:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6F0382733D;
	Mon, 25 Jan 2021 11:08:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B236C013A;
	Mon, 25 Jan 2021 11:08:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4339C013A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 11:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B27DE860F0
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 11:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tl_aaOpNLSM5 for <iommu@lists.linux-foundation.org>;
 Mon, 25 Jan 2021 11:08:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B51D285FEB
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 11:08:44 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id q7so11856676wre.13
 for <iommu@lists.linux-foundation.org>; Mon, 25 Jan 2021 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0PBUJkI6WkOQ4c7ebH11XhAeKbkF/R51HzjghE20E74=;
 b=B9KaUOkkiIKWv8s2IR7smiU5sFPjAiN4DvikF1sFMVhKC/uIOvl6ALbKbwpshTHYhq
 uYlkIkMlTVMct834n78aPdvWscG0Eyoc3EnZzONmkn1iXAjMvIy14TGKqXDA4TRJF+ty
 C1CX4PhEEl2T7Ze64pq+ykjrVSqBRYatUZ/6X2KCNmaNWfVgcV20lYHtHjonRCOnLcMH
 USX0CG8hmctAWUpJOgFG0Dkm38Mlx+PprBnJWCsMtGrpZiyguw/Shyso3CvfZCLsaMwh
 aKw5HbfQon2fs6p5JnEGwxdfmg2YXdVUGZpsLiN5qVpWj3UQkrgaxM8HgHAN529NHgQF
 Kpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0PBUJkI6WkOQ4c7ebH11XhAeKbkF/R51HzjghE20E74=;
 b=JCthmtctooan9DMxR2tvSQzaLD9TU9xYvwo7/SauoOF4baqhp32e4zuN4vQCmQKhEW
 wm0sZ5cufnErc+ba4XMzKE5XSDUFbU4a/fqXaoxEMfhyXuuyhZgcJRU6aAEwKPZHKLZG
 v9B+5BVB1U3EqRj9m5zL8xTwdLdDVCGXVEGqeYUh+TTJPojcfhXBP580+bfFuW9yWquT
 zdmbdUF0U9UreV05NLwaqIpJE2lIFUcoDt9FsdxnZ2oTm6cER14C5U7o0ORvFXRiuVz9
 lVPXLUK0h3DULQPD+U0Rw4nnXNjLacObfVqmGHAZpb8lB/c/tTunr4GAVG5RUcAFYVYN
 M4tw==
X-Gm-Message-State: AOAM530Zp5/m8fTIFT4nR0UUsGtgdM5YXBrRRzoJp1n4aiS6t6iPJ9qk
 +l0QYyJqaNW6zCpoIIF+nDvIng==
X-Google-Smtp-Source: ABdhPJysfh1q1euhmxdF39MyQwz999TrOoxuskw/mmjCLv2xHjgMkWMz/PjTfVOd4PHUoWNZqBaizg==
X-Received: by 2002:adf:e8c5:: with SMTP id k5mr338835wrn.242.1611572923092;
 Mon, 25 Jan 2021 03:08:43 -0800 (PST)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u6sm16636014wro.75.2021.01.25.03.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 03:08:42 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v11 01/10] iommu: Fix comment for struct iommu_fwspec
Date: Mon, 25 Jan 2021 12:06:42 +0100
Message-Id: <20210125110650.3232195-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125110650.3232195-1-jean-philippe@linaro.org>
References: <20210125110650.3232195-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: vivek.gautam@arm.com, guohanjun@huawei.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-acpi@vger.kernel.org,
 zhangfei.gao@linaro.org, lenb@kernel.org, devicetree@vger.kernel.org,
 kevin.tian@intel.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 rjw@rjwysocki.net, iommu@lists.linux-foundation.org, sudeep.holla@arm.com,
 robin.murphy@arm.com, linux-accelerators@lists.ozlabs.org
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

Commit 986d5ecc5699 ("iommu: Move fwspec->iommu_priv to struct
dev_iommu") removed iommu_priv from fwspec and commit 5702ee24182f
("ACPI/IORT: Check ATS capability in root complex nodes") added @flags.
Update the struct doc.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/linux/iommu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b3f0e2018c62..bdf3f34a4457 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -570,7 +570,7 @@ struct iommu_group *fsl_mc_device_group(struct device *dev);
  * struct iommu_fwspec - per-device IOMMU instance data
  * @ops: ops for this device's IOMMU
  * @iommu_fwnode: firmware handle for this device's IOMMU
- * @iommu_priv: IOMMU driver private data for this device
+ * @flags: IOMMU_FWSPEC_* flags
  * @num_pasid_bits: number of PASID bits supported by this device
  * @num_ids: number of associated device IDs
  * @ids: IDs which this device may present to the IOMMU
-- 
2.30.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
