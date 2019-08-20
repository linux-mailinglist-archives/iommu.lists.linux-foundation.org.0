Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2C0968F5
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 21:07:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A41AED48;
	Tue, 20 Aug 2019 19:06:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 92AF2C87
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 19:06:45 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EFCEC87
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 19:06:44 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id D70A06115D; Tue, 20 Aug 2019 19:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1566328004;
	bh=OnE1CRltdThiSh478OmHpFjhtqzYCN7pRfxgwT3K5Vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IgFkJdL0ALFRYYrWGproQZN4BP4rNXrgT0RY8B79h72JQ+sULJ6FfqUF2RNG/gX/3
	lllx+JQXaHzpnVfSVyZoXp6rbwz+5Bkr8/no/PrqNpNATtAVCy9GOcBIdfhyy2GlV2
	Lq/pB9YInwIuZoDUHMrwosVAtDV50gJYZn9CQ3jM=
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
	by smtp.codeaurora.org (Postfix) with ESMTPSA id A27D66115D;
	Tue, 20 Aug 2019 19:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1566328004;
	bh=OnE1CRltdThiSh478OmHpFjhtqzYCN7pRfxgwT3K5Vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IgFkJdL0ALFRYYrWGproQZN4BP4rNXrgT0RY8B79h72JQ+sULJ6FfqUF2RNG/gX/3
	lllx+JQXaHzpnVfSVyZoXp6rbwz+5Bkr8/no/PrqNpNATtAVCy9GOcBIdfhyy2GlV2
	Lq/pB9YInwIuZoDUHMrwosVAtDV50gJYZn9CQ3jM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A27D66115D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 5/7] iommu/arm-smmu: Support DOMAIN_ATTR_SPLIT_TABLES
Date: Tue, 20 Aug 2019 13:06:30 -0600
Message-Id: <1566327992-362-6-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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

Support the DOMAIN_ATTR_SPLIT_TABLES attribute to let the leaf driver
know if split pagetables are enabled for the domain.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 3f41cf7..6a512ff 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1442,6 +1442,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 		case DOMAIN_ATTR_NESTING:
 			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
 			return 0;
+		case DOMAIN_ATTR_SPLIT_TABLES:
+			*(int *)data = !!(smmu_domain->split_pagetables);
+			return 0;
 		default:
 			return -ENODEV;
 		}
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
