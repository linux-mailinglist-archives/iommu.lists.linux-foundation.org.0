Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F751DCFA
	for <lists.iommu@lfdr.de>; Fri,  6 May 2022 18:07:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3289404FF;
	Fri,  6 May 2022 16:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bn_LWZZlg4Bz; Fri,  6 May 2022 16:07:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E5045404FD;
	Fri,  6 May 2022 16:07:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE0C4C002D;
	Fri,  6 May 2022 16:07:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACBD0C002D
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 16:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C68441988
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 16:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTiGmb4GoX5D for <iommu@lists.linux-foundation.org>;
 Fri,  6 May 2022 16:07:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91E714109F
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 16:07:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E102DB836B1;
 Fri,  6 May 2022 16:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68152C385A8;
 Fri,  6 May 2022 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651853238;
 bh=hlecmGmXMdLPY0SRK5EkvKlwwip1h2w5sOHri907iUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uhFiHHHND8MOJ19d6UW4iRbnGzrkDvFC2fq54yEYFWJXiOnFi4FoJIewObEJ6Nb+k
 EsWvbsctIbTeLMStgoPFGfDMHxEE07wR8BVYakDYb0uCPIGyfRpYYMhm0CFbJ0R3x7
 TT7MR+hAhChPi9MZOfVpRpae98ETxmO1wNty9BP/I2yMcUokPs2yJVGaVtDpu8pqHy
 Ro0zYW5QlFq6Q8yE97Of6cYJyIkxEdAOqtxacw9CYx3mXOW1yA8xcf4wpj48DRuKHj
 +96B4bM+L5L8s8iIx91QCC0xE2nnbcs/5ow6HUEN5UlVZ411kE7xKUS0YOsuZrIvxB
 d4nc0r9N1Kwag==
From: Will Deacon <will@kernel.org>
To: krzk+dt@kernel.org, robin.murphy@arm.com, agross@kernel.org,
 bjorn.andersson@linaro.org, ulf.hansson@linaro.org, joro@8bytes.org,
 Rohit Agarwal <quic_rohiagar@quicinc.com>, robh+dt@kernel.org
Subject: Re: [PATCH v2 0/7] SDX65 devicetree updates
Date: Fri,  6 May 2022 17:07:03 +0100
Message-Id: <165185052553.2780438.7989324600616529868.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1649670615-21268-1-git-send-email-quic_rohiagar@quicinc.com>
References: <1649670615-21268-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, manivannan.sadhasivam@linaro.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
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

On Mon, 11 Apr 2022 15:20:08 +0530, Rohit Agarwal wrote:
> This series adds devicetree nodes for SDX65. It adds reserved memory
> nodes, SDHCI, smmu and tcsr mutex support.
> 
> Changes from v1:
>  - Addressed Mani's Comments and made necessary.
>  - Rebased on top of v5.18-rc2.
> 
> [...]

Applied SMMU binding patch to will (for-joerg/arm-smmu/updates), thanks!

[4/7] dt-bindings: arm-smmu: Add binding for SDX65 SMMU
      https://git.kernel.org/will/c/5a4eb9163471

However, I must confess that I don't understand the point in updating
the binding documentation but not the driver. Should we be matching on
the new compatible string somewhere?

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
