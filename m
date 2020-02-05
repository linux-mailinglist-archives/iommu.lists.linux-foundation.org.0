Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A799115376D
	for <lists.iommu@lfdr.de>; Wed,  5 Feb 2020 19:20:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2F4FA21503;
	Wed,  5 Feb 2020 18:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pevmHu02-AZt; Wed,  5 Feb 2020 18:20:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 89B41214E6;
	Wed,  5 Feb 2020 18:20:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72338C0174;
	Wed,  5 Feb 2020 18:20:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 313FCC0174
 for <iommu@lists.linux-foundation.org>; Wed,  5 Feb 2020 18:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2D3FF84E5A
 for <iommu@lists.linux-foundation.org>; Wed,  5 Feb 2020 18:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rtP70-EC4dv for <iommu@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 18:20:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 119628496B
 for <iommu@lists.linux-foundation.org>; Wed,  5 Feb 2020 18:20:15 +0000 (UTC)
Subject: Re: [git pull] IOMMU Updates for Linux v5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580926814;
 bh=5MdfsOEP1cuD67baLfn1RYNv9TYnFHGGZioa9T++I1s=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=VFyJQaimHAuTL40lIjjoWNNwukvIpXw9dAvUWhW5f7ZomT8LpfKFIsSFmJSEkAFxf
 Rr6536VEThFVZrrRVPwbzZFcQRJRUI3vqQZtn8ljLO4p/rAGy0gfYc/j5j64zeNbTN
 2r6TTL85yaYYIcQQq/HDmXAr1nlLy1XvhAfDEifM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200205140344.GA32375@8bytes.org>
References: <20200205140344.GA32375@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200205140344.GA32375@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-updates-v5.6
X-PR-Tracked-Commit-Id: e3b5ee0cfb65646f4a915643fe53e0a51829d891
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4fc2ea6a8608d9a649eff5e3c2ee477eb70f0fb6
Message-Id: <158092681483.14135.11118001152469103340.pr-tracker-bot@kernel.org>
Date: Wed, 05 Feb 2020 18:20:14 +0000
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

The pull request you sent on Wed, 5 Feb 2020 15:03:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-updates-v5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4fc2ea6a8608d9a649eff5e3c2ee477eb70f0fb6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
