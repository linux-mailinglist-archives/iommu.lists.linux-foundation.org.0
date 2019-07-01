Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D8D462EC
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 17:35:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 317E013EE;
	Fri, 14 Jun 2019 15:35:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 357451175
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 15:34:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C4718174
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 15:34:58 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id DF91968AFE; Fri, 14 Jun 2019 17:34:28 +0200 (CEST)
Date: Fri, 14 Jun 2019 17:34:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 12/16] staging/comedi: mark as broken
Message-ID: <20190614153428.GA10008@lst.de>
References: <20190614134726.3827-1-hch@lst.de>
	<20190614134726.3827-13-hch@lst.de>
	<20190614140239.GA7234@kroah.com> <20190614144857.GA9088@lst.de>
	<20190614153032.GD18049@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614153032.GD18049@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, devel@driverdev.osuosl.org,
	linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
	David Airlie <airlied@linux.ie>, linux-media@vger.kernel.org,
	Intel Linux Wireless <linuxwifi@intel.com>,
	intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>, Ian Abbott <abbotti@mev.co.uk>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
	"moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>
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

On Fri, Jun 14, 2019 at 05:30:32PM +0200, Greg KH wrote:
> On Fri, Jun 14, 2019 at 04:48:57PM +0200, Christoph Hellwig wrote:
> > On Fri, Jun 14, 2019 at 04:02:39PM +0200, Greg KH wrote:
> > > Perhaps a hint as to how we can fix this up?  This is the first time
> > > I've heard of the comedi code not handling dma properly.
> > 
> > It can be fixed by:
> > 
> >  a) never calling virt_to_page (or vmalloc_to_page for that matter)
> >     on dma allocation
> >  b) never remapping dma allocation with conflicting cache modes
> >     (no remapping should be doable after a) anyway).
> 
> Ok, fair enough, have any pointers of drivers/core code that does this
> correctly?  I can put it on my todo list, but might take a week or so...

Just about everyone else.  They just need to remove the vmap and
either do one large allocation, or live with the fact that they need
helpers to access multiple array elements instead of one net vmap,
which most of the users already seem to do anyway, with just a few
using the vmap (which might explain why we didn't see blowups yet).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
