Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD865158E0
	for <lists.iommu@lfdr.de>; Sat, 30 Apr 2022 01:15:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 288E18411E;
	Fri, 29 Apr 2022 23:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yR9VvYTovMZN; Fri, 29 Apr 2022 23:15:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 39EEF8411D;
	Fri, 29 Apr 2022 23:15:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02BADC007C;
	Fri, 29 Apr 2022 23:15:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F184C002D
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 23:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 056B040CD9
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 23:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0H472lxXaSE for <iommu@lists.linux-foundation.org>;
 Fri, 29 Apr 2022 23:15:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5626140142
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 23:15:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15EE1623B1;
 Fri, 29 Apr 2022 23:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CB2C385A4;
 Fri, 29 Apr 2022 23:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651274139;
 bh=elqH2Ff8eBloOqEP96qiH80wO36PP21s6y+XTLp+enQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZHx10dC2uYiU9hpRuYyFhaRjHDl2mx8JQrxkHwwfcxcU8kIjVZwHY6oPAx5ruUqMm
 9LGLGarvn440A377DUk+FLghxuZLqScNQXrYOuaoR4yZaGTm8Yo2+VoJ0l6a/tR7hf
 E6QYw0PtTF7Yty5mlkrLvfnn7GtN9kC4B1fKJHohrefvOVZLMXe+jzQjTvokzWTeOi
 4Wq5k3+9NZa+6ZFkkUF/URXKfmbgkR6qBM1ASjZa6eH/kxjqkV94qR+ywfCQI+PRug
 yPfaiPT49IYBy3Z9hqelOY/kPqi7s6b3fNKLXQh6AfbHOOSuRZ9g3uoLlb7ALxyyql
 3cUqFyTUpUMNA==
Date: Fri, 29 Apr 2022 16:15:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
In-Reply-To: <41c2483c-ab54-41be-7815-9d4a98e0249e@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2204291615130.1947187@ubuntu-linux-20-04-desktop>
References: <20220423171422.1831676-1-hch@lst.de>
 <alpine.DEB.2.22.394.2204261605420.915916@ubuntu-linux-20-04-desktop>
 <20220428132737.GA13999@lst.de>
 <alpine.DEB.2.22.394.2204281449060.915916@ubuntu-linux-20-04-desktop>
 <27d39d5a-3b79-bdda-b7e4-f4477667919f@oracle.com>
 <alpine.DEB.2.22.394.2204281548320.915916@ubuntu-linux-20-04-desktop>
 <41c2483c-ab54-41be-7815-9d4a98e0249e@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Rahul Singh <Rahul.Singh@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, 29 Apr 2022, Boris Ostrovsky wrote:
> On 4/28/22 6:49 PM, Stefano Stabellini wrote:
> > On Thu, 28 Apr 2022, Boris Ostrovsky wrote:
> > > On 4/28/22 5:49 PM, Stefano Stabellini wrote:
> > > > On Thu, 28 Apr 2022, Christoph Hellwig wrote:
> > > > > On Tue, Apr 26, 2022 at 04:07:45PM -0700, Stefano Stabellini wrote:
> > > > > > > Reported-by: Rahul Singh <Rahul.Singh@arm.com>
> > > > > > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > > Do you want to take this through the Xen tree or should I pick it up?
> > > > > Either way I'd love to see some testing on x86 as well.
> > > > I agree on the x86 testing. Juergen, Boris?
> > > > 
> > > > I'd say to take this patch via the Xen tree but Juergen has just sent a
> > > > Xen pull request to Linux last Saturday. Juergen do you plan to send
> > > > another one? Do you have something else lined up? If not, it might be
> > > > better to let Christoph pick it up.
> > > 
> > > We don't have anything pending.
> > > 
> > > 
> > > I can test it but at best tomorrow so not sure we can get this into rc5.
> > > Do
> > > you consider this an urgent fix or can we wait until 5.19? Because it's a
> > > bit
> > > too much IMO for rc6.
> > On one hand, Linux doesn't boot on a platform without this fix. On the
> > other hand, I totally see that this patch could introduce regressions on
> > x86 so I think it is fair that we are careful with it.
> > 
> >  From my point of view, it might be better to wait for 5.19 and mark it
> > as backport.
> 
> 
> No problems uncovered during testing.

Great! Christoph you can go ahead and pick it up in your tree if you are
up for it.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
