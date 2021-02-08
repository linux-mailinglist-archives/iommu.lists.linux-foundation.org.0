Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 652903139B0
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 17:41:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 198348708E;
	Mon,  8 Feb 2021 16:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0toz+naNn1x5; Mon,  8 Feb 2021 16:41:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B2E588708F;
	Mon,  8 Feb 2021 16:41:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B805C013A;
	Mon,  8 Feb 2021 16:41:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 103C6C013A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 16:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F3ECF86D63
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 16:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YppzmYHl4Has for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 16:41:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CEC2486A6F
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 16:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aorvd7/8Q0iagez40K36p+HgsrbrS8WV5PQF4a7s2FM=; b=ySwDzcwlbm4PDJsfWZJRJYlsEh
 1gQ/3jlSsnD9yMsUDmfEuW5mpJHoJ+PYH1FfHQt8axPr3HRWYG9diWakeC6Lbs+GHjLVm6atP7Dva
 YY/gYggyUlZOqYLUwbpy2KFfaT324NgYjyBbzmLENXNx5QzUsieszbNFbHEctR3I/6heHoR8VFqks
 P+V/sFpl6e6P/kiECFRLELyWB53nljM2ixs5tpfb+zx3QRLQijQicqP7YrYIPYXrt7vliGfvgfwLm
 qUZYvOUAX58EkV+1WYOi+w1E8q6MHpDEt1uKvJ2JGP/Qu9HufT89UO+Ani8m6DFDBaaU/qJrbpKTK
 JifS9MIw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1l99at-0000Cr-2v; Mon, 08 Feb 2021 18:40:59 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, frowand.list@gmail.com,
 robin.murphy@arm.com
Subject: [RFC PATCH 6/8] arm64: tegra: Add Host1x context stream IDs on
 Tegra186+
Date: Mon,  8 Feb 2021 18:38:46 +0200
Message-Id: <20210208163848.2504291-7-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208163848.2504291-1-mperttunen@nvidia.com>
References: <20210208163848.2504291-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Add Host1x context stream IDs on systems that support Host1x context
isolation. Host1x and attached engines can use these stream IDs to
allow isolation between memory used by different processes.

The specified stream IDs must match those configured by the hypervisor,
if one is present.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index c567aa65418b..25a8cb1a97a6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1176,6 +1176,15 @@ host1x@13e00000 {
 		interconnect-names = "dma-mem";
 
 		iommus = <&smmu TEGRA186_SID_HOST1X>;
+		nvidia,context-iommus = <
+			&smmu TEGRA186_SID_HOST1X_CTX0
+			&smmu TEGRA186_SID_HOST1X_CTX1
+			&smmu TEGRA186_SID_HOST1X_CTX2
+			&smmu TEGRA186_SID_HOST1X_CTX3
+			&smmu TEGRA186_SID_HOST1X_CTX4
+			&smmu TEGRA186_SID_HOST1X_CTX5
+			&smmu TEGRA186_SID_HOST1X_CTX6
+			&smmu TEGRA186_SID_HOST1X_CTX7>;
 
 		dpaux1: dpaux@15040000 {
 			compatible = "nvidia,tegra186-dpaux";
-- 
2.30.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
