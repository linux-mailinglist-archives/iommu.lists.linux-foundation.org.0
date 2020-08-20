Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C75124C670
	for <lists.iommu@lfdr.de>; Thu, 20 Aug 2020 21:57:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A3FB78841F;
	Thu, 20 Aug 2020 19:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfyFV0TWIw+M; Thu, 20 Aug 2020 19:56:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 60FBC88419;
	Thu, 20 Aug 2020 19:56:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AB42C0051;
	Thu, 20 Aug 2020 19:56:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B282BC0051
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 19:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9BD4B86AB0
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 19:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBUfpZ2X3EOo for <iommu@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 19:56:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from hillosipuli.retiisi.org.uk (retiisi.org.uk [95.216.213.190])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 40F2086AAB
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 19:56:50 +0000 (UTC)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk
 [IPv6:2a01:4f9:c010:4572::80:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 914F6634C87;
 Thu, 20 Aug 2020 22:55:36 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
 (envelope-from <sakari.ailus@retiisi.org.uk>)
 id 1k8qeu-0002rH-B7; Thu, 20 Aug 2020 22:55:36 +0300
Date: Thu, 20 Aug 2020 22:55:36 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 17/18] media/omap3isp: Clean up IOMMU workaround
Message-ID: <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <11d8419744e4e744a9448180801b0c4683328afd.1597931876.git.robin.murphy@arm.com>
 <20200820165339.GK7145@valkosipuli.retiisi.org.uk>
 <be010209-4abc-ba48-4e31-185427776a13@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be010209-4abc-ba48-4e31-185427776a13@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, will@kernel.org,
 hch@lst.de, linux-samsung-soc@vger.kernel.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 inki.dae@samsung.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sw0312.kim@samsung.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, t-kristo@ti.com, kyungmin.park@samsung.com
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

On Thu, Aug 20, 2020 at 06:25:19PM +0100, Robin Murphy wrote:
> On 2020-08-20 17:53, Sakari Ailus wrote:
> > Hi Robin,
> > 
> > On Thu, Aug 20, 2020 at 04:08:36PM +0100, Robin Murphy wrote:
> > > Now that arch/arm is wired up for default domains and iommu-dma, devices
> > > behind IOMMUs will get mappings set up automatically as appropriate, so
> > > there is no need for drivers to do so manually.
> > > 
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > 
> > Thanks for the patch.
> 
> Many thanks for testing so quickly!
> 
> > I haven't looked at the details but it seems that this causes the buffer
> > memory allocation to be physically contiguous, which causes a failure to
> > allocate video buffers of entirely normal size. I guess that was not
> > intentional?
> 
> Hmm, it looks like the device ends up with the wrong DMA ops, which implies
> something didn't go as expected with the earlier IOMMU setup and default
> domain creation. Chances are that either I missed some subtlety in the
> omap_iommu change, or I've fundamentally misjudged how the ISP probing works
> and it never actually goes down the of_iommu_configure() path in the first
> place. Do you get any messages from the IOMMU layer earlier on during boot?

I do get these:

[    2.934936] iommu: Default domain type: Translated 
[    2.940917] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[    2.946899] platform 480bc000.isp: Adding to iommu group 0

-- 
Sakari Ailus
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
