Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 735E720B9C9
	for <lists.iommu@lfdr.de>; Fri, 26 Jun 2020 22:04:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 422FB87D1A;
	Fri, 26 Jun 2020 20:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Uvra4vocSNk; Fri, 26 Jun 2020 20:04:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C2B9F87CB6;
	Fri, 26 Jun 2020 20:04:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A92CDC016F;
	Fri, 26 Jun 2020 20:04:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5EABC016F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 20:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BFAF787CEC
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 20:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVAoSDvHtELr for <iommu@lists.linux-foundation.org>;
 Fri, 26 Jun 2020 20:04:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DA7C887CB6
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 20:04:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593201884; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=w7L9q0FJyrGR9ubHX5bPA568m/fho6YvIBGV3F8A+Ko=;
 b=h8oceMwaJDcBv0Bx4NVtGQIN2rFud8gw9HoSpbw2ZbWrkJJWj8hHKCxtX6/cabd748/z1wIr
 g143fVBxXB/cHQvu0bhgJhoDVAnweB4J7g3Wux/vOMMKDltJEt5NdVc7IrVUtyhX0wlpYWGQ
 tV8G7YnqdTBYbuUQlbvTXUnlE8k=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ef654ccc4bb4f886d84e2de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 20:04:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4F7FDC433BA; Fri, 26 Jun 2020 20:04:27 +0000 (UTC)
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A88A6C433C8;
 Fri, 26 Jun 2020 20:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A88A6C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/6] iommu/arm-smmu: Add a domain attribute to pass the
 pagetable config
Date: Fri, 26 Jun 2020 14:04:11 -0600
Message-Id: <20200626200414.14382-4-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626200414.14382-1-jcrouse@codeaurora.org>
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 John Stultz <john.stultz@linaro.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
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

The Adreno GPU has the capacity to manage its own pagetables and switch
them dynamically from the hardware. Add a domain attribute for arm-smmu-v2
to get the default pagetable configuration so that the GPU driver can match
the format for its own pagetables.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 12 ++++++++++++
 include/linux/iommu.h    |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index ce6d654301bf..4bd247dfd703 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1714,6 +1714,18 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 		case DOMAIN_ATTR_NESTING:
 			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
 			return 0;
+		case DOMAIN_ATTR_PGTABLE_CFG: {
+			struct io_pgtable *pgtable;
+			struct io_pgtable_cfg *dest = data;
+
+			if (!smmu_domain->pgtbl_ops)
+				return -ENODEV;
+
+			pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
+
+			memcpy(dest, &pgtable->cfg, sizeof(*dest));
+			return 0;
+		}
 		default:
 			return -ENODEV;
 		}
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 5f0b7859d2eb..2388117641f1 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -124,6 +124,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
+	DOMAIN_ATTR_PGTABLE_CFG,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
