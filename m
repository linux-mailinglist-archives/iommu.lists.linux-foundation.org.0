Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0569610F1DB
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 22:05:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1793C85D8D;
	Mon,  2 Dec 2019 21:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obkbynyZgTc5; Mon,  2 Dec 2019 21:05:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 90FE585DC7;
	Mon,  2 Dec 2019 21:05:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 795FDC1797;
	Mon,  2 Dec 2019 21:05:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 494EBC087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 21:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 388F685D61
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 21:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDGQQDTwyKca for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 21:05:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CEF8C85D41
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 21:05:20 +0000 (UTC)
Subject: Re: [git pull] IOMMU Updates for Linux v5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575320720;
 bh=xMwdGCFXqgM6gGkXnnWfZyZRAeOwG5qQZN43h0679/4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=nLPdupFyuB4Ogeh/DKILu3yfl4TwqrwQNDa8oVfBJEHXFufcFHTQobLyuBNHBDMQz
 icqgnmz0YnrvcZzj1lvcnhFftEisvWWpi0DHTb2zkAa128fa3yvBvnQJnK2DwkGv9l
 DELDvSPvknys+r03ACjTOJzyU+qj3AHMBW2OeNQc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191129120247.GA6874@8bytes.org>
References: <20191129120247.GA6874@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191129120247.GA6874@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-updates-v5.5
X-PR-Tracked-Commit-Id: 9b3a713feef8db41d4bcccb3b97e86ee906690c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1daa56bcfd8b329447e0c1b1e91c3925d08489b7
Message-Id: <157532072053.29263.1440104284503498805.pr-tracker-bot@kernel.org>
Date: Mon, 02 Dec 2019 21:05:20 +0000
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

The pull request you sent on Fri, 29 Nov 2019 13:02:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-updates-v5.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1daa56bcfd8b329447e0c1b1e91c3925d08489b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
