Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E1F3602
	for <lists.iommu@lfdr.de>; Thu,  7 Nov 2019 18:45:13 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 30D0DE43;
	Thu,  7 Nov 2019 17:44:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 72478DC8
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 17:44:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B8C97712
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 17:44:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id BD4E468BE1; Thu,  7 Nov 2019 18:44:32 +0100 (CET)
Date: Thu, 7 Nov 2019 18:44:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: switch xtensa over to the generic DMA remap / uncached segment
	code
Message-ID: <20191107174432.GA19887@lst.de>
References: <20191101220213.28949-1-hch@lst.de>
	<CAMo8Bf+ctQN405SLVAHmycFx7uQuUixE_cqm1idAV8ZrPkoZQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMo8Bf+ctQN405SLVAHmycFx7uQuUixE_cqm1idAV8ZrPkoZQg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Chris Zankel <chris@zankel.net>, iommu@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>,
	"open list:TENSILICA XTENSA PORT \(xtensa\)"
	<linux-xtensa@linux-xtensa.org>
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

On Fri, Nov 01, 2019 at 08:18:49PM -0700, Max Filippov wrote:
> On Fri, Nov 1, 2019 at 3:02 PM Christoph Hellwig <hch@lst.de> wrote:
> > this series switches over xtensa to use the generic DMA remap and
> > uncached code.  Xtensa is a little special because it uses an uncached
> > segment by default, but can still use page table bits for remapping
> > highmem.  To facilitate that there is some major refactoring in the
> > common DMA code that merges the remapping code into the main direct
> > mapping alloc / free routines.
> 
> For the whole series:
> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
> For the xtensa bits:
> Tested-by: Max Filippov <jcmvbkbc@gmail.com>

Thanks,

I've pulled this into the dma-mapping tree for 5.5.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
