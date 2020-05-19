Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BFB1DA02A
	for <lists.iommu@lfdr.de>; Tue, 19 May 2020 21:00:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0AAA323340;
	Tue, 19 May 2020 19:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjNEhqq6Fn8K; Tue, 19 May 2020 19:00:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 193EB232A7;
	Tue, 19 May 2020 19:00:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0553EC0176;
	Tue, 19 May 2020 19:00:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BD35C0176
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 19:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6C7EA23335
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 19:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qizlLmsEj37p for <iommu@lists.linux-foundation.org>;
 Tue, 19 May 2020 19:00:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 9B035220FB
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 19:00:05 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.7-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589914805;
 bh=xTku3DLD2Cqyb9orc9z8JFt9Anf0F4+etz1e19Pe1vQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=o+USgD5SorsTOP4ol0Aoqz27Rks/wIt/Q9/I7lVAOnbxV87pfOitLQibhiIpRYlJg
 2f9jtgvAJvjNKN81vYd3JLaY6V7SHxL081e0+hGGy6EFWMDxEtQLsYpXbosGpAVGgF
 kJlTz9ExqDrjBBtn9qiqeFnD+xC9C0yNga7ferDE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200519154039.GA27645@8bytes.org>
References: <20200519154039.GA27645@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200519154039.GA27645@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.7-rc6
X-PR-Tracked-Commit-Id: bd421264ed307dd296eab036851221b225071a32
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c2b00cbda9f92820ddbe2ae8f97628dae84ccc37
Message-Id: <158991480518.4218.9012887006460437027.pr-tracker-bot@kernel.org>
Date: Tue, 19 May 2020 19:00:05 +0000
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

The pull request you sent on Tue, 19 May 2020 17:40:45 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.7-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c2b00cbda9f92820ddbe2ae8f97628dae84ccc37

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
