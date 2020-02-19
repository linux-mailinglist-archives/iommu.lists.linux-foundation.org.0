Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 722C4163954
	for <lists.iommu@lfdr.de>; Wed, 19 Feb 2020 02:30:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 128EF20435;
	Wed, 19 Feb 2020 01:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VA+5700jYONd; Wed, 19 Feb 2020 01:30:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 545E4203CE;
	Wed, 19 Feb 2020 01:30:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47176C013E;
	Wed, 19 Feb 2020 01:30:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7B10C013E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 01:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D4BC2203F0
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 01:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEq1KhtS6Vhp for <iommu@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 01:30:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 50F6C203CE
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 01:30:18 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping updates for 5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582075818;
 bh=Ww/x3HNh3xF31l8ohB71CpLYcQFAw2fGO4Xmh4/DCB0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=OCTtoVwEoaAC9BNIsy9rSz2EGSX9x+IZVogdNW7tFUG5UYqEXXBxfsgvG20RrWjxN
 YNuCO12hlGvrKf9j79LqADK/sW0mavHOkGt85KT8KxtDzh2INTWj0+joD5RA77bPew
 3qNtPTR8O6lNX1mDn9YFKP4AmcyCP+7D8FCQVaBE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200218211500.GA41556@infradead.org>
References: <20200218211500.GA41556@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200218211500.GA41556@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.6
X-PR-Tracked-Commit-Id: 75467ee48a5e04cf3ae3cb39aea6adee73aeff91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0a44cac8105059eb756ed4276e932e54e1ba004d
Message-Id: <158207581803.3201.1858144410203694454.pr-tracker-bot@kernel.org>
Date: Wed, 19 Feb 2020 01:30:18 +0000
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

The pull request you sent on Tue, 18 Feb 2020 13:15:00 -0800:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0a44cac8105059eb756ed4276e932e54e1ba004d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
