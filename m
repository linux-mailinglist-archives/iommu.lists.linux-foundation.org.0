Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 383E52BB3EA
	for <lists.iommu@lfdr.de>; Fri, 20 Nov 2020 19:40:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CDA8F2E127;
	Fri, 20 Nov 2020 18:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0b2m2oRJfDoV; Fri, 20 Nov 2020 18:40:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BB8F02E124;
	Fri, 20 Nov 2020 18:40:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A24DAC0891;
	Fri, 20 Nov 2020 18:40:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 519BBC0891
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 18:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4D3FB86E3B
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 18:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gx8UXfioSD81 for <iommu@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 18:40:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 00FA986F2B
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 18:40:06 +0000 (UTC)
Subject: Re: [GIT PULL] IOMMU fixes for -rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605897606;
 bh=xRx6RqsdmIAKpMlYuagEJPIDByc9uZZlrGJ8/Qp5Ph4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=aLZtlF3H/kTqSRDcGRfrm4KI16QYjBycpMtFNE2fEpmtw9KsRF2KxmER84m+u04JT
 a5tMrV6EXWpBPmC93ZqSdNET6yjrBqtgWQ1HbIUzE6sUS2qn2aKUZ9EgGjks06JVLW
 IyMSaS+NKXUA9xBi4eWwN+uZkI8D+Cj4KD8l8W9s=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201120115034.GA6386@willie-the-truck>
References: <20201120115034.GA6386@willie-the-truck>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20201120115034.GA6386@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 tags/iommu-fixes
X-PR-Tracked-Commit-Id: 91c2c28d8de34815ea9bb4d16e9db7308ad33d3e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc8299f9f3b9f3b0e1c8c9f719b5deb2a74ab314
Message-Id: <160589760669.4306.2459935976027998516.pr-tracker-bot@kernel.org>
Date: Fri, 20 Nov 2020 18:40:06 +0000
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 tglx@linutronix.de, torvalds@linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The pull request you sent on Fri, 20 Nov 2020 11:50:35 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/iommu-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc8299f9f3b9f3b0e1c8c9f719b5deb2a74ab314

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
