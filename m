Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 109251F083F
	for <lists.iommu@lfdr.de>; Sat,  6 Jun 2020 21:15:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E6EE184417;
	Sat,  6 Jun 2020 19:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5q0XyE4cnfee; Sat,  6 Jun 2020 19:15:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F6B7843F5;
	Sat,  6 Jun 2020 19:15:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A9CFC016E;
	Sat,  6 Jun 2020 19:15:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2681C016E
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 19:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E1C2A88457
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 19:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJMI4HTAJztc for <iommu@lists.linux-foundation.org>;
 Sat,  6 Jun 2020 19:15:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8A3CC88455
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 19:15:19 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping updates for 5.8, part 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591470919;
 bh=cxND22Ha225UmQPRUJGsqR+a5+bQ/+hNOBaOgUBq/5M=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=XpXyHUuc3ybHIiBvz4LadHvOaXLAwzXG+A48sObXyfUdfq0vJMq4E/a9roD4OxE9j
 5WhFtpnjIK6SBHO+z1PMzN1vhNMmmsD26X971+QVVvOiihkmvYFYEfpB3ollwO97Ru
 ioUG7LLNz1MM7rDk2CYwGk4mzkoBDMII/a/ZLKx4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200606160932.GB3482728@infradead.org>
References: <20200606160932.GB3482728@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200606160932.GB3482728@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.8-2
X-PR-Tracked-Commit-Id: 48530d9fab0d3bf08827f9167be54acf66d4d457
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6f2dc3d335457d9c815be9f4fd3dc8eff92fcef7
Message-Id: <159147091934.3313.12740023106632055664.pr-tracker-bot@kernel.org>
Date: Sat, 06 Jun 2020 19:15:19 +0000
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

The pull request you sent on Sat, 6 Jun 2020 18:09:32 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.8-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6f2dc3d335457d9c815be9f4fd3dc8eff92fcef7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
