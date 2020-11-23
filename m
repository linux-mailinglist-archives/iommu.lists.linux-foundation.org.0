Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EE2C0F27
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 16:47:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0012E86730;
	Mon, 23 Nov 2020 15:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Yuc+6E6snjx; Mon, 23 Nov 2020 15:47:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A5DFC8672C;
	Mon, 23 Nov 2020 15:47:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CB47C0052;
	Mon, 23 Nov 2020 15:47:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06895C0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E95BE870EE
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48NwXYmiXEZh for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 15:47:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8259B870FC
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:47:13 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98F582100A;
 Mon, 23 Nov 2020 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606146433;
 bh=N9PPBZShoo+kzWjvDYDSDkWU/7lToiEmOhGmMUrdK1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oHrP0/XxSj/xsc/il/Qhq8h3bIwKPB90YMoThRMBen848mx/fKkSGWvM+Njuva3fi
 Hi7PCIgrCzkOaIK3dUXY1OlhmRTDtQ3G3++Yu/zybAZG5ghvcAm4oU487ba6QCpOJ2
 QW+3rzMNpYFkr3A37X9aTDzfSul5gQrk3RxfWAGI=
From: Will Deacon <will@kernel.org>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] iommu: Check return of __iommu_attach_device()
Date: Mon, 23 Nov 2020 15:47:00 +0000
Message-Id: <160614346318.875972.5810044376174592959.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119165846.34180-1-shameerali.kolothum.thodi@huawei.com>
References: <20201119165846.34180-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 robin.murphy@arm.com, linuxarm@huawei.com, kernel-team@android.com
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

On Thu, 19 Nov 2020 16:58:46 +0000, Shameer Kolothum wrote:
> Currently iommu_create_device_direct_mappings() is called
> without checking the return of __iommu_attach_device(). This
> may result in failures in iommu driver if dev attach returns
> error.

Applied to arm64 (for-next/iommu/fixes), thanks!

[1/1] iommu: Check return of __iommu_attach_device()
      https://git.kernel.org/arm64/c/77c38c8cf52e

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
