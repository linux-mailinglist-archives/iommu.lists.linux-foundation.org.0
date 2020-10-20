Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A42940C2
	for <lists.iommu@lfdr.de>; Tue, 20 Oct 2020 18:46:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D576387362;
	Tue, 20 Oct 2020 16:46:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6xjJU1Y8K5Lc; Tue, 20 Oct 2020 16:46:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7BBEB8735E;
	Tue, 20 Oct 2020 16:46:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F073C1AD4;
	Tue, 20 Oct 2020 16:46:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 656A3C0052
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 16:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4593E2049C
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 16:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2+iuxgpmOK9t for <iommu@lists.linux-foundation.org>;
 Tue, 20 Oct 2020 16:46:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id D135720445
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 16:46:04 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux since iommu-updates-v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603212364;
 bh=xg+oRsnPfUU6aXZECsaUkYM5mm8ivkatSd5ywRmNj1o=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=LcFX2hl9XzLfQqG3iOLFmNW96G4uOwD3iyHJ3CD9LY1msNb9aY707J3q6vBuVHJgm
 BcIuqiunxVXN2j1OjbWW7u4+8ilGStGUDobGRjun0FDOFVhXGN+sE6AU+pS2o5ueXB
 prs7pf/TFsr0vWdBWcfFIvDwKbAtlGWvfqdQPCRs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201019154418.GA25261@8bytes.org>
References: <20201019154418.GA25261@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201019154418.GA25261@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fix-v5.10
X-PR-Tracked-Commit-Id: 9def3b1a07c41e21c68a0eb353e3e569fdd1d2b1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5c7e3f3f5cbc31118914ceee969154582ad3aa6b
Message-Id: <160321236432.11581.15305611521366285712.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2020 16:46:04 +0000
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

The pull request you sent on Mon, 19 Oct 2020 17:44:23 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fix-v5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5c7e3f3f5cbc31118914ceee969154582ad3aa6b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
