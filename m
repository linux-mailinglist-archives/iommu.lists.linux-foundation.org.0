Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1AD2D2EA6
	for <lists.iommu@lfdr.de>; Tue,  8 Dec 2020 16:54:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B986D87147;
	Tue,  8 Dec 2020 15:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLp-zfAQzqIr; Tue,  8 Dec 2020 15:54:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3D38871E2;
	Tue,  8 Dec 2020 15:54:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97BAAC013B;
	Tue,  8 Dec 2020 15:54:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40C09C013B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 15:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 279A987492
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 15:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wh3hON7N1PXj for <iommu@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 15:54:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9737B8748F
 for <iommu@lists.linux-foundation.org>; Tue,  8 Dec 2020 15:54:38 +0000 (UTC)
From: Will Deacon <will@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Joerg Roedel <joro@8bytes.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Kunkun Jiang <jiangkunkun@huawei.com>, Robin Murphy <robin.murphy@arm.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] iommu/io-pgtalbe-arm: Remove "iopte_type(pte,
 l)" extra parameter "l"
Date: Tue,  8 Dec 2020 15:54:29 +0000
Message-Id: <160743594324.2814527.17080141528844810125.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201207120150.1891-1-jiangkunkun@huawei.com>
References: <20201207120150.1891-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Cc: kernel-team@android.com, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
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

On Mon, 7 Dec 2020 20:01:50 +0800, Kunkun Jiang wrote:
> Knowing from the code, the macro "iopte_type(pte, l)" doesn't use the
> parameter "l" (level). So we'd better to remove it.

Applied to arm64 (for-next/iommu/misc), thanks!

[1/1] iommu/io-pgtalbe-arm: Remove "iopte_type(pte, l)" extra parameter "l"
      https://git.kernel.org/arm64/c/f37eb48466d2

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
