Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD3128252
	for <lists.iommu@lfdr.de>; Fri, 20 Dec 2019 19:45:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BBDED20474;
	Fri, 20 Dec 2019 18:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HDUDi6XmHeY; Fri, 20 Dec 2019 18:45:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 27FED2034F;
	Fri, 20 Dec 2019 18:45:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F23A0C1D87;
	Fri, 20 Dec 2019 18:45:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50C97C077D
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 18:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3E3A087FEF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 18:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HZ-WTqd0HRw for <iommu@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 18:45:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C00C78444E
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 18:45:11 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.5-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576867511;
 bh=AB4siEhED5j0416+2sMoma4toRhn6RpvO+9sj8Jbv4I=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=2Q2amZ74uZSr7vQG2OJFLkTXcWPoXSpAswftjGR6+psWELXAPEjJxMcv62z+BuuRS
 NUfCWfVct6wwJwB41eEG1a53hQ5+Aa1AmF+sIeQ0tQCjC8knrmadSTzRkbqSVyh/bw
 oTWmQRa9MWzTKKWUJoyYAqRkkkcijtf9RIjB8AAM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191220113020.GA18747@8bytes.org>
References: <20191220113020.GA18747@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191220113020.GA18747@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.5-rc2
X-PR-Tracked-Commit-Id: c18647900ec864d401ba09b3bbd5b34f331f8d26
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b371ddb94fae82b6565020639b7db31934043c65
Message-Id: <157686751152.22538.2666482295104019680.pr-tracker-bot@kernel.org>
Date: Fri, 20 Dec 2019 18:45:11 +0000
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

The pull request you sent on Fri, 20 Dec 2019 12:30:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.5-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b371ddb94fae82b6565020639b7db31934043c65

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
