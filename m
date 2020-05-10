Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BDE1CCD5E
	for <lists.iommu@lfdr.de>; Sun, 10 May 2020 21:56:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6026B883E2;
	Sun, 10 May 2020 19:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UWWl5JM0Zdu; Sun, 10 May 2020 19:45:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 113B4883DC;
	Sun, 10 May 2020 19:45:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E44ADC016F;
	Sun, 10 May 2020 19:45:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8391FC016F
 for <iommu@lists.linux-foundation.org>; Sun, 10 May 2020 19:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6B4758648C
 for <iommu@lists.linux-foundation.org>; Sun, 10 May 2020 19:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tu1QX4KjO6km for <iommu@lists.linux-foundation.org>;
 Sun, 10 May 2020 19:45:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1894B86463
 for <iommu@lists.linux-foundation.org>; Sun, 10 May 2020 19:45:04 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.7-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589139903;
 bh=bYqSfo4lMXohnc3IhL03zeCrUobYVL6txTc5psvv8o0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=jwnIJFHFdDGmhDt7scI/4fbSvFmpLBfXZnpLPHgrC7Fxc4TMZw6kAza245HSyQQQg
 6ADSMmgulm5rncegW6MPFo5zKGQ1hm7QL1QQVLckUdrlv3Ux6MbmrASkuOIx+rjsc5
 T+iPQidDmU4VKNP9r1kFfQ7e6113iJmDwntdqkGI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200510122634.GA32616@8bytes.org>
References: <20200510122634.GA32616@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200510122634.GA32616@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.7-rc4
X-PR-Tracked-Commit-Id: fb3637a113349f53830f7d6ca45891b7192cd28f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 27d2dcb1b95c8c39da417839c11eda2e665cd389
Message-Id: <158913990386.3456.15345880973524741179.pr-tracker-bot@kernel.org>
Date: Sun, 10 May 2020 19:45:03 +0000
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

The pull request you sent on Sun, 10 May 2020 14:26:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.7-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/27d2dcb1b95c8c39da417839c11eda2e665cd389

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
