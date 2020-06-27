Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0727420C40A
	for <lists.iommu@lfdr.de>; Sat, 27 Jun 2020 22:25:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9DCFB86E97;
	Sat, 27 Jun 2020 20:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuAyzx37nHlS; Sat, 27 Jun 2020 20:25:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4000486ABB;
	Sat, 27 Jun 2020 20:25:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20FA1C016F;
	Sat, 27 Jun 2020 20:25:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A324C016F
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 20:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 10A5C86E97
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 20:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbDKDE3klRxx for <iommu@lists.linux-foundation.org>;
 Sat, 27 Jun 2020 20:25:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8EA6386ABB
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 20:25:13 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping fixes for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593289513;
 bh=9J040E0WnnbQGma5xN3YBHaW/r21PdJwI/TPcLGUJ0k=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=EasVfYhXqGsLNA/0DLHWXBkODWqVUoRomVJK3r61hPPMbNxBlLF/J6YrljHyc0cWm
 gofyPVLAFXvKmELbnHZmTKRxovKAgICDCfY/beCVnQyxUcLrCMKbjXhpqXg1Fc98en
 6xgtwDd4DvuK3oDHZZtw/O4+xoLdq8b45ZrA0r6E=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200627074902.GA2447682@infradead.org>
References: <20200627074902.GA2447682@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200627074902.GA2447682@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.8-4
X-PR-Tracked-Commit-Id: 8e36baf97b252cdcafa53589e8227cbb1e85f0b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f05baa066d0f6a38f0624c28008fb2f53cd00e17
Message-Id: <159328951331.11719.13949831114777019739.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jun 2020 20:25:13 +0000
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

The pull request you sent on Sat, 27 Jun 2020 09:49:02 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.8-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f05baa066d0f6a38f0624c28008fb2f53cd00e17

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
