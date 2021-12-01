Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CB14648FE
	for <lists.iommu@lfdr.de>; Wed,  1 Dec 2021 08:40:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ECE2405D2;
	Wed,  1 Dec 2021 07:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1stVTQV-uxvG; Wed,  1 Dec 2021 07:40:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 54ED2405CB;
	Wed,  1 Dec 2021 07:40:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08554C000A;
	Wed,  1 Dec 2021 07:40:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68997C000A
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 07:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 491B2400BA
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 07:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gy8ecUF3fhoa for <iommu@lists.linux-foundation.org>;
 Wed,  1 Dec 2021 07:40:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 605CA400A4
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 07:40:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3C9EACE1D49;
 Wed,  1 Dec 2021 07:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8CFC53FAD;
 Wed,  1 Dec 2021 07:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638344394;
 bh=IH+CH+NEHGEnnHXFwnSvSAiPgO8efzQGfFtZpwJ6dD8=;
 h=From:To:Cc:Subject:Date:From;
 b=BLiR765i6O8Tk9bXLvJsNm0TjKZ1oknLs2VHJUwsTU3Wmt6xgCk+r3NfHGwirVglP
 K3KkUk2j3KweGSylloBBAty+pQokM3EhckwaRRoazRhRWnivngUOZdTJwasadUq31N
 D+PrCWMs8kpufcmJ35pIUDSmHiTkV3wp1pvuo4be67b7o/cpAUF4ddpcfCygNGiBPa
 eFHsJx/itVkM3b8WUG2TBg4FwAGYVEkfU5Z1Rbm4bW8zaOwb34NlgomCmm/pxe0rNq
 QxXkZ//R+WI5XRRGFwPUNFQxpRSddS9d0r5Kok1EVu7PM7Hay1cU4nhO2wrkgQBOkX
 AGpB+SZQzc4NQ==
From: Vinod Koul <vkoul@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 0/2] Add support from SM8450 IOMMU
Date: Wed,  1 Dec 2021 13:09:41 +0530
Message-Id: <20211201073943.3969549-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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

This adds the binding and support for IOMMU found in SM8450 SoC

Vinod Koul (2):
  dt-bindings: arm-smmu: Add compatible for SM8450 SoC
  iommu: arm-smmu-impl: Add SM8450 qcom iommu implementation

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
 2 files changed, 2 insertions(+)

-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
