Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF0C22D13B
	for <lists.iommu@lfdr.de>; Fri, 24 Jul 2020 23:40:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 12A7024F13;
	Fri, 24 Jul 2020 21:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHnSqBguCj2g; Fri, 24 Jul 2020 21:40:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 566D6228A7;
	Fri, 24 Jul 2020 21:40:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39A3AC004C;
	Fri, 24 Jul 2020 21:40:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FC35C004C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 21:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A46BD88E9B
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 21:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zT86o3Se-G-y for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 21:40:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 730B088E33
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 21:40:07 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fix for Linux v5.8-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595626807;
 bh=aFh2n2ICLXzFVuSifsT3e6mvgGttbNwwFi/Gf32ItDM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=EmyyZDKxGFwlmHArY3Fd5y3NHOkssxzevcWWEunVLFWh3PxGE6wshqzFKOlpXU2UE
 nFnKpnK7mnwZJIQMfYI1HKPGSdCdxbrO8gYZthFbSf3UAfjCytxgV+AZ03/Qsw5GJ6
 tvBPMOZZ/YlfBTdHtj+FzHccxmA6al15aBSB5M50=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200724182640.GA12653@8bytes.org>
References: <20200724182640.GA12653@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200724182640.GA12653@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fix-v5.8-rc6
X-PR-Tracked-Commit-Id: 1014a2f8d76b05e0f228dd097ac1a249c5934232
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5a0b8af0719fd0710d9d1a9ad83b7fbdf4bfca66
Message-Id: <159562680727.3064.12015498537830730074.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jul 2020 21:40:07 +0000
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

The pull request you sent on Fri, 24 Jul 2020 20:26:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fix-v5.8-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5a0b8af0719fd0710d9d1a9ad83b7fbdf4bfca66

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
