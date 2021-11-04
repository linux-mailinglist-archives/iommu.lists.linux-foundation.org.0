Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C63BE445A06
	for <lists.iommu@lfdr.de>; Thu,  4 Nov 2021 19:51:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62349400B9;
	Thu,  4 Nov 2021 18:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKvnARcome51; Thu,  4 Nov 2021 18:51:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5B79140114;
	Thu,  4 Nov 2021 18:51:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AA92C000E;
	Thu,  4 Nov 2021 18:51:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 468D1C000E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 18:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DF2140576
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 18:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CiR2MUAcbxRU for <iommu@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 18:51:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92D1A40567
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 18:51:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2D8E96112E;
 Thu,  4 Nov 2021 18:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636051866;
 bh=UOTPM5ZhqYL/3nS8xkv7cPrWsnm9PV2Tis/a3NE/+K8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=QbD9O4aqfQLkIi3jB1EpJAdPZmUDO3iVafoWPdxSNmLDW5yWYmFLt/3LzEaCr9jeS
 HmHmwAQOZuQTT4u91/8aY4b1FR0O2cgLCnmcfg0NMzr1JPUpyBtBBB7ixBkEvhSK+t
 SBV57iUiG6CACoVy6qdJ2kQOcMVgBadp2g4GVrpSWhsozziWRilk9AgFCJrrAXDlTP
 iNC8BPQduvkQgvwA/QxYIOmS/XfXWf3klEZ4eewHno0QoJWOHy0kjgB/tzpAGljszu
 valXPHjnbFA5c9MV9yk4EK5rYBI0FOw9/Zmn6EUY2dj7X7T4TNzinTA/Q0npiDdwJi
 GugGc1aJUGzYg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 27550609B8;
 Thu,  4 Nov 2021 18:51:06 +0000 (UTC)
Subject: Re: [git pull] IOMMU Updates for Linux v5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <YYPrNkweZahTdAbA@8bytes.org>
References: <YYPrNkweZahTdAbA@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YYPrNkweZahTdAbA@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-updates-v5.16
X-PR-Tracked-Commit-Id: 52d96919d6a846aace5841cd23055927c6e6ec2c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7e113d01f5f9fe6ad018d8289239d0bbb41311d7
Message-Id: <163605186615.14812.4274088227615366020.pr-tracker-bot@kernel.org>
Date: Thu, 04 Nov 2021 18:51:06 +0000
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

The pull request you sent on Thu, 4 Nov 2021 15:16:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-updates-v5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7e113d01f5f9fe6ad018d8289239d0bbb41311d7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
