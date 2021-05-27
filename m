Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1938139358A
	for <lists.iommu@lfdr.de>; Thu, 27 May 2021 20:41:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8539A4069A;
	Thu, 27 May 2021 18:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Omxf2FLN8Mqd; Thu, 27 May 2021 18:41:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 758FE40698;
	Thu, 27 May 2021 18:41:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 417B6C0001;
	Thu, 27 May 2021 18:41:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86B22C0001
 for <iommu@lists.linux-foundation.org>; Thu, 27 May 2021 18:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75161402D4
 for <iommu@lists.linux-foundation.org>; Thu, 27 May 2021 18:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CIqQ7bmXn7UG for <iommu@lists.linux-foundation.org>;
 Thu, 27 May 2021 18:41:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDE1940103
 for <iommu@lists.linux-foundation.org>; Thu, 27 May 2021 18:41:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5C080613D1;
 Thu, 27 May 2021 18:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622140910;
 bh=VXatjFi7e5S32DXaMFXcfx1fqakx8PI0p8STJiuxb+M=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=F4IPD0RYj2DDP6oKicO14nx5hhWa8yiTM6kqwoLPHgp1z3Bid46s/zFzTfKzMQPUS
 xB2qdxFFoj2nxNIbneC4bdrYjh6micyQ0lN2RvnUygiH6M3XUVRDlnPEl/QuQWcz0k
 N/F9qKKnVkFcktl8olZMWfiHz2Y+xNrFyXVQVDgF849uGVqGo5IXsXKhyEUr2bYxTN
 crD0KAFZdSSmmrVfooSzbz5BKY5N9J9Lb37rEbpWoVl3Z5t91n3ppGr1La/AQrz8rz
 3rqUxgxa4rECIlBB1Dh336whKTMmUga2MTJ/VVgxMZ9txdRKLmbWH7CsNBin6o7Wjz
 Y1dxF9E4cUlCQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5279260CE1;
 Thu, 27 May 2021 18:41:50 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.13-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <YK/dheM2NZz6KOkb@8bytes.org>
References: <YK/dheM2NZz6KOkb@8bytes.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <YK/dheM2NZz6KOkb@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.13-rc3
X-PR-Tracked-Commit-Id: 0ee74d5a48635c848c20f152d0d488bf84641304
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 96c132f837ff0639702d04d229da190f636a48b5
Message-Id: <162214091033.4321.14027615366383525738.pr-tracker-bot@kernel.org>
Date: Thu, 27 May 2021 18:41:50 +0000
To: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
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

The pull request you sent on Thu, 27 May 2021 19:57:25 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.13-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/96c132f837ff0639702d04d229da190f636a48b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
