Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D05297E37
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 21:37:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A384886957;
	Sat, 24 Oct 2020 19:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Wp-M2owFNsb; Sat, 24 Oct 2020 19:37:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18A1A86910;
	Sat, 24 Oct 2020 19:37:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC1DEC0051;
	Sat, 24 Oct 2020 19:37:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5D42C0051
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 19:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9BF5722DDB
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 19:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54l6i05-YrSe for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 19:37:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 6DA5822E8C
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 19:37:21 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fixes for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603568241;
 bh=nNMvH4+UmBjeC/7DRNagbhqqIqRv/Uo4MYVju0/JHfQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Ewdkq1HH2dTj8++IfW5Ofp6sezrJrlQL5wPtQjY3o1ctljjFIj9M9dq29FHi9USm9
 Tq81aXMzbvdwe7fnr+cbPNeY5Efo/XcR0ZoT4DIq7VrMHSlpPknD3GEoyP7XQgMs+Y
 Kj2tGPxJ5uwxibuUCZpTASa9g6Z2nA2WQ7hLvpkA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201024141935.GA3556641@infradead.org>
References: <20201024141935.GA3556641@infradead.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20201024141935.GA3556641@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.10-1
X-PR-Tracked-Commit-Id: 6857a5ebaabc5b9d989872700b4b71dd2a6d6453
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b307ac87075c3207c345822ea276fe4f28481d7
Message-Id: <160356824105.4617.8041494852223115716.pr-tracker-bot@kernel.org>
Date: Sat, 24 Oct 2020 19:37:21 +0000
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

The pull request you sent on Sat, 24 Oct 2020 16:19:35 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.10-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b307ac87075c3207c345822ea276fe4f28481d7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
