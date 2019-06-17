Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0037F47D27
	for <lists.iommu@lfdr.de>; Mon, 17 Jun 2019 10:34:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E11C6C58;
	Mon, 17 Jun 2019 08:34:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7DFC7C3A
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 08:34:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 23531828
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 08:34:14 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id D530F68D0E; Mon, 17 Jun 2019 10:33:42 +0200 (CEST)
Date: Mon, 17 Jun 2019 10:33:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: use exact allocation for dma coherent memory
Message-ID: <20190617083342.GA7883@lst.de>
References: <20190614134726.3827-1-hch@lst.de> <20190617082148.GF28859@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617082148.GF28859@kadam>
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

> drivers/infiniband/hw/cxgb4/qp.c
>    129  static int alloc_host_sq(struct c4iw_rdev *rdev, struct t4_sq *sq)
>    130  {
>    131          sq->queue = dma_alloc_coherent(&(rdev->lldi.pdev->dev), sq->memsize,
>    132                                         &(sq->dma_addr), GFP_KERNEL);
>    133          if (!sq->queue)
>    134                  return -ENOMEM;
>    135          sq->phys_addr = virt_to_phys(sq->queue);
>    136          dma_unmap_addr_set(sq, mapping, sq->dma_addr);
>    137          return 0;
>    138  }
> 
> Is this a bug?

Yes.  This will blow up badly on many platforms, as sq->queue
might be vmapped, ioremapped, come from a pool without page backing.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
