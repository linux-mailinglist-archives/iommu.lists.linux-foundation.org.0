Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4944EB835F
	for <lists.iommu@lfdr.de>; Thu, 19 Sep 2019 23:30:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 60474D2E;
	Thu, 19 Sep 2019 21:30:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 679CFCDF
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 21:30:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 23ED1832
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 21:30:30 +0000 (UTC)
Subject: Re: [GIT PULL] dma-mapping updates for 5.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568928629;
	bh=PxIMPCzSmLksihdPHjm4QGV5FFdSb/+jzcpKL6SE0QU=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=N/k9/zG0H5690gQsIVAD/7SuzY3PEW6cTpTLrwp3rkS316pDfWlnEBUlBH19Yagaz
	qVYe9lAsrjiiMow0EZO6pPIXPPEf0nD7V3qA7HLSgdvmGPxiTG0pwfEcUaTMtYJ8fW
	wNUFKGT3tipMpm+5G7gsgo+8sYF/B5zmohe/mduw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190918152748.GA21241@infradead.org>
References: <20190918152748.GA21241@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190918152748.GA21241@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
	tags/dma-mapping-5.4
X-PR-Tracked-Commit-Id: c7d9eccb3c1e802c5cbb2a764eb0eb9807d9f12e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 671df189537883f36cf9c7d4f9495bfac0f86627
Message-Id: <156892862992.30913.10484528229946005623.pr-tracker-bot@kernel.org>
Date: Thu, 19 Sep 2019 21:30:29 +0000
To: Christoph Hellwig <hch@infradead.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
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

The pull request you sent on Wed, 18 Sep 2019 08:27:48 -0700:

> git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/671df189537883f36cf9c7d4f9495bfac0f86627

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
