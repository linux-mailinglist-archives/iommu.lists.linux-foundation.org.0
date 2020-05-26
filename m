Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC6F1A53A0
	for <lists.iommu@lfdr.de>; Sat, 11 Apr 2020 22:10:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 46D36204D9;
	Sat, 11 Apr 2020 20:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JowxtqLfnPVr; Sat, 11 Apr 2020 20:10:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 91A0A2036C;
	Sat, 11 Apr 2020 20:10:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75E5BC0177;
	Sat, 11 Apr 2020 20:10:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7393EC0177
 for <iommu@lists.linux-foundation.org>; Sat, 11 Apr 2020 20:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6D33F87D8E
 for <iommu@lists.linux-foundation.org>; Sat, 11 Apr 2020 20:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PhSYtni7CxiB for <iommu@lists.linux-foundation.org>;
 Sat, 11 Apr 2020 20:10:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ED25987D80
 for <iommu@lists.linux-foundation.org>; Sat, 11 Apr 2020 20:10:24 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fixes for 5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586635824;
 bh=mWgtkEvt7IMZaEJYQN1AEo87Xcb8U1YyKp3EJ0shWuA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=2i3MKRiFWkbsxJsABANc83L2WU2WUXTs+jOdutdLOi8M3nJpFmkUFVxmrbwTWLn4q
 NMR+JLZ/Q4Ze1xhXy3atP7xKibpo6f7pSNuoP97Bj3kF4U2IEj2yly27b5EImx4eck
 m/MTu4lAAqJDacZ2/sS8+CLarLlHG5bIVc0xe7KQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200411082800.GA1807013@infradead.org>
References: <20200411082800.GA1807013@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200411082800.GA1807013@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.7-1
X-PR-Tracked-Commit-Id: 9bb50ed7470944238ec8e30a94ef096caf9056ee
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 75e71883979c2c173ef2530a8b90a629f17f3107
Message-Id: <158663582474.1053.17528689947317556174.pr-tracker-bot@kernel.org>
Date: Sat, 11 Apr 2020 20:10:24 +0000
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

The pull request you sent on Sat, 11 Apr 2020 10:28:00 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.7-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/75e71883979c2c173ef2530a8b90a629f17f3107

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
