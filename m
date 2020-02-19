Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B4236164C3B
	for <lists.iommu@lfdr.de>; Wed, 19 Feb 2020 18:40:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1D4992052F;
	Wed, 19 Feb 2020 17:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9jFBXJxi1mE; Wed, 19 Feb 2020 17:40:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 50C5E20526;
	Wed, 19 Feb 2020 17:40:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4353CC013E;
	Wed, 19 Feb 2020 17:40:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E5B3C013E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 17:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2D18D877FF
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 17:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmLr-tqgSkHC for <iommu@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 17:40:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C40ED877DB
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 17:40:19 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582134019;
 bh=3dAa4+ULDiNGO2E276gfipBte3n/58rOaOOAZsySmxU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=X2hfFfnLgBjWdxpnGkg4hpD7TKL2AYTLcVvx2r8orJBSBXtuwdaYfgOxDCrhzenAC
 XEQf1LsrKDG8bI4XGxqEx67pUVJr3N2ksST/9+3zbuQ4Ri+z0adnJ/+pRHuM4Jda+Q
 X6gzdwjad/fQptBTIg/lIIjBJjSFFkMGZIpaKra4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200219165116.GA7503@8bytes.org>
References: <20200219165116.GA7503@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200219165116.GA7503@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.6-rc2
X-PR-Tracked-Commit-Id: ab362fffa0feb0da23191111e60b641d39130053
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b205766d8fcb1627429ff31a4b36248b71a0df1
Message-Id: <158213401949.16030.13039594423525523270.pr-tracker-bot@kernel.org>
Date: Wed, 19 Feb 2020 17:40:19 +0000
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

The pull request you sent on Wed, 19 Feb 2020 17:51:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.6-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b205766d8fcb1627429ff31a4b36248b71a0df1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
