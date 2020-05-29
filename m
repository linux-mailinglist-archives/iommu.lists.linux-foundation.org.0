Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 271EB1E898F
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 23:10:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C1ED2893EE;
	Fri, 29 May 2020 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAT9SVR3gqfp; Fri, 29 May 2020 21:10:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 672B389441;
	Fri, 29 May 2020 21:10:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CE5BC088A;
	Fri, 29 May 2020 21:10:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8CAAC016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 21:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DA51C883BE
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kug+qLlbFXO for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 21:10:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 76125883B3
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 21:10:07 +0000 (UTC)
Subject: Re: [git pull] IOMMU Fixes for Linux v5.7-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590786606;
 bh=C7jau0IuCea6Jhmahys1JOe9wMqgN9X0IW0uelXub2s=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=BajMhUzt+DWyBJTRzbJNuS+6Cc6mQ0POB5RIIz4hxa6CdVbas8N/jnfMBg7SxIzPR
 a/zPSwHdocuG8SoHiNGjKv3s46bpeUriTedArPOKM3MRGS6rAEDRWozJqMcQXEAPdi
 IgK3d0In3U59v4tRA2ilTGshf/k5B9ikJZ7VfIzE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200529185836.GA31964@8bytes.org>
References: <20200529185836.GA31964@8bytes.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200529185836.GA31964@8bytes.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 tags/iommu-fixes-v5.7-rc7
X-PR-Tracked-Commit-Id: 7cc31613734c4870ae32f5265d576ef296621343
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b58f2140ea8605ee6ea0530d9c0cb5d049f9c7ca
Message-Id: <159078660639.32003.3784639971506990928.pr-tracker-bot@kernel.org>
Date: Fri, 29 May 2020 21:10:06 +0000
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

The pull request you sent on Fri, 29 May 2020 20:58:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.7-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b58f2140ea8605ee6ea0530d9c0cb5d049f9c7ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
