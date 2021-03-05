Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CC70632F59F
	for <lists.iommu@lfdr.de>; Fri,  5 Mar 2021 22:59:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7158749E7A;
	Fri,  5 Mar 2021 21:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IS6vKZVq0ISA; Fri,  5 Mar 2021 21:59:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631B94891C;
	Fri,  5 Mar 2021 21:59:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35DB1C0001;
	Fri,  5 Mar 2021 21:59:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BD27C0001
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 21:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5769B49E7A
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 21:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKDyVPR753ce for <iommu@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 21:58:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 870CB4891C
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 21:58:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 09AE265051;
 Fri,  5 Mar 2021 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614981539;
 bh=wCtH3MoXQz+BB4xKiktPGcCpzGS4AumQg2uqoXMHhm4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=uDEsmjUkuk+y1UnQf4uk5YFcHTP7XBVBG9txAdBNZnzp1pHsBXzKGZFaPEcm9spZc
 E+7T033yrncKqEFqNQ6hhEkgu+NTe8SQmEJkzRD81INHWTYeEowGu9LiCZ/YtV3S0I
 YAl4bjzJUSsMOxSj1VGOM/71bjXVQl7GSyP+iwnWJLBRmnJl2uva7cu3QjFARqYRjk
 s/c2XKXevBinKkR0k9lU2D3rlbgw5rA7j680rSxixBZI+FG0bHNstyLHEi6P43zLPy
 DapPD7SKQZGoigRgPsvn4SyclWSs61m577cs2QrsWbkD4zl821XaPpsHuEyFKyStwr
 1LSCqDZbkhuRg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 055E2609EA;
 Fri,  5 Mar 2021 21:58:59 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux iommu-updates-v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210305162319.GA14489@8bytes.org>
References: <20210305162319.GA14489@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210305162319.GA14489@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.12-rc1
X-PR-Tracked-Commit-Id: 444d66a23c1f1e4c4d12aed4812681d0ad835d60
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc2c8d0af05af4c380824e40ff99ede398913ae5
Message-Id: <161498153901.14373.491816744847742815.pr-tracker-bot@kernel.org>
Date: Fri, 05 Mar 2021 21:58:59 +0000
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

The pull request you sent on Fri, 5 Mar 2021 17:23:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.12-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc2c8d0af05af4c380824e40ff99ede398913ae5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
