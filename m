Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092E420A95
	for <lists.iommu@lfdr.de>; Mon,  4 Oct 2021 14:05:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CEB861B50;
	Mon,  4 Oct 2021 12:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWnBbivaM1n6; Mon,  4 Oct 2021 12:05:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3866B6072F;
	Mon,  4 Oct 2021 12:05:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E553BC000D;
	Mon,  4 Oct 2021 12:05:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E90C3C000D
 for <iommu@lists.linux-foundation.org>; Mon,  4 Oct 2021 12:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE87E4274A
 for <iommu@lists.linux-foundation.org>; Mon,  4 Oct 2021 12:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6T1z1RRzbJ0 for <iommu@lists.linux-foundation.org>;
 Mon,  4 Oct 2021 12:05:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2728242747
 for <iommu@lists.linux-foundation.org>; Mon,  4 Oct 2021 12:05:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25B3F61215;
 Mon,  4 Oct 2021 12:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633349144;
 bh=c6LEDjMveuaB/U/2rmlfIhlH+c99dwL8fKFv9i/sGXs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YJarSqwsXSdTSsyPNMFF+Lkir8x+NXdxnVPOMwMAX7+ZypzSijOh/Z5VA0q+T/z/+
 6ZyjHbIvPVyG+Nx+hsmBcaNG5A7+wCdxvICcS7wsah+PmnCG+t+S5wUPPOJayNDjn+
 9Sd/GYX1v8J8zHqulRJpa5QfR88ewty6iAn/8xkpjDli+x0C85Sy5qYXosHvtkw0X1
 DbDjHpG/FqpgGkVLyE+UEwd8JcJ0UjqEjPST4RrEce2ygGpLaL/7HVU6C0IHCSnSuG
 oARAWdNXqHIoSH/bVoWc1PAn7XioaXxE7zs2L9j73PIBr6oSvKMEPMYYpBkSVr5q7D
 FfkHjpB59e3QA==
From: Will Deacon <will@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add compatible for SM6350 SoC
Date: Mon,  4 Oct 2021 13:05:33 +0100
Message-Id: <163334664315.1581907.12696776880512874722.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210820202906.229292-1-konrad.dybcio@somainline.org>
References: <20210820202906.229292-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
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

On Fri, 20 Aug 2021 22:29:04 +0200, Konrad Dybcio wrote:
> Add the SoC specific compatible for SM6350 implementing
> arm,mmu-500.
> 
> 

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] dt-bindings: arm-smmu: Add compatible for SM6350 SoC
      https://git.kernel.org/will/c/e4a40f15b031
[2/2] iommu/arm-smmu-qcom: Add SM6350 SMMU compatible
      https://git.kernel.org/will/c/bc53c8b8b087

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
