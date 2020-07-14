Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BA70121E531
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 03:35:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E2E0C88D4F;
	Tue, 14 Jul 2020 01:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prceMAoLx6_t; Tue, 14 Jul 2020 01:35:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 880D7889BE;
	Tue, 14 Jul 2020 01:35:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59684C0733;
	Tue, 14 Jul 2020 01:35:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16F2CC0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 01:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F363F88D4B
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 01:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glbhnXkduWRl for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 01:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DDF76889BE
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 01:35:03 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.8-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594690503;
 bh=D/Bl2d/W9e6p4DWfLpdQLJsdo0VCU8TQe8i6i7tmhv8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=lumb+JbSYY9uiio0MEji0Gw7NEPFMKmWzdsiMO62/MyFqadPpzANgXspuIvYTu5fz
 HZa+29m8BAWHEiu8q1P8KjJ+eYnNFdBNDiALTnWiQ2dm8i9VkewjyDbRKswgzhrghJ
 KW4SA8PYKDbS+JTv151+ZKQEI+pVhJctqv35Rpio=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200713153649.GA2615@8bytes.org>
References: <20200713153649.GA2615@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200713153649.GA2615@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.8-rc5
X-PR-Tracked-Commit-Id: a082121b55bac125f7d09d78de00607ea75a6903
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0dc589da873b58b70f4caf4b070fb0cf70fdd1dc
Message-Id: <159469050366.22447.6799245194138996381.pr-tracker-bot@kernel.org>
Date: Tue, 14 Jul 2020 01:35:03 +0000
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org,
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

The pull request you sent on Mon, 13 Jul 2020 17:36:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.8-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0dc589da873b58b70f4caf4b070fb0cf70fdd1dc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
