Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D10D512948
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 04:02:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E46C405E7;
	Thu, 28 Apr 2022 02:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 93FOrWoLNeAa; Thu, 28 Apr 2022 02:02:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 466E9404F9;
	Thu, 28 Apr 2022 02:02:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8ADCEC0084;
	Thu, 28 Apr 2022 02:02:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1121C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 01:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7135181DBF
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 01:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=sholland.org header.b="FrGZ3IwM";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="mJfp/fEw"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gUB63BTvqIe for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 01:10:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8752E824DF
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 01:10:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 59C645C0206;
 Wed, 27 Apr 2022 21:04:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 27 Apr 2022 21:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1651107862; x=1651194262; bh=pW
 /iSjCJy6f2Vv0EQ/XJtZJNRvKHgymrVop1mTD/+d4=; b=FrGZ3IwMEyxk0BjXNO
 Vn6EK3IZkTeZYX1nmAgh0L/6GXH09OQFz5khjVFhqRQxvkDQ8iDuC/qi1acgqZqw
 tv8WRkEfQ4AoTjTRlaN6NhaK0RhZo1oWrkSkFdGyas5kgvRGJfsHCpjhYq78DvPe
 609Tt9NTCeO4N4Zm+TxBjBv+YRMa+Ie+sePBHJka1zTa2CT01GJCMFlJV9lF4zqz
 uGaKapqLbcroSeG19fmO4qom2nOwvEZOPxDShOLWyntpjiqX6PH+QZXp1bbQNnyg
 Iq7zhzqcW8PI2A+NZF6EY8wccvQ+EHyzA+wRQBo0Slg0FHmm9LrX0FLyT4GujU64
 usKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651107862; x=1651194262; bh=pW/iSjCJy6f2Vv0EQ/XJtZJNRvKHgymrVop
 1mTD/+d4=; b=mJfp/fEwio/wl6hdscLqZwCPe04Lu8yYNk6DvErXlKYQrQiGlil
 dtH8DNLmMB/e2xjTKRjqv/DxgQgFsbVkjeIDdg9TdA8MIEDnSZvRwArLL+/riO3P
 yIFXrAdNx0jorrx8hpPN+o7ZWq2ZWzPM0j+aAK/tSgXXKhLFnqNts6h4AUk98KUC
 HAQ0y7n607zCKnHuDK74hDqqBE0GpJdH37c6/Vdla+aKdBokMbzJSpDgqlML4Hu7
 oahEmPxd7qZ+tHqNg3PCInxvCAdVFsr4eCnN3hirg9/u2OhrWKUTJVgaH9uTSuCE
 4sLZmHvMPzTGGCwpF1xXzf1ZY5GbF66rsnA==
X-ME-Sender: <xms:FuhpYq0EZ0uZKl5xR_YXNiBCVJ6i6ZxKi8257WG1dtW1ASthe0MaqQ>
 <xme:FuhpYtGHgkZZreEXAGXhoRmHQcTbFMkwVes6T-yuSMZ2_3BjxDDlSKReDfPq4eGtQ
 4-xZWJ6KAAJAdDyiw>
X-ME-Received: <xmr:FuhpYi7ypbVtND9R0bjH6s6mnQHQS_hCH1Y0-_t1VKoCku5sAZdImsO-kcHTca-E0AI3OWmmA_Y02HcufFmu3VRhKTWsgb3GKDrdIkovgoMcXKrfEQCyZ7pvaSKvMQM6CBx7yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:FuhpYr3diNoK6jg3AVunpqPYUeYJqwGsGLmMEvvL3BLsmCGahaGAZA>
 <xmx:FuhpYtH7_Y9s7kJNLTNaVP3OL7_PTyrChjaRu3h0Ue7-XqW4ZDMMvw>
 <xmx:FuhpYk-a9GL8Z6J72ariS91YzrmcOyFbbpVons82YM8BTnuYK7KdOQ>
 <xmx:FuhpYvGQDdk5fOER4xo_VaXjotqiTRriv4oCud3RLOqI_7M0QDhaAQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 21:04:21 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org
Subject: [PATCH 4/5] iommu/sun50i: Add support for the D1 variant
Date: Wed, 27 Apr 2022 20:03:59 -0500
Message-Id: <20220428010401.11323-5-samuel@sholland.org>
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

D1 contains an IOMMU similar to the one in the H6 SoC, but the D1
variant has no external reset signal. It also has some register
definition changes, but none that affect the current driver.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/iommu/sun50i-iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index b9e644b93637..1fb707e37fb3 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -999,11 +999,15 @@ static int sun50i_iommu_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static const struct sun50i_iommu_variant sun20i_d1_iommu = {
+};
+
 static const struct sun50i_iommu_variant sun50i_h6_iommu = {
 	.has_reset = true,
 };
 
 static const struct of_device_id sun50i_iommu_dt[] = {
+	{ .compatible = "allwinner,sun20i-d1-iommu", .data = &sun20i_d1_iommu },
 	{ .compatible = "allwinner,sun50i-h6-iommu", .data = &sun50i_h6_iommu },
 	{ /* sentinel */ },
 };
-- 
2.35.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
