Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466D8DCF1
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 20:25:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 17C26E2D;
	Wed, 14 Aug 2019 18:25:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8723DDDD
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 18:25:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 440AA89D
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 18:25:06 +0000 (UTC)
Subject: Re: [GIT PULL] dma mapping fixes for 5.3-rc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565807106;
	bh=aMza95Rk5bvMKEYj7zMse/e16vrNacpcAj+1mggKrUs=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=qndm0DThOiJb5Z5dPls8PDEcC485XcjsoCz/fy582BgLzyRwe1tERHLO8SGSTw31I
	dL6Kxb4/Qm0hxHb9sB+QGWFKaaCHpVdJ2URvYX4UZvBgVnzdIxwf9bn8Jwx3MzR66U
	daBm29wp9GiIw/LXVrjEY4SZlvcyn56+zDIeECtU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190814141217.GA3792@infradead.org>
References: <20190814141217.GA3792@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190814141217.GA3792@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
	tags/dma-mapping-5.3-4
X-PR-Tracked-Commit-Id: 33dcb37cef741294b481f4d889a465b8091f11bf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e83b009c5c366b678c7986fa6c1d38fed06c954c
Message-Id: <156580710610.11871.6276353935293222057.pr-tracker-bot@kernel.org>
Date: Wed, 14 Aug 2019 18:25:06 +0000
To: Christoph Hellwig <hch@infradead.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

The pull request you sent on Wed, 14 Aug 2019 16:12:17 +0200:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.3-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e83b009c5c366b678c7986fa6c1d38fed06c954c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
