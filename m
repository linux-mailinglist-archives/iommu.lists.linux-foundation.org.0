Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DF219E6D8
	for <lists.iommu@lfdr.de>; Sat,  4 Apr 2020 19:50:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7D52B85FA4;
	Sat,  4 Apr 2020 17:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSqFlTd45C4d; Sat,  4 Apr 2020 17:50:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17C9B85F9D;
	Sat,  4 Apr 2020 17:50:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F205BC07FF;
	Sat,  4 Apr 2020 17:50:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA510C07FF
 for <iommu@lists.linux-foundation.org>; Sat,  4 Apr 2020 17:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A6BE785F9D
 for <iommu@lists.linux-foundation.org>; Sat,  4 Apr 2020 17:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3o3rFadBjBaR for <iommu@lists.linux-foundation.org>;
 Sat,  4 Apr 2020 17:50:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4B98985F8F
 for <iommu@lists.linux-foundation.org>; Sat,  4 Apr 2020 17:50:24 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping updates for 5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586022624;
 bh=cKK4vs/ElMxlmbk52kFAcJUDROfeksg+vPch0uqr/Hw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Pt0NybnfUbUjG+K9PWNQgx3n0++R+6EAhGcraUZ46TT5jqQIUzZ6K2vfl+h6WSzQg
 qS9i+ves0qvlDDPFgCwTNVS3Yb12Tjp35v8fXYdWYg2TNuaaCNitE4+9rMLTf3By5k
 TT5eLz1fI9VqCF6c6OL+l0rbzKkF4O3xqb2TjUKQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200404065855.GA656254@infradead.org>
References: <20200404065855.GA656254@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200404065855.GA656254@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.7
X-PR-Tracked-Commit-Id: fd27a526bb381f43dded6db30b3b016468ab0e6c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6f43bae38269a55534e1f86a9917318167de6639
Message-Id: <158602262410.31764.10662666727749617192.pr-tracker-bot@kernel.org>
Date: Sat, 04 Apr 2020 17:50:24 +0000
To: Christoph Hellwig <hch@infradead.org>
Cc: iommu@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Sat, 4 Apr 2020 08:58:55 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6f43bae38269a55534e1f86a9917318167de6639

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
