Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942B20C975
	for <lists.iommu@lfdr.de>; Sun, 28 Jun 2020 20:16:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 41A15867B9;
	Sun, 28 Jun 2020 18:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpKynLKskd0P; Sun, 28 Jun 2020 18:16:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A881C86722;
	Sun, 28 Jun 2020 18:16:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 944E8C016E;
	Sun, 28 Jun 2020 18:16:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E223AC016E
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 18:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE63587A33
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 18:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30U1FXXFWZAz for <iommu@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 18:16:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F0C987A6B
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 18:16:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D0B44B70;
 Sun, 28 Jun 2020 14:08:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 28 Jun 2020 14:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=f7le4kzlMY3HxfADRkf0izXbbt
 zHcsMuuVeVp0nsTiU=; b=MfOUxTK+vUGNnoDL5FisZCKE64mDIRCh8jBka0wbAw
 /rCyUnGQQf90r7t5zTrHcPAVkFudQ602JvPkc4N3W58z+CaErPCqqfR5fBc+vweh
 L+B2f0q4RxkAtXyRSj3upye4k/5Nsm6tl6nXcYIhoKAz66xhQkRsl8mUFd/n6FFk
 KKuEHT2icZw8gh1V1GPHq2HeJ3Zmc1JG1fUzb7aqKmyO8avSrGrAPylWHwR8Q4+E
 Ugpn5bGuWPlKwFsEZrdYyQVDr5GwANbIDM4Gx/GrpbbILdrc3sJ26FFdaSIFv39M
 MBM1GL0sjgDRc2zzJpaGUCr4pa3wRwjK0mJn0Tg9h8DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=f7le4kzlMY3HxfADR
 kf0izXbbtzHcsMuuVeVp0nsTiU=; b=HGjOcyWC5iESKoUT0CT+/2TJ9+QxdSSsN
 fi1q0TEUljRhjOaG7c07wAqXNMIU0oYs2CsU2Dho0wY1Xpd4NI8Q+is1PU8cWKMY
 v8CLT4ddwzSzSsPLpJkix5Tue5CGJB8Us8roYVH+KxtEGZhDImim+8Ziwab08MoZ
 bkLfxSVa6CR1uM/jM4jzod8S/9q9kTZZYlJa+2eTrvfzYUghkZUuBqSAiWwLOwNQ
 QwX7nRtq0IOhHkTtPRk+d9qSB2w5ZXIl6lNBdtXNoVCd2E2oa437hktcvGiEFtq4
 JVaXl8BzNW9C7zOVJ65SCXv44STzhQYwmWfM5pMjH0a2zEQKMC43w==
X-ME-Sender: <xms:r9z4Xl6xSJXLg1v9LpP9Zd7AtI4Kd4ZQ4JlbkaI-MLD0ezF8YupdGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeliedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeej
 geenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:r9z4Xi4V7C2jDUxfL_KOfKUoZH6OaBAvoO-WZtNfTYy-YNTdHtI1eQ>
 <xmx:r9z4XsewVAp5QltjE6-actO92_P8l0prk0S61QKSeAl-O5B9xUqHSw>
 <xmx:r9z4XuJ6OUuz9F3ZnHN13pErWXWHVju_yiRQSTDIRe_xm_MCFoV4YA>
 <xmx:r9z4XnhAvKEXpR1bOGCmImOoBKYdx0bWt-_jaJvpdiuXQV6lhDFgDw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E00343067BB0;
 Sun, 28 Jun 2020 14:08:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/2] iommu/sun50i: Change the readl timeout to the atomic
 variant
Date: Sun, 28 Jun 2020 20:08:43 +0200
Message-Id: <20200628180844.79205-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

The flush_all_tlb call back can be called from an atomic context, so using
readl_poll_timeout that embeds a udelay doesn't work.

Fixes: 4100b8c229b3 ("iommu: Add Allwinner H6 IOMMU driver")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/iommu/sun50i-iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index fce605e96aa2..a1563b54c743 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -313,9 +313,9 @@ static int sun50i_iommu_flush_all_tlb(struct sun50i_iommu *iommu)
 		    IOMMU_TLB_FLUSH_MICRO_TLB(1) |
 		    IOMMU_TLB_FLUSH_MICRO_TLB(0));
 
-	ret = readl_poll_timeout(iommu->base + IOMMU_TLB_FLUSH_REG,
-				 reg, !reg,
-				 1, 2000);
+	ret = readl_poll_timeout_atomic(iommu->base + IOMMU_TLB_FLUSH_REG,
+					reg, !reg,
+					1, 2000);
 	if (ret)
 		dev_warn(iommu->dev, "TLB Flush timed out!\n");
 
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
