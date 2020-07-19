Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B6F2253DC
	for <lists.iommu@lfdr.de>; Sun, 19 Jul 2020 22:00:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 406E0204D9;
	Sun, 19 Jul 2020 20:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NSIlwD70+79; Sun, 19 Jul 2020 20:00:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 63F58204D7;
	Sun, 19 Jul 2020 20:00:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 418D5C08A6;
	Sun, 19 Jul 2020 20:00:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D916BC016F
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jul 2020 20:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C5FBC8798B
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jul 2020 20:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NwN19yRlxmL9 for <iommu@lists.linux-foundation.org>;
 Sun, 19 Jul 2020 20:00:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 521478795A
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jul 2020 20:00:04 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fixes for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595188804;
 bh=sDRG+fVR6j+7eboD4k0GBrVcJ8Hk3QdCEDsLb/zqQEg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=eTaadjjG6soKoa0BnfgfFAm3WFaqBYmWBW9mhU1AIpQr8wWNLsQgxIeZLaQEJidaU
 gptWR1dtJo4JpUlh8qSuDczcKZ7a79Se3ynPaU0L8rP/zndJ6m890lEkccpZ8mtiea
 aEZ8CT5+ZrYcIditl2r/f19XLHA2+lHyT1TWZheQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200719073927.GA114439@infradead.org>
References: <20200719073927.GA114439@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200719073927.GA114439@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.8-6
X-PR-Tracked-Commit-Id: d9765e41d8e9ea2251bf73735a2895c8bad546fc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8c18fc6344568bdc131436be0345d82da512bfef
Message-Id: <159518880407.26827.13297417674901017597.pr-tracker-bot@kernel.org>
Date: Sun, 19 Jul 2020 20:00:04 +0000
To: Christoph Hellwig <hch@infradead.org>
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

The pull request you sent on Sun, 19 Jul 2020 09:39:27 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.8-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8c18fc6344568bdc131436be0345d82da512bfef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
