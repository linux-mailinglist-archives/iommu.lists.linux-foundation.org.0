Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEBA3A896C
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 21:18:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7BAC40398;
	Tue, 15 Jun 2021 19:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3Yifp83IW4s; Tue, 15 Jun 2021 19:18:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 079DD40225;
	Tue, 15 Jun 2021 19:18:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8F12C0022;
	Tue, 15 Jun 2021 19:18:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2873EC000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 19:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E3C540186
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 19:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqNVvr-cazXy for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 19:18:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3D29400F3
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 19:18:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD89B6137D;
 Tue, 15 Jun 2021 19:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623784710;
 bh=ovQFwpWzbCHOgR41ALWZsn3umYECbryCKBHoyR0xMz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JSn1leY2CFhRxoQwuJdLHj7Q2qgdvgSdkoA/lAtCaZysRGmlxIfywS8+7Yagnp3Xj
 rHZgOb20APBUhTdO41nXkcBObX7mMyP9kcorVagcxOkz04cm7C8kwLJX+EYyvyeINC
 +dWU23tHfCPMR4W1xARcx0f/AHNjG/GuddyNf33+xiA9zaPXfuDY7UXJUEUH7a3Myr
 fGhfXrPJ4Eyn6dtyTBzWnWci0pG7V/enZaJlaXCYc8bJb2YlSLRAXAgaQS/Iv0fM6f
 paaiEiGFX3Icl7CI3p7YI+LqpohIB9mJLOdAQfQPf1ZyqlaeDnBTss6At/b+galXYY
 x+tgD/U17aqag==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 iommu <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: remove unnecessary oom message
Date: Tue, 15 Jun 2021 20:18:22 +0100
Message-Id: <162378187681.1545997.12746998535858366544.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210609125438.14369-1-thunder.leizhen@huawei.com>
References: <20210609125438.14369-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>
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

On Wed, 9 Jun 2021 20:54:38 +0800, Zhen Lei wrote:
> Fixes scripts/checkpatch.pl warning:
> WARNING: Possible unnecessary 'out of memory' message
> 
> Remove it can help us save a bit of memory.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Remove unnecessary oom message
      https://git.kernel.org/will/c/affa909571b0

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
