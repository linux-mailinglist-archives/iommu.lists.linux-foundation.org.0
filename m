Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01521930D
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 00:03:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 70C6F22846;
	Wed,  8 Jul 2020 22:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czj+VAx+Gl6u; Wed,  8 Jul 2020 22:03:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 55D432046C;
	Wed,  8 Jul 2020 22:03:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0303FC08A9;
	Wed,  8 Jul 2020 22:03:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3B07C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 22:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A8A2A87233
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 22:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQVMyivjq1IH for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 22:03:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 53F498722F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 22:03:01 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2F822078C;
 Wed,  8 Jul 2020 22:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594245781;
 bh=E/vudvWWgrOMP+Ul19LafZmg3S5ficayHxrL/U28ueQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Eav8Bw+2NB+pEAgOzJ6gS1k6aJvJpT2OBddRrE2TKnIoEDQwDv+XTTm4XUOk+P4Hp
 04tsXVDOKjvf0U3RKZjc3+DfCqh5/JP7jIEVnvlr3soLIkrvGynk1V6zvbZPzCSS6V
 5zB1kMhatUdtqlybvePyeLrVytkB+f38UHxDztEY=
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	joro@8bytes.org
Subject: Re: [PATCH] iommu/arm-smmu: Update impl quirks comment
Date: Wed,  8 Jul 2020 23:02:37 +0100
Message-Id: <159424067112.2034751.1237477027712722505.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1e742177e084621f3454fbaf768325a6c215656a.1592994291.git.robin.murphy@arm.com>
References: <1e742177e084621f3454fbaf768325a6c215656a.1592994291.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
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

On Wed, 24 Jun 2020 11:24:51 +0100, Robin Murphy wrote:
> The comment about implementation and integration quirks being
> mutually-exclusive is out of date, and in fact the code is already
> structured for the case it anticipates, so document that properly.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu: Update impl quirks comment
      https://git.kernel.org/will/c/976492922a6a

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
