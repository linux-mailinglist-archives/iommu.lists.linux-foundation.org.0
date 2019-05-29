Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2132E6DD
	for <lists.iommu@lfdr.de>; Wed, 29 May 2019 23:00:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1797D2A96;
	Wed, 29 May 2019 20:59:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 12C4E2A6B
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 20:55:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BC4B381A
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 20:55:18 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 7B1E961344; Wed, 29 May 2019 20:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1559163318;
	bh=n2zt0GanUIWLgrJz7fCZ/sI6rrlNw5KuRp/QXgNCtHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i07xyBpW+ItVIUgetfisBNxNETW/8YdqkSOA/1K+BYUcH6NGATUnGlzXuOcei13RG
	Pd46vFoBmrBTNKh1brFPrK/A2gYNfEARPkMscsnpbPrkBzKZsyVuiP+2HTqGKsAE39
	TDH/wZXGVErxssIWKOTBT8c3mbwAkIuMCm875OgA=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
	[199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: jcrouse@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 29D3A61196;
	Wed, 29 May 2019 20:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1559163316;
	bh=n2zt0GanUIWLgrJz7fCZ/sI6rrlNw5KuRp/QXgNCtHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kZvKvIeP81tykgOcfXH3sVPApm3sFC85c/7tkGXe1a5MFNhkk+42UCooFgk+5meM+
	0xgvg0tjAVTvAbqCdzV2LuLIHRl4Jpczd9i5o01dUQ+VADD2Xr2/MZCJBQjTNKPnm5
	SaderNpmoB/EFBVrUYIcuNZUh+tG1mpG06kXFcZ0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29D3A61196
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 04/16] iommu/arm-smmu: Add support for
	DOMAIN_ATTR_SPLIT_TABLES
Date: Wed, 29 May 2019 14:54:40 -0600
Message-Id: <1559163292-4792-5-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
Cc: jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
	Will Deacon <will.deacon@arm.com>, dianders@chromium.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	hoegsberg@google.com, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org
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

If DOMAIN_ATTR_SPLIT_TABLES is specified for a domain pass
ARM_64_LPAE_SPLIT_S1 to io_pgtable_ops to allocate and
initialize TTBR0 and TTBR1 pagetables.

v3: Moved all the pagetable specific work into io-pgtable-arm
in previous patch

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 7537639..33e6928 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -260,6 +260,7 @@ struct arm_smmu_domain {
 	bool				non_strict;
 	struct mutex			init_mutex; /* Protects smmu pointer */
 	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
+	u32 attributes;
 	struct iommu_domain		domain;
 };
 
@@ -835,7 +836,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		ias = smmu->va_size;
 		oas = smmu->ipa_size;
 		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
-			fmt = ARM_64_LPAE_S1;
+			if (smmu_domain->attributes &
+				(1 << DOMAIN_ATTR_SPLIT_TABLES))
+				fmt = ARM_64_LPAE_SPLIT_S1;
+			else
+				fmt = ARM_64_LPAE_S1;
 		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
 			fmt = ARM_32_LPAE_S1;
 			ias = min(ias, 32UL);
@@ -1622,6 +1627,10 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 		case DOMAIN_ATTR_NESTING:
 			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
 			return 0;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			*(int *)data = !!(smmu_domain->attributes &
+				(1 << DOMAIN_ATTR_SPLIT_TABLES));
+			return 0;
 		default:
 			return -ENODEV;
 		}
@@ -1662,6 +1671,11 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
 			else
 				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
 			break;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			if (*((int *)data))
+				smmu_domain->attributes |=
+					(1 << DOMAIN_ATTR_SPLIT_TABLES);
+			break;
 		default:
 			ret = -ENODEV;
 		}
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
