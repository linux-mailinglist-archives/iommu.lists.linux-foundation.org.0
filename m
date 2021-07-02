Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E80263BA53F
	for <lists.iommu@lfdr.de>; Fri,  2 Jul 2021 23:47:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD0160C0A;
	Fri,  2 Jul 2021 21:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcqFZcyPR5iE; Fri,  2 Jul 2021 21:47:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 83E6360BFD;
	Fri,  2 Jul 2021 21:47:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5543EC000E;
	Fri,  2 Jul 2021 21:47:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C477C000E
 for <iommu@lists.linux-foundation.org>; Fri,  2 Jul 2021 21:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EEC2827CE
 for <iommu@lists.linux-foundation.org>; Fri,  2 Jul 2021 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lzz0sbQLqg4U for <iommu@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 21:47:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A06B81B01
 for <iommu@lists.linux-foundation.org>; Fri,  2 Jul 2021 21:47:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9D380613FC;
 Fri,  2 Jul 2021 21:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625262446;
 bh=dt0Uq9m23UqZKIIfgUp7yjZd3OZUmiA+H07EWR+B8Ns=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nM8PHk6HjZnSImA7rkgQ7cquHU796KXyjlY++BYfHDqWv/AQ+zTnSppUiMEVmtvuc
 2IilplP4twN3QOmup9Xkc1HxA1XrHfY75mdZWpSWFefc25TR2Jpkflg8YAItt9viPz
 p+HXSQLvuIq1KD/8Delmb1E5IkBKpCWM9TkPVdZJ84Qxk1YGNlR1bYcg4d5CjjzoOb
 oSUEY9juX6TFJPyx/Rwsza1yCMbQ2T5KFR9Pa2OxKQtn+mkitoVoxlMFqo/i0eyNd6
 z97gzyPFjpg6eSrbHIiXoF5aZAlxAIDtOT+W95ESsztGHRrXqYOzcmj2oavYyyzG/M
 tpIrhHM1oy/FA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9769860283;
 Fri,  2 Jul 2021 21:47:26 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping updates for Linux 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <YN85ebItWEBp98jL@infradead.org>
References: <YN85ebItWEBp98jL@infradead.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <YN85ebItWEBp98jL@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.14
X-PR-Tracked-Commit-Id: 2b4bbc6231d789f58676d2ccc42177df163e1c4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e72b069609aa76cc1de35f5d434dbfaa5392ae9a
Message-Id: <162526244661.28144.17308914428564456116.pr-tracker-bot@kernel.org>
Date: Fri, 02 Jul 2021 21:47:26 +0000
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

The pull request you sent on Fri, 2 Jul 2021 18:06:17 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e72b069609aa76cc1de35f5d434dbfaa5392ae9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
