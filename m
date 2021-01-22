Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 46852300485
	for <lists.iommu@lfdr.de>; Fri, 22 Jan 2021 14:49:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ED5AA2E10C;
	Fri, 22 Jan 2021 13:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2lGSgCV2vpEp; Fri, 22 Jan 2021 13:49:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 763B92E10B;
	Fri, 22 Jan 2021 13:49:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61CF9C08A1;
	Fri, 22 Jan 2021 13:49:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09294C013A
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EDD118738F
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pVwm-ZqEc+Xv for <iommu@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 13:49:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 94BB487396
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BB5223A56;
 Fri, 22 Jan 2021 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611323387;
 bh=SunCbNL4thbixbqDicq4yiLamp38pRmNRlL/3HAqsk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lk46HK/GrIT2Tqbb4rsxVgvFAOZ13xkVQe2JlPxXmufo1EC7vCIsS3D4UJahDbvjU
 t53MeaWONPrXofvDYvCD8kWznq1lUhvke7DpKq4jVqRLUoBMZjj6Y/3eOB6v02VSgK
 BrysGMDpezrrSTONUXkkYQ8iDmx5ApijCpSZiiCD0yEOsm8TuPwApntnY8Bdnq0kf7
 CeMnxKOCCzc6TdL9TaRfi0mNX8s332dJgQGjfJwSmoDw8sjsH3D5TQ1iatvz6qcK/q
 dS98DaRBtAmXPwfQ9C2GrK0Se31gAyAAN0qCAvr7udrGTsDNpWFYwSUBSQ+mMTzIN2
 g/eCH2+5EdCnQ==
From: Will Deacon <will@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add sm8350 compatible string
Date: Fri, 22 Jan 2021 13:49:34 +0000
Message-Id: <161132142879.229688.17163617235466107602.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115090322.2287538-1-vkoul@kernel.org>
References: <20210115090322.2287538-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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

On Fri, 15 Jan 2021 14:33:21 +0530, Vinod Koul wrote:
> Add compatible string for sm8350 iommu to documentation.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] dt-bindings: arm-smmu: Add sm8350 compatible string
      https://git.kernel.org/will/c/70b5b6a6daea
[2/2] iommu: arm-smmu-impl: Add SM8350 qcom iommu implementation
      https://git.kernel.org/will/c/d8498b1e4ecc

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
