Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F96870108
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 15:31:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A8D9CCB8;
	Mon, 22 Jul 2019 13:31:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C0DDFC7C
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 13:31:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 61A83F8
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 13:30:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 705ADB06B;
	Mon, 22 Jul 2019 13:30:55 +0000 (UTC)
Date: Mon, 22 Jul 2019 15:30:53 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] iommu/amd: fix a crash in iova_magazine_free_pfns
Message-ID: <20190722133053.GI19068@suse.de>
References: <1562861865-23660-1-git-send-email-cai@lca.pw>
	<CAHk-=wgwd9vT1h7jKMU_E4ae2QLFFH69UxcXpO3J9YqEApdUNg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wgwd9vT1h7jKMU_E4ae2QLFFH69UxcXpO3J9YqEApdUNg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu <iommu@lists.linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Linus,

On Sun, Jul 21, 2019 at 09:58:04AM -0700, Linus Torvalds wrote:
> This one seems to have fallen through the cracks.
> 
> Applied directly.

Thanks!

> Maybe it's hiding in some fixes tree that I haven't gotten a pull
> request for yet?

No, I havn't had it applied anywhere yet. I usually don't pay close
attention to patches sent to me during the merge window, as I won't
update my tree anyway before -rc1.

I only take care of important fixes, but this one seems to have
fallen through my heuristic. Thanks for applying it directly.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
