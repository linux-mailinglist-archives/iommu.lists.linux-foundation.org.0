Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C993CABF3
	for <lists.iommu@lfdr.de>; Thu, 15 Jul 2021 21:28:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE45160BEF;
	Thu, 15 Jul 2021 19:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GrM9zN5dMvUX; Thu, 15 Jul 2021 19:28:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1C41160BCC;
	Thu, 15 Jul 2021 19:28:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE5DEC000E;
	Thu, 15 Jul 2021 19:28:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6460C000E
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 19:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC33E423CD
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 19:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tb2Np6PMtRkm for <iommu@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 19:28:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91E7C423CB
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 19:28:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 19A9F611AE;
 Thu, 15 Jul 2021 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626377296;
 bh=1NSyY1VrYa+ptMyFjLHzUi0wjs3LfZX+gdyrWr/XmOc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=uF+O7WFgcRlPbFnI+GtC3WHGO5yiFbndhQeIA4IHrHBheGVt/jmfKkO8zkRUhSdSX
 AhyvDMOUIuw8oqJBJAKbQzj4Uqh/ebbq8W7uhR6yYGTm1SIymtIbZJmbfoXDKIqqAp
 qmiII2Or0Xa2TGA21hoMh9H2UtJrz8/Ja9A8gUbEwQAnK2GdBZ5cTq/LUarWGkPmYD
 PxYwCopZ9boNikKBGa5tftgnhomEbb8QTFnFteNPyMreh6LVSjnhMOi7Dq2K6eLfeH
 zHMYa9GZ4uSRI+RZKpcfes1jwBPRYfWi09VMNQOqONA1OfyzQFq7+yC2JN9CtDaHMS
 FLL2SBBjXtrOw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 03467609A3;
 Thu, 15 Jul 2021 19:28:15 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YO/tnD+7RA32yO1F@8bytes.org>
References: <YO/tnD+7RA32yO1F@8bytes.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <YO/tnD+7RA32yO1F@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.14-rc1
X-PR-Tracked-Commit-Id: 4a5c155a5ab372516a1a5ddd29473f8f696feb79
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f3523a226dbb0c925def650a658a0755185d60a8
Message-Id: <162637729595.11736.5575499763587728536.pr-tracker-bot@kernel.org>
Date: Thu, 15 Jul 2021 19:28:15 +0000
To: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
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

The pull request you sent on Thu, 15 Jul 2021 10:11:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f3523a226dbb0c925def650a658a0755185d60a8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
