Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C752330
	for <lists.iommu@lfdr.de>; Tue, 25 Jun 2019 07:53:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D8083898;
	Tue, 25 Jun 2019 05:53:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 38BE5255
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 05:53:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8F23D7FD
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 05:53:11 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 7E4DA68B02; Tue, 25 Jun 2019 07:52:40 +0200 (CEST)
Date: Tue, 25 Jun 2019 07:52:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ley Foon Tan <lftan@altera.com>
Subject: Re: [PATCH 1/2] nios2: use the generic uncached segment support in
	dma-direct
Message-ID: <20190625055240.GB28854@lst.de>
References: <20190603065324.9724-1-hch@lst.de>
	<20190603065324.9724-2-hch@lst.de>
	<CAFiDJ5-HwPR-SWUkYA9=Jn_iHnZ+xWzx6RrcHPNy8kA0jmeZfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFiDJ5-HwPR-SWUkYA9=Jn_iHnZ+xWzx6RrcHPNy8kA0jmeZfw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	linux-mips@vger.kernel.org
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

On Tue, Jun 25, 2019 at 01:29:40PM +0800, Ley Foon Tan wrote:
> On Mon, Jun 3, 2019 at 2:54 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Stop providing our own arch alloc/free hooks and just expose the segment
> > offset and use the generic dma-direct allocator.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Acked-by: Ley Foon Tan <ley.foon.tan@intel.com>

Thanks,

applied to dma-mapping for-next.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
