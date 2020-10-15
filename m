Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7FA28FB14
	for <lists.iommu@lfdr.de>; Fri, 16 Oct 2020 00:19:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F116087C61;
	Thu, 15 Oct 2020 22:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1p4BFM7LqIy; Thu, 15 Oct 2020 22:19:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D036087C5F;
	Thu, 15 Oct 2020 22:19:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B072AC0051;
	Thu, 15 Oct 2020 22:19:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BD27C0051
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 22:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8380D87C5F
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 22:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnuWc7Q8aH7g for <iommu@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 22:19:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EF5AF87C5B
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 22:19:25 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping updates for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602800365;
 bh=jUQ66Abb2Cqv517bRYUaJgK1Ar/plmVQdBiGTSpFQnE=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=n12tT5nj2eWdrcYFLRRlWe8O6kDp9f1/pvamhLXqdmyOCRVcw60T50O0jZ+3gANtm
 iKmiGt+su3LfkI0hZbNTY/kQS2CTE1ZdAScCPaKF8O2GMdA2DSmYU1pVbhMWtlRFJt
 YNrLAbVhBp5mwxbVaXmpQrReLrP0Q/skbPLzucZA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201015174743.GA2648490@infradead.org>
References: <20201015174743.GA2648490@infradead.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20201015174743.GA2648490@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.10
X-PR-Tracked-Commit-Id: 2a410d09417b5344ab1f3cf001ac73a1daf8dcce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5a32c3413d3340f90c82c84b375ad4b335a59f28
Message-Id: <160280036534.16623.3771479441636667328.pr-tracker-bot@kernel.org>
Date: Thu, 15 Oct 2020 22:19:25 +0000
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

The pull request you sent on Thu, 15 Oct 2020 19:47:43 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5a32c3413d3340f90c82c84b375ad4b335a59f28

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
