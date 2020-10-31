Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CAE2A1A55
	for <lists.iommu@lfdr.de>; Sat, 31 Oct 2020 20:53:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A34018765E;
	Sat, 31 Oct 2020 19:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MbqXeMT7TUvm; Sat, 31 Oct 2020 19:53:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39E818766A;
	Sat, 31 Oct 2020 19:53:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C578C0051;
	Sat, 31 Oct 2020 19:53:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61FBFC0051
 for <iommu@lists.linux-foundation.org>; Sat, 31 Oct 2020 19:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4E23A867EB
 for <iommu@lists.linux-foundation.org>; Sat, 31 Oct 2020 19:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6O3QIAxrst0 for <iommu@lists.linux-foundation.org>;
 Sat, 31 Oct 2020 19:53:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D32B4867AC
 for <iommu@lists.linux-foundation.org>; Sat, 31 Oct 2020 19:53:54 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fix for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604174034;
 bh=viwE+r2ezqayH37udQUFt9+Rvq68jOQmPS7y1ziw3n0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=nZCrgG6UAmfVoyJ8F0dzDpn0LyUMdOh9i5pYHlikaR3UqVPIt3pmzYNNzjuK2Hd0Q
 EtiQW8GB8dh4d1OHXRIn7LNLL0CbjxZkwi2hwoGc3nViLkazoFOtxyOxUOiumI1LtL
 l8K0jUPQ0OPUEItWeUhY5URYeGD6ascm0AnngC5w=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201031093823.GA453843@infradead.org>
References: <20201031093823.GA453843@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201031093823.GA453843@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.10-2
X-PR-Tracked-Commit-Id: 48ab6d5d1f096d6fac5b59f94af0aa394115a001
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb3540be73ca1e483aa977d859960895fe85372d
Message-Id: <160417403443.21727.3065273541120028592.pr-tracker-bot@kernel.org>
Date: Sat, 31 Oct 2020 19:53:54 +0000
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

The pull request you sent on Sat, 31 Oct 2020 10:38:23 +0100:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb3540be73ca1e483aa977d859960895fe85372d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
