Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 619583FF26F
	for <lists.iommu@lfdr.de>; Thu,  2 Sep 2021 19:37:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CEE342562;
	Thu,  2 Sep 2021 17:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0csV2TsBzQFG; Thu,  2 Sep 2021 17:37:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D036E407CE;
	Thu,  2 Sep 2021 17:37:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2120C000E;
	Thu,  2 Sep 2021 17:37:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE9D2C000E
 for <iommu@lists.linux-foundation.org>; Thu,  2 Sep 2021 17:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6DD040155
 for <iommu@lists.linux-foundation.org>; Thu,  2 Sep 2021 17:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvYxAHtPoCRa for <iommu@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 17:37:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65A5D40019
 for <iommu@lists.linux-foundation.org>; Thu,  2 Sep 2021 17:37:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F3189610FF;
 Thu,  2 Sep 2021 17:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630604240;
 bh=d5f2d51tKM2k6GfytW5hu9z0ZTLWTCHVzTv3dXBEACw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Ujs/U7tx0EZjrH4F4+Scj0F8/bjTqkyEoqmx5tjFqWVchvKGiKcpkewh4gk0BQcKf
 3EOKfey+nqIrgF2p+YT5wo7OdenarA3zOfEsU3bzz2QitTaKKORcaDzlsuKUikqBmJ
 /wmU553+KzxWpIIjB0FKDee5zwx/jxDWdjax89B9WOzedtEpKOxgtFqgJWIDLfJsht
 JokiC8TECYD1GkOQqARwD81SyDM2ziF9vB1Ftm8rMA/UvrFGwe9qM2EOGqCken9ANX
 tUTwvkJMJk98hCc+kq1KMnnX9yBpa6UU6NUV0rx4U/ipMidOw/HppvQahOlL1zgJqc
 pEQFwuX9B8bqA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id ED99F60A0C;
 Thu,  2 Sep 2021 17:37:19 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping updates for Linux 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <YS9kkqNhU0TPA9Fr@infradead.org>
References: <YS9kkqNhU0TPA9Fr@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YS9kkqNhU0TPA9Fr@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.15
X-PR-Tracked-Commit-Id: c1dec343d7abdf8e71aab2a289ab45ce8b1afb7e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a3bb4200a5958d76cc26ebe4db4257efa56812b
Message-Id: <163060423996.29568.10200852879962767088.pr-tracker-bot@kernel.org>
Date: Thu, 02 Sep 2021 17:37:19 +0000
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

The pull request you sent on Wed, 1 Sep 2021 13:31:30 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a3bb4200a5958d76cc26ebe4db4257efa56812b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
