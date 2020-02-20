Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C609C166606
	for <lists.iommu@lfdr.de>; Thu, 20 Feb 2020 19:15:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7B29221526;
	Thu, 20 Feb 2020 18:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTUN3CGl+dK0; Thu, 20 Feb 2020 18:15:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B7E1221519;
	Thu, 20 Feb 2020 18:15:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE89CC013E;
	Thu, 20 Feb 2020 18:15:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06B8AC013E
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 18:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 027E485F8B
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 18:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xr5CsuJd870h for <iommu@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 18:15:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A90E585F8A
 for <iommu@lists.linux-foundation.org>; Thu, 20 Feb 2020 18:15:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FA3A21E6A;
 Thu, 20 Feb 2020 13:15:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Feb 2020 13:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=bTY04C+O+M5VoNh7o4Q2CKTee3
 XA402Zn2WokekNQ4g=; b=uD/51iPXR6UQ+mLunvu1VciARUfS67NKWlzivratHe
 T3J91p/XxhI3LA7K5BLWMi09qvjJ1b/P0JIc91kac6NWCHnLiZqaxN9Ee1zMVDFz
 zdV8x9KBD2oH0LsPxXcrTRoZXEwCkNOtzvLZbgwjPq4u/V67lW6X2i1yjcRz2dkf
 CG4uS4GgIjKgt9umzpeV8vOSmNMj1BS5bUxMlMYXtYZguarz/fSWYwmA5u53v1Sy
 6sKC5AW+mxGIHTMQh4z1yb3d6fJR2ImAc1HPKcn8ndysXXibElzKMdoriu2kNMSF
 eda/oZF2sylMCQDSOVjsJ/HOYoV28wYDXDk1JvqzumBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bTY04C+O+M5VoNh7o
 4Q2CKTee3XA402Zn2WokekNQ4g=; b=l8Fh8IJJf4UjcISRG7CtRjzxk88/OBY3o
 mOXzK8CaoNfJE62lYtQ0Nl+zXGCKuwg55smzhkjBOV85V3dXj+XPpwgN68EtmKXz
 jKueU6zmeuybkiOSooZr8kMPcd2PZVFeLYG/G/B7gYkAp2B5wz2VhXlXX1pJW6Fd
 WCj6AhhXNR720mkyO5g1T621MGd4Hx0oEZcG09zJse6BPUszhMcx/9Mv4NLqk4fT
 /t9K20LDaQtqdB5YKo9cbj/PlEGZeeE05vRMlNyDq/VhryN1Pf4Xpn8ZEy5wnOAd
 RbMWiAG+aG406Rvdb4aWTXVw+9k+hqOo8HXJHlZ08faI0biT7sJ8g==
X-ME-Sender: <xms:t8xOXrgPoQaAyMBXfjzlsYrIIU36Yn4Bgh1eEPlNGhYldNsRJo4kuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrke
 elrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:t8xOXpgdGlY4YknBhal7OL7MTehCLvwZtEO5Ib6mcMDAlkFnfRkC1w>
 <xmx:t8xOXju47exmKdTUbBzm5illLucTRA_ghazYHhSGTKFkiIw9oy71YQ>
 <xmx:t8xOXqSFebpkxj1GX7s-L375DhI_wkIp3wFXYrTueQBn2TBsybKYVw>
 <xmx:uMxOXgPizo3iIBiQps2hulvk78eDkxvvVOOzqzHwP90F3XhP_OOm4Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B4C8C3280062;
 Thu, 20 Feb 2020 13:15:18 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 0/4] iommu: Add Allwinner H6 IOMMU driver
Date: Thu, 20 Feb 2020 19:15:12 +0100
Message-Id: <cover.a31c229a83f1d92e6928ae2adb70887da0fd44b3.1582222496.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
 Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org
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

Hi,

Here's a series adding support for the IOMMU introduced in the Allwinner
H6. The driver from Allwinner hints at more SoCs using it in the future
(with more masters), so we can bet on that IOMMU becoming pretty much
standard in new SoCs from Allwinner.

One thing I wasn't really sure about was how to expose the statistics
reported by the IOMMU PMU (TLB hit rates, latencies, and so on). The
Allwinner driver exposes them through custom sysfs files, while they would
be best represented through perf I guess? Anyway, I'm planning to support
them later on.

Let me know what you think,
Maxime

Changes from v1:
  - Add a patch to configure the IOMMU on the virtual DRM device
  - Rework the domain allocation / freeing
  - Remove the runtime_pm handling to power up the device and rely on
    refcounting
  - use map gfp argument for kmem cache allocation
  - Removed unused macros
  - Switched from BIT(0) to 1 for the page table entry valid flag to make
    it more obvious that it's over multiple bits.
  - Switch to module_initcall
  - Make accesses to the fwspec more consistant
  - Removed dev_info logs
  - Reworked invalidation / flushing
  - Allow for compilation with COMPILE_TEST

Maxime Ripard (4):
  dt-bindings: iommu: Add Allwinner H6 IOMMU bindings
  iommu: Add Allwinner H6 IOMMU driver
  arm64: dts: allwinner: h6: Add IOMMU
  drm/sun4i: mixer: Call of_dma_configure if there's an IOMMU

 Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml |   61 ++++-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                           |   10 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                                    |   13 +-
 drivers/iommu/Kconfig                                                  |    9 +-
 drivers/iommu/Makefile                                                 |    1 +-
 drivers/iommu/sun50i-iommu.c                                           | 1072 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 6 files changed, 1166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
 create mode 100644 drivers/iommu/sun50i-iommu.c

base-commit: bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
-- 
git-series 0.9.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
