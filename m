Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC1E2D2EAA
	for <lists.iommu@lfdr.de>; Tue,  8 Dec 2020 16:54:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C834871AF;
	Tue,  8 Dec 2020 15:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75n1fRUQ3Dxf; Tue,  8 Dec 2020 15:54:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 36DF086FE9;
	Tue,  8 Dec 2020 15:54:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 231E1C013B;
	Tue,  8 Dec 2020 15:54:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 624E2C013B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 15:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 519E68749D
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 15:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMCvuKtPMZLT for <iommu@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 15:54:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DF3AE87492
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 15:54:46 +0000 (UTC)
From: Will Deacon <will@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: iommu@lists.linux-foundation.org, Keqian Zhu <zhukeqian1@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu: Defer the early return in arm_(v7s/lpae)_map
Date: Tue,  8 Dec 2020 15:54:32 +0000
Message-Id: <160743579041.2814165.8711661573048681201.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201207115758.9400-1-zhukeqian1@huawei.com>
References: <20201207115758.9400-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 catalin.marinas@arm.com, jiangkunkun@huawei.com,
 Robin Murphy <robin.murphy@arm.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
 wanghaibin.wang@huawei.com, Andrew Morton <akpm@linux-foundation.org>,
 kernel-team@android.com, Thomas Gleixner <tglx@linutronix.de>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
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

On Mon, 7 Dec 2020 19:57:58 +0800, Keqian Zhu wrote:
> Although handling a mapping request with no permissions is a
> trivial no-op, defer the early return until after the size/range
> checks so that we are consistent with other mapping requests.

Applied to arm64 (for-next/iommu/misc), thanks!

[1/1] iommu: Defer the early return in arm_(v7s/lpae)_map
      https://git.kernel.org/arm64/c/f12e0d22903e

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
