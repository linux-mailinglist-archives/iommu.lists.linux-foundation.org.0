Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5B51F08C9
	for <lists.iommu@lfdr.de>; Sat,  6 Jun 2020 22:34:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7DFEE86228;
	Sat,  6 Jun 2020 20:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBzRnprJYZSg; Sat,  6 Jun 2020 20:34:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 210AD86160;
	Sat,  6 Jun 2020 20:34:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14549C016E;
	Sat,  6 Jun 2020 20:34:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90D80C016E
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 20:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 82F4286160
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 20:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mtlr-WNQEktK for <iommu@lists.linux-foundation.org>;
 Sat,  6 Jun 2020 20:34:06 +0000 (UTC)
X-Greylist: delayed 00:40:00 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0120.hostedemail.com
 [216.40.44.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E008E8613E
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 20:34:05 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 8BCA618019B23
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 19:16:22 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 1E063180A7FE5;
 Sat,  6 Jun 2020 19:16:20 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:334:355:368:369:379:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1437:1515:1516:1518:1534:1540:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3351:3865:3870:3871:3872:3874:4250:4605:5007:7903:10004:10400:10848:11026:11232:11473:11658:11914:12043:12114:12296:12297:12438:12555:12760:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21627:30054:30070:30089,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: hour66_0a10d3c26dab
X-Filterd-Recvd-Size: 1803
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Sat,  6 Jun 2020 19:16:18 +0000 (UTC)
Message-ID: <5a663096b489b86472fe3bfbd5138c411d669bad.camel@perches.com>
Subject: [Possible PATCH] iommu/qcom: Change CONFIG_BIG_ENDIAN to
 CONFIG_CPU_BIG_ENDIAN
From: Joe Perches <joe@perches.com>
To: Rob Clark <robdclark@gmail.com>
Date: Sat, 06 Jun 2020 12:16:17 -0700
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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

CONFIG_BIG_ENDIAN does not exist as a Kconfig symbol.

Signed-off-by: Joe Perches <joe@perches.com>
---

I don't have the hardware, so I can't tell if this is a
correct change, but it is a logical one.

Found by a test script that looks for IS_ENABLED(FOO)
where FOO must also exist in Kconfig files.

 drivers/iommu/qcom_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index c3e1fbd1988c..69e113471ecb 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -304,7 +304,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		      ARM_SMMU_SCTLR_M | ARM_SMMU_SCTLR_S1_ASIDPNE |
 		      ARM_SMMU_SCTLR_CFCFG;
 
-		if (IS_ENABLED(CONFIG_BIG_ENDIAN))
+		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 			reg |= ARM_SMMU_SCTLR_E;
 
 		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, reg);

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
