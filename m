Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFE3BA53E
	for <lists.iommu@lfdr.de>; Fri,  2 Jul 2021 23:47:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19EDB4015C;
	Fri,  2 Jul 2021 21:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzjn5EvcVVSc; Fri,  2 Jul 2021 21:47:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4D47640232;
	Fri,  2 Jul 2021 21:47:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D9BDC001F;
	Fri,  2 Jul 2021 21:47:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FC2CC000E
 for <iommu@lists.linux-foundation.org>; Fri,  2 Jul 2021 21:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ECA860BEC
 for <iommu@lists.linux-foundation.org>; Fri,  2 Jul 2021 21:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6Md37ypaCIO for <iommu@lists.linux-foundation.org>;
 Fri,  2 Jul 2021 21:47:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAE5C60B6C
 for <iommu@lists.linux-foundation.org>; Fri,  2 Jul 2021 21:47:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 49FC1613C5;
 Fri,  2 Jul 2021 21:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625262446;
 bh=EO9AxEgMOLzM2Q6/nyEjGEeF17ZjoCabe8lMhr+K/Cw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=RT3PcEDDkWTJiD+Rn3CgVG6xXktyPgDhHl3hGlxUeowjnVxfhoDA5Rl+6vJ6XReC9
 spApdOPzvKM8++9xLpSI+y8pymCzQ+TEtnNZqFD8lJsmZWVMQtbEsBBAFP/bBvJc1s
 iXE9m1bk5iy9IcornUWPkJEqmnL/cprR5yk2VCD+zsDJGqUMgMEuQCngC351XxcHD9
 +uRau76ZoXx212Wk+mhwML+d/J+BKg6KnroihAjttyM6EF1FU4RoPZXIxzxz98dhec
 xusZrW4eLJjTyJ3DwLRuLY+cWMXTCt20uRgSdsVMDPxrji0DPjK4eX4JGkIivI9Oce
 E9+lhb35aOdqA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 367C26097A;
 Fri,  2 Jul 2021 21:47:26 +0000 (UTC)
Subject: Re: [git pull] IOMMU Updates for Linux v5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <YN7IDbKZFQnYFCNq@8bytes.org>
References: <YN7IDbKZFQnYFCNq@8bytes.org>
X-PR-Tracked-List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <YN7IDbKZFQnYFCNq@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-updates-v5.14
X-PR-Tracked-Commit-Id: 2b9d8e3e9a9bb693a8b8bd26ad192db037517759
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd3eb7efaa995db00db0ba64893814f9831be842
Message-Id: <162526244616.28144.17442613568063715973.pr-tracker-bot@kernel.org>
Date: Fri, 02 Jul 2021 21:47:26 +0000
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

The pull request you sent on Fri, 2 Jul 2021 10:02:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-updates-v5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd3eb7efaa995db00db0ba64893814f9831be842

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
