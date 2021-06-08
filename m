Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD039FD61
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 19:17:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7A8640476;
	Tue,  8 Jun 2021 17:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9DLy9EQU7Xd; Tue,  8 Jun 2021 17:17:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id B29DD40470;
	Tue,  8 Jun 2021 17:17:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91CECC000F;
	Tue,  8 Jun 2021 17:17:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E176AC0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 17:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCE7440475
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 17:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypY1xcJ095eQ for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 17:16:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD10E40474
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 17:16:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AC2061352;
 Tue,  8 Jun 2021 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623172618;
 bh=yl2qHr4XV3/1fqJTupw4COciZIVz1WyvmJNh/E3HQqw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R/I/mVzq1fstGbnDEXSdA6AWxEKtxqXgdbMT/wIk7YSXVPsghiYPbnSI9yI4ZTvOP
 l4PozDCrHNIqn9stZ2jpEhz6KzeVpjDSQ7IM8tefg3kBSnFlNGQ1V9W/dLhW8kvniM
 jd2RgC55iq0cqvBOPbEvskNAck4hbKl9WncGKJB3zztKUYLv9SUZk6rPLR7ZXWEwF+
 NdpCWyf0yRKiZ+5uOW/q1CU74TOnjRJRWMcWaqkxyHACT/eenYOXtR4ENPpX0hffNn
 P+qXs7cRAKHG2aCAkfRVX8mOunUiRbIOFjCqIzn8iUq/2glJaoNUNyHK0K+BTl+xsU
 SqogcFIkL1JPw==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv4 0/2] iommu/arm-smmu-qcom: Add SC7280 support
Date: Tue,  8 Jun 2021 18:16:48 +0100
Message-Id: <162317109419.2860401.3121131384006826065.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1623155117.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1623155117.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org,
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

On Tue, 8 Jun 2021 18:00:05 +0530, Sai Prakash Ranjan wrote:
> Patch 1 adds the sc7280 smmu compatible.
> Patch 2 moves the adreno smmu check before apss smmu to enable
> adreno smmu specific implementation.
> 
> Note that dt-binding for sc7280 is already merged.
> 
> Changes in v4:
>  * Rebased on top of arm-smmu/updates with acpi changes.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] iommu/arm-smmu-qcom: Add SC7280 SMMU compatible
      https://git.kernel.org/will/c/0b779f562b14
[2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific impl
      https://git.kernel.org/will/c/ab9a77a141cc

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
