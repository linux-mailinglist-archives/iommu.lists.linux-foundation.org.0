Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061D16BA91
	for <lists.iommu@lfdr.de>; Tue, 25 Feb 2020 08:27:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E8FC85749;
	Tue, 25 Feb 2020 07:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDlarlvVcl-N; Tue, 25 Feb 2020 07:27:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3455856E4;
	Tue, 25 Feb 2020 07:27:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBC0BC0177;
	Tue, 25 Feb 2020 07:27:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DEB0C0177
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 07:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 56543855B4
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 07:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vndzylA+OPa for <iommu@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 07:27:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id A78D984C99
 for <iommu@lists.linux-foundation.org>; Tue, 25 Feb 2020 07:27:02 +0000 (UTC)
X-UUID: f8e1e20328ee411c9abcf9805541c58c-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fE4NqegaPIl2E5K0BSQdRpTvTQnMKgleeKsxdQnFM+Y=; 
 b=ll+QGmgJ4oHIoXAhhXiIBQzbDrmPO6skhHheYfDr78X6sPxXvS5d9jp5JYfESkaCAXk7/fxXGWUgz+c3NASP/O53MLf+G8nHhjEyXAcnymeLvP8ve+3bHL+W1Ttj3i4xvZQoxMaQFZm4YOVc/bee7pbWOmXs3bx/Uoeb1Jhcnp0=;
X-UUID: f8e1e20328ee411c9abcf9805541c58c-20200225
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <chao.hao@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 119154821; Tue, 25 Feb 2020 15:26:58 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 15:26:04 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 15:27:08 +0800
Message-ID: <1582615551.28426.5.camel@mbjsdccf07>
Subject: Re: [RESEND,PATCH 03/13] iommu/mediatek: Add mtk_iommu_pgtable
 structure
From: chao hao <Chao.Hao@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>
Date: Tue, 25 Feb 2020 15:25:51 +0800
In-Reply-To: <1581769046.32039.27.camel@mhfsdcap03>
References: <20191104115238.2394-1-chao.hao@mediatek.com>
 <20191104115238.2394-4-chao.hao@mediatek.com>
 <1576498396.28043.78.camel@mhfsdcap03>
 <1577785148.30177.5.camel@mbjsdccf07>
 <1581769046.32039.27.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: Anan Sun =?UTF-8?Q?=28=E5=AD=99=E5=AE=89=E5=AE=89=29?=
 <Anan.Sun@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Cui Zhang =?UTF-8?Q?=28=E5=BC=A0=E7=BF=A0=29?= <Cui.Zhang@mediatek.com>,
 Jun Yan =?UTF-8?Q?=28=E9=A2=9C=E5=86=9B=29?= <Jun.Yan@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, youlin.pei@mediatek.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Miles Chen =?UTF-8?Q?=28=E9=99=B3=E6=B0=91=E6=A8=BA=29?=
 <Miles.Chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 fy.yang@mediatek.com
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

On Sat, 2020-02-15 at 20:17 +0800, Yong Wu wrote:
> On Tue, 2019-12-31 at 17:39 +0800, chao hao wrote:
> > On Mon, 2019-12-16 at 20:13 +0800, Yong Wu wrote:
> > > On Mon, 2019-11-04 at 19:52 +0800, Chao Hao wrote:
> > > > Start with this patch, we will change the SW architecture
> > > > to support multiple domains. SW architecture will has a big change,
> > > > so we need to modify a little bit by more than one patch.
> > > > The new SW overall architecture is as below:
> > > > 
> > > > 				iommu0   iommu1
> > > > 				  |	    |
> > > > 				  -----------
> > > > 					|
> > > > 				mtk_iommu_pgtable
> > > > 					|
> > > > 			------------------------------------------
> > > > 			|		     |			 |
> > > > 		mtk_iommu_domain1   mtk_iommu_domain2  mtk_iommu_domain3
> > > > 			|                    |                   |
> > > > 		iommu_group1         iommu_group2           iommu_group3
> > > > 			|                    |                   |
> > > > 		iommu_domain1       iommu_domain2	    iommu_domain3
> > > > 			|                    |                   |
> > > > 		iova region1(normal)  iova region2(CCU)    iova region3(VPU)
> > > > 
> > > > For current structure, no matter how many iommus there are,
> > > > they use the same page table to simplify the usage of module.
> > > > In order to make the software architecture more explicit, this
> > > > patch will create a global mtk_iommu_pgtable structure to describe
> > > > page table and all the iommus use it.
> > > 
> > > Thanks for the hard work of this file. Actually this patch and the later
> > > ones confuse me. Why do you make this flow change? 
> > > for making the code "more explicit" or for adding multi-domain support
> > > in 13/13.
> > > 
> > > IMHO, the change is unnecessary.
> > > a) For me, this change has no improvement. currently we use a global
> > > mtk_iommu_get_m4u_data to get the M4U data. I will be very glad if you
> > > could get rid of it. But in this patchset, You use a another global
> > > mtk_iommu_pgtable to instead. For me. It has no improvement.
> > 
> > Thanks for you advice!
> > 
> > For current SW arch, all the IOMMU HW use the same page table, we can
> > use a global mtk_iommu_pgtable to discribe the information of page table
> 
> What's your plan if the 4GB iova range is not enough for us in future?
> Do you plan to add a new global mtk_iommu_pgtable again?
> 
if the 4GB iova range is not enough, we only need to modify
mtk_domain_data structure: min_iova and max_iova, Compare with current
SW arch:
 dom->domain.geometry.aperture_start = 0;
 dom->domain.geometry.aperture_end = DMA_BIT_MASK(32);
 ==>
 dom->domain.geometry.aperture_start = pgtable->dom_region->min_iova;
 dom->domain.geometry.aperture_end = pgtable->dom_region->max_iova;
 
 struct mtk_domain_data {
          dma_addr_t      min_iova;
          dma_addr_t      max_iova;
  };

> > and all the IOMMU attach it, I think that it is more clear and
> > unambiguous. For beginners, it maybe more easily explicable? 
> 
> I still don't get the necessity of this change. it is only for making
> code clear from your point for view, right?
> 
> This code has been reviewed for many years, I don't know why you think
> it is ambiguous. it is clear for me at lease. and I will complain that
> you add a new global variable in this change.
> 
> > > 
> > > b) This patchset break the original flow. device_group give you a
> > > software chance for initializing, then you move pagetable allocating
> > > code into it. But it isn't device_group job.
> > > 
> > 
> > As is shown above diagram, mtk_iommu_pgtable includes iommu_group and
> > iommu_domain,so we need to allocate mtk_iommu_pgtable and initialize it
> > in device_group firstly,and then execute the original flow, it only
> > changes place for creating mtk_iommu_pgtable and don't break original
> > device_group flow.
> 
> I understand you have to do this change after you adjust the structure.
> I mean that it may be not proper since allocating pagetable should not
> be done in device_group logically. From here, Could we get this change
> looks not good?.
> 
 gentle ping ...

> > > I can not decide if your flow is right. But if you only want to add
> > > support multi-domain, I guess you could extend the current "m4u_group"
> > > to a array "m4u_group[N]". It may be more simple. To make mt6779
> > > progress easily, I suggest you can use this way to support multi-domain
> > > firstly. Then you could send this new mtk_iommu_pgtable patchset for the
> > > code "more explicit" if you insist.
> 
> Could you help try this way if it could meet your requirement? Then
> let's compare which one is better.
> 
> 
> BTW, your patches(including v2) cause hangup as below since
> "data->m4u_dom" was uninitialized.
> 
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000010
> ...
> pc : mtk_iommu_tlb_flush_page_nosync+0x38/0xb8
> lr : __arm_v7s_unmap+0x174/0x598
> ...
> Call trace:
>  mtk_iommu_tlb_flush_page_nosync+0x38/0xb8
>  __arm_v7s_unmap+0x174/0x598
>  arm_v7s_unmap+0x30/0x48
>  mtk_iommu_unmap+0x20/0x28
>  __iommu_unmap+0xa4/0xf8
>  iommu_unmap+0x44/0x90
> 
yes, you are right. I will modify it in next version, thanks


> > > 
> > > > The diagram is as below:
> > > > 
> > > > 	mtk_iommu_data1(MM)       mtk_iommu_data2(APU)
> > > > 		|			   |
> > > > 		|			   |
> > > > 		------mtk_iommu_pgtable-----
> > > > 
> > > > We need to create global mtk_iommu_pgtable to include all the iova
> > > > regions firstly and special iova regions by divided based on it,
> > > > so the information of pgtable needs to be created in device_group.
> > > > 
> > > > Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> > > > ---
> > > >  drivers/iommu/mtk_iommu.c | 84 +++++++++++++++++++++++++++++++++++++++
> > > >  drivers/iommu/mtk_iommu.h |  1 +
> > > >  2 files changed, 85 insertions(+)
> > > > 
> > > > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > > > index f2847e661137..fcbde6b0f58d 100644
> > > > --- a/drivers/iommu/mtk_iommu.c
> > > > +++ b/drivers/iommu/mtk_iommu.c
> > > > @@ -123,6 +123,12 @@ struct mtk_iommu_domain {
> > > >  	struct iommu_domain		domain;
> > > >  };
> > > >  
> > > > +struct mtk_iommu_pgtable {
> > > > +	struct io_pgtable_cfg	cfg;
> > > > +	struct io_pgtable_ops	*iop;
> > > > +};
> > > > +
> > > > +static struct mtk_iommu_pgtable *share_pgtable;
> > > >  static const struct iommu_ops mtk_iommu_ops;
> > > >  
> > > >  /*
> > > > @@ -170,6 +176,11 @@ static struct mtk_iommu_data *mtk_iommu_get_m4u_data(void)
> > > >  	return NULL;
> > > >  }
> > > >  
> > > > +static struct mtk_iommu_pgtable *mtk_iommu_get_pgtable(void)
> > > > +{
> > > > +	return share_pgtable;
> > > > +}
> > > > +
> > > >  static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
> > > >  {
> > > >  	return container_of(dom, struct mtk_iommu_domain, domain);
> > > > @@ -322,6 +333,13 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
> > > >  {
> > > >  	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
> > > >  
> > > > +	if (data->pgtable) {
> > > > +		dom->cfg = data->pgtable->cfg;
> > > > +		dom->iop = data->pgtable->iop;
> > > > +		dom->domain.pgsize_bitmap = data->pgtable->cfg.pgsize_bitmap;
> > > > +		return 0;
> > > > +	}
> > > > +
> > > >  	dom->cfg = (struct io_pgtable_cfg) {
> > > >  		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
> > > >  			IO_PGTABLE_QUIRK_NO_PERMS |
> > > > @@ -345,6 +363,61 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static struct mtk_iommu_pgtable *create_pgtable(struct mtk_iommu_data *data)
> > > > +{
> > > > +	struct mtk_iommu_pgtable *pgtable;
> > > > +
> > > > +	pgtable = kzalloc(sizeof(*pgtable), GFP_KERNEL);
> > > > +	if (!pgtable)
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +
> > > > +	pgtable->cfg = (struct io_pgtable_cfg) {
> > > > +		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
> > > > +			IO_PGTABLE_QUIRK_NO_PERMS |
> > > > +			IO_PGTABLE_QUIRK_TLBI_ON_MAP |
> > > > +			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
> > > > +		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
> > > > +		.ias = 32,
> > > > +		.oas = 34,
> > > > +		.tlb = &mtk_iommu_flush_ops,
> > > > +		.iommu_dev = data->dev,
> > > > +	};
> > > > +
> > > > +	pgtable->iop = alloc_io_pgtable_ops(ARM_V7S, &pgtable->cfg, data);
> > > > +	if (!pgtable->iop) {
> > > > +		dev_err(data->dev, "Failed to alloc io pgtable\n");
> > > > +		return ERR_PTR(-EINVAL);
> > > > +	}
> > > > +
> > > > +	dev_info(data->dev, "%s create pgtable done\n", __func__);
> > > > +
> > > > +	return pgtable;
> > > > +}
> > > > +
> > > > +static int mtk_iommu_attach_pgtable(struct mtk_iommu_data *data,
> > > > +				    struct device *dev)
> > > > +{
> > > > +	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
> > > > +
> > > > +	/* create share pgtable */
> > > > +	if (!pgtable) {
> > > > +		pgtable = create_pgtable(data);
> > > > +		if (IS_ERR(pgtable)) {
> > > > +			dev_err(data->dev, "Failed to create pgtable\n");
> > > > +			return -ENOMEM;
> > > > +		}
> > > > +
> > > > +		share_pgtable = pgtable;
> > > > +	}
> > > > +
> > > > +	/* binding to pgtable */
> > > > +	data->pgtable = pgtable;
> > > > +
> > > > +	dev_info(data->dev, "m4u%d attach_pgtable done!\n", data->m4u_id);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
> > > >  {
> > > >  	struct mtk_iommu_domain *dom;
> > > > @@ -508,10 +581,21 @@ static void mtk_iommu_remove_device(struct device *dev)
> > > >  static struct iommu_group *mtk_iommu_device_group(struct device *dev)
> > > >  {
> > > >  	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
> > > > +	struct mtk_iommu_pgtable *pgtable;
> > > > +	int ret = 0;
> > > >  
> > > >  	if (!data)
> > > >  		return ERR_PTR(-ENODEV);
> > > >  
> > > > +	pgtable = data->pgtable;
> > > > +	if (!pgtable) {
> > > > +		ret = mtk_iommu_attach_pgtable(data, dev);
> > > > +		if (ret) {
> > > > +			dev_err(data->dev, "Failed to device_group\n");
> > > > +			return NULL;
> > > > +		}
> > > > +	}
> > > > +
> > > >  	/* All the client devices are in the same m4u iommu-group */
> > > >  	if (!data->m4u_group) {
> > > >  		data->m4u_group = iommu_group_alloc();
> > > > diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> > > > index 132dc765a40b..dd5f19f78b62 100644
> > > > --- a/drivers/iommu/mtk_iommu.h
> > > > +++ b/drivers/iommu/mtk_iommu.h
> > > > @@ -61,6 +61,7 @@ struct mtk_iommu_data {
> > > >  	struct clk			*bclk;
> > > >  	phys_addr_t			protect_base; /* protect memory base */
> > > >  	struct mtk_iommu_suspend_reg	reg;
> > > > +	struct mtk_iommu_pgtable	*pgtable;
> > > >  	struct mtk_iommu_domain		*m4u_dom;
> > > >  	struct iommu_group		*m4u_group;
> > > >  	bool                            enable_4GB;
> > > 
> > > 
> > 
> > 
> 
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
