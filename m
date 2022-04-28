Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A183B512945
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 04:02:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29AB960F4B;
	Thu, 28 Apr 2022 02:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOBOfpXucw6C; Thu, 28 Apr 2022 02:02:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4F92360F03;
	Thu, 28 Apr 2022 02:02:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E8FFC0081;
	Thu, 28 Apr 2022 02:02:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83D55C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 01:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70FC0403C4
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 01:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=sholland.org header.b="C8sbB9Rs";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="GjhI6f+P"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hj2c9Gg6cc_R for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 01:10:47 +0000 (UTC)
X-Greylist: delayed 00:06:32 by SQLgrey-1.8.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D19C40159
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 01:10:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B70B5C0219;
 Wed, 27 Apr 2022 21:04:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 27 Apr 2022 21:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1651107864; x=1651194264; bh=hF
 ubptiKk+WdrpVFqA1+L1fyR6PoDcD+g1uY9JtK+1Y=; b=C8sbB9RsZ8DqF2YunK
 QO8ZGFnsm0sSJwnkZedL7kF4S3V2+om/3RJNfuujI/Aq1EK2YIDEY/7Ky3UGHzJE
 ejhDkZOI4Y58GFf1cSKqH4tPi6ewWlPZ4VmG+u/mD0szPVsurpnLcOucN+0GE0hb
 q7VXHKbWGWHbcsZL1HEE44u1TFwrXgwHcOlHnEcrRewXwIRKYpH87EAtMFUDxCfT
 b9HnbAR+ovOzBAzTOrHuaXztLTSQ/HGgEKd22z0Sf0ar1D5S8O2mHzo/cZy+iDeA
 Ihr3AEVpK6uHm3+XU02NijWue0UHo81iYKvDTr6TKktM+4bxfN9b2sioPeVLQiKS
 jwBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651107864; x=1651194264; bh=hFubptiKk+WdrpVFqA1+L1fyR6PoDcD+g1u
 Y9JtK+1Y=; b=GjhI6f+Pz9p0zo90iyPRMPtUKuvdgZ/J7OIC35knre2KqvDLmXm
 aVLQ6pGKePTlnZ/FL2u35xYoraNRJB5HInSy4NzVG4u5jbK7X431JxfZDRyIL0Z3
 PCy1m159Oe2HEVJOWtzLIlCmXHB03cHW5ewZmFlHNkIejoaZ34gpo4H92a2GgsE7
 CX+rqJp1Gl401Vy4aqBB7anhzBmE3HGCuIyOdN722wnWzcoVKgyYItDd3ExV1qab
 OI7uKxn3bcsWHXHrpx+vKqmnSojBipRX/90+cgKBbklqg4vsZoE885gMV5zpL5uV
 ueF2u7SRQ73qrzSRB+KIV4ITInzHwcGTK4w==
X-ME-Sender: <xms:GOhpYkzuiH-p_RNEUJ44ZLyxHBO4-cUlnNBoFJv2Tko_7s80VKG97Q>
 <xme:GOhpYoTaazEJH3OU1bwC_a3smKj0eiKGkHh9sH_giXcPOAKTpBKkgmXa8XEwmSZdz
 _i0g1kzTHQ0XoJNzA>
X-ME-Received: <xmr:GOhpYmX6TtK5aKLmKgb_3qIUV0fev2ATMnCqdy1SazcJPHqFt9Ry-qIFI8AaT5Ho7XUBwVF5pdTjUNX1KwfruDs0Qb2TJOQPozkyjjKEytdVNViFecz4xDDVAjs7I1OKHJNbjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:GOhpYijHljBkJp2PzRTqlHSfedQ5_NGUCB75LV80pMV5k41s0F26BA>
 <xmx:GOhpYmCARKzorQwB8vkObTo8V7A812hrtRleBBqLqlVmD5sqWlBFCg>
 <xmx:GOhpYjKF5_09Ka5F4m_B7JUDEAhgj6K-s9kUZL3mbrHHp2-9mshpQg>
 <xmx:GOhpYsQRm8BtqOCvFxTWXTU43XlJ-mz68drClYskBalye7AdoPUVtA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 21:04:23 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org
Subject: [PATCH 5/5] iommu/sun50i: Ensure the IOMMU can be used for DMA
Date: Wed, 27 Apr 2022 20:04:00 -0500
Message-Id: <20220428010401.11323-6-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428010401.11323-1-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Apr 2022 02:02:11 +0000
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

So far, the driver has relied on arch/arm64/Kconfig to select IOMMU_DMA.
Unsurprisingly, this does not work on RISC-V, so the driver must select
IOMMU_DMA itself.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/iommu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c79a0df090c0..70a0bfa6d907 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -223,6 +223,7 @@ config SUN50I_IOMMU
 	depends on ARCH_SUNXI || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
+	select IOMMU_DMA
 	help
 	  Support for the IOMMU introduced in the Allwinner H6 SoCs.
 
-- 
2.35.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
