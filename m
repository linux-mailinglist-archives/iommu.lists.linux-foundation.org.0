Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 475F039F55B
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 13:43:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A42F7402B0;
	Tue,  8 Jun 2021 11:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kXgJ89pLt5F; Tue,  8 Jun 2021 11:42:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FDF8404BE;
	Tue,  8 Jun 2021 11:42:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78BC8C0011;
	Tue,  8 Jun 2021 11:42:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F17C9C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 11:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0B85402A0
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 11:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pYH-2fAwfQXJ for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 11:42:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0161F402C8
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 11:42:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C325A61360;
 Tue,  8 Jun 2021 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623152572;
 bh=fGah1+p/pv2388oRBq6wxQPYcwlfBCFXSQHmKKgtJbk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A2h0RGsquAxhM5p1pqkyitd0GSbNPqdcCFY2sdVRH0rsrJ1U2bzL9bPEwwHXWfKe4
 x6wNauyM8MLjB4+kz9RKO2hZVgDUv5+J3HMuVyOUIZHE/gD7e6pdxZWA+Idm6cnUAk
 Nm+Aui2H3fvK1TK2frluOqPNPXdcAo1PxkTRSrG7eOPV82O2iQXm9vT2T3xBaohqfN
 yiwjlMtlx3a6q7OvjSmbF3oizJb1Urdiwx4bmqu4mR0fqKrW1/OTgrO7wlN/Ed1nld
 F3tYOmZdFFAzHRX1i/b9Wp5KnQw8rK0IDLEu4X9T2MNZ31dRQBRJdREWE8tsXx5+dr
 n7Kmb1hb8U9Ag==
From: Will Deacon <will@kernel.org>
To: Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH V2] iommu: arm-smmu-qcom: Add sm6125 compatible
Date: Tue,  8 Jun 2021 12:42:35 +0100
Message-Id: <162314671954.3707273.3414160134891891543.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210523212535.740979-1-martin.botka@somainline.org>
References: <20210523212535.740979-1-martin.botka@somainline.org>
MIME-Version: 1.0
Cc: Rob Clark <robdclark@chromium.org>, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 konrad.dybcio@somainline.org, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux-foundation.org, John Stultz <john.stultz@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
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

On Sun, 23 May 2021 23:25:33 +0200, Martin Botka wrote:
> Add compatible for SM6125 SoC

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu: arm-smmu-qcom: Add sm6125 compatible
      https://git.kernel.org/will/c/6321484d1c24

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
