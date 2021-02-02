Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1DC30CA5E
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 19:48:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AFE2A8659B;
	Tue,  2 Feb 2021 18:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pa8ZPq6C2RBa; Tue,  2 Feb 2021 18:48:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 411A58618C;
	Tue,  2 Feb 2021 18:48:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B967C013A;
	Tue,  2 Feb 2021 18:48:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 219CFC013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 18:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1C49C85044
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 18:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TznnrYB1NMqO for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 18:48:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2F6E084D3B
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 18:48:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E1BF264E75;
 Tue,  2 Feb 2021 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612291721;
 bh=JKWLRTQOQVeeDLO8g4x1KSDglFHPOXkyY9zpP2u2lVY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=cjWn92HOtwG8ykfkZmoQxRrR7lVcouLAgK43bkArnXFJ33DzmHmxwzqfyjhcvCP2R
 g7q0ftHd3OiTi8CZwBP+8dk6XyrYMwg0vGeuoH0pM7zmcPnTVcj3wdcliC9NYwvAkC
 9MaSfl9vBFwMgPajCtF0fHZBQdPyNhNc7TMUD9za1ufVfe7ODRyOPaspBVafx9or6n
 HxF/px6oBQrFV2mFWBDVnonPk44oTyU98EyqFlUFcqnL4Bp9TdReWravGb0g14LOsq
 f9eNW+2BgPXfTC46LivlgqjW+wrhb7sDgSjjhoQ5NpyYLuVU3qqsdfGsVV5ja8WC++
 Fj0iWjZd9NBHQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DC22D60987;
 Tue,  2 Feb 2021 18:48:41 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fix for 5.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <YBkahgjZ1hnpplH1@infradead.org>
References: <YBkahgjZ1hnpplH1@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YBkahgjZ1hnpplH1@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.11-1
X-PR-Tracked-Commit-Id: d17405d52bacd14fe7fdbb10c0434934ea496914
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d36ccd4bd07825775b512f654566d3e89e9cfd0
Message-Id: <161229172189.14515.6960556676521063526.pr-tracker-bot@kernel.org>
Date: Tue, 02 Feb 2021 18:48:41 +0000
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

The pull request you sent on Tue, 2 Feb 2021 10:25:26 +0100:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d36ccd4bd07825775b512f654566d3e89e9cfd0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
