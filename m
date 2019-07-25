Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CF974770
	for <lists.iommu@lfdr.de>; Thu, 25 Jul 2019 08:43:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C63FC164D;
	Thu, 25 Jul 2019 06:43:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 902A21649
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 06:43:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 2A837B0
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 06:43:34 +0000 (UTC)
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
	by kirsty.vergenet.net (Postfix) with ESMTPA id 0672425BE27;
	Thu, 25 Jul 2019 16:33:31 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
	id 0939CE2209B; Thu, 25 Jul 2019 08:33:29 +0200 (CEST)
Date: Thu, 25 Jul 2019 08:33:28 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v8 2/5] iommu/dma: Add a new dma_map_ops of
	get_merge_boundary()
Message-ID: <20190725063328.ua5fu6dqig2a4rrf@verge.net.au>
References: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1563859608-19456-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<ae95cc2e-38b4-0ed9-744a-67f03f220a3f@cogentembedded.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae95cc2e-38b4-0ed9-744a-67f03f220a3f@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: axboe@kernel.dk, linux-renesas-soc@vger.kernel.org, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, hch@lst.de,
	linux-block@vger.kernel.org, wsa+renesas@sang-engineering.com,
	iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

On Tue, Jul 23, 2019 at 11:17:19AM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 23.07.2019 8:26, Yoshihiro Shimoda wrote:
> 
> > This patch adds a new dma_map_ops of get_merge_boundary() to
> > expose the DMA merge boundary if the domain type is IOMMU_DOMAIN_DMA.
> > 
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Sergei's comment notwithstanding,

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> > ---
> >   drivers/iommu/dma-iommu.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> > index a7f9c3e..f3e5f2b 100644
> > --- a/drivers/iommu/dma-iommu.c
> > +++ b/drivers/iommu/dma-iommu.c
> > @@ -1085,6 +1085,16 @@ static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
> >   	return ret;
> >   }
> > +static unsigned long iommu_dma_get_merge_boundary(struct device *dev)
> > +{
> > +	struct iommu_domain *domain = iommu_get_dma_domain(dev);
> > +
> > +	if (domain->type != IOMMU_DOMAIN_DMA)
> > +		return 0;	/* can't merge */
> > +
> > +	return (1 << __ffs(domain->pgsize_bitmap)) - 1;
> 
>    Not 1UL?
> 
> > +}
> > +
> >   static const struct dma_map_ops iommu_dma_ops = {
> >   	.alloc			= iommu_dma_alloc,
> >   	.free			= iommu_dma_free,
> [...]
> 
> MBR, Sergei
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
