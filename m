Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0925597F5
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 12:36:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64FF440201;
	Fri, 24 Jun 2022 10:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64FF440201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkTBlfAzvynr; Fri, 24 Jun 2022 10:36:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 380A4401A2;
	Fri, 24 Jun 2022 10:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 380A4401A2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EF5AC002D;
	Fri, 24 Jun 2022 10:36:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1E53C002D;
 Fri, 24 Jun 2022 10:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DD8E84906;
 Fri, 24 Jun 2022 10:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD8E84906
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9lJn6GxL8l8o; Fri, 24 Jun 2022 10:36:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05175848C9
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05175848C9;
 Fri, 24 Jun 2022 10:36:01 +0000 (UTC)
X-UUID: df7b175fa89346cd93722cc325d9a2de-20220624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:ae2831ad-169e-48d6-a70a-39fa0ed6540b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:b14ad71, CLOUDID:8ecdf52d-1756-4fa3-be7f-474a6e4be921,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: df7b175fa89346cd93722cc325d9a2de-20220624
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1111625506; Fri, 24 Jun 2022 18:35:53 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 24 Jun 2022 18:35:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 24 Jun 2022 18:35:50 +0800
Message-ID: <19cfb1b85a347c70c6b0937bbbca4a176a724454.camel@mediatek.com>
Subject: Re: [PATCH v3 1/5] iommu: Return -EMEDIUMTYPE for incompatible
 domain and device/group
To: "Tian, Kevin" <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>, 
 Baolu Lu <baolu.lu@linux.intel.com>
Date: Fri, 24 Jun 2022 18:35:49 +0800
In-Reply-To: <BN9PR11MB527629DEF740C909A7B7BEB38CB49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220623200029.26007-1-nicolinc@nvidia.com>
 <20220623200029.26007-2-nicolinc@nvidia.com>
 <270eec00-8aee-2288-4069-d604e6da2925@linux.intel.com>
 <YrUk8IINqDEZLfIa@Asurada-Nvidia>
 <8a5e9c81ab1487154828af3ca21e62e39bcce18c.camel@mediatek.com>
 <BN9PR11MB527629DEF740C909A7B7BEB38CB49@BN9PR11MB5276.namprd11.prod.outlook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: "marcan@marcan.st" <marcan@marcan.st>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
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
From: Yong Wu via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, 2022-06-24 at 06:16 +0000, Tian, Kevin wrote:
> > From: Yong Wu
> > Sent: Friday, June 24, 2022 1:39 PM
> > 
> > On Thu, 2022-06-23 at 19:44 -0700, Nicolin Chen wrote:
> > > On Fri, Jun 24, 2022 at 09:35:49AM +0800, Baolu Lu wrote:
> > > > External email: Use caution opening links or attachments
> > > > 
> > > > 
> > > > On 2022/6/24 04:00, Nicolin Chen wrote:
> > > > > diff --git a/drivers/iommu/mtk_iommu_v1.c
> > > > > b/drivers/iommu/mtk_iommu_v1.c
> > > > > index e1cb51b9866c..5386d889429d 100644
> > > > > --- a/drivers/iommu/mtk_iommu_v1.c
> > > > > +++ b/drivers/iommu/mtk_iommu_v1.c
> > > > > @@ -304,7 +304,7 @@ static int
> > > > > mtk_iommu_v1_attach_device(struct
> > > > > iommu_domain *domain, struct device
> > > > >       /* Only allow the domain created internally. */
> > > > >       mtk_mapping = data->mapping;
> > > > >       if (mtk_mapping->domain != domain)
> > > > > -             return 0;
> > > > > +             return -EMEDIUMTYPE;
> > > > > 
> > > > >       if (!data->m4u_dom) {
> > > > >               data->m4u_dom = dom;
> > > > 
> > > > This change looks odd. It turns the return value from success
> > > > to
> > > > failure. Is it a bug? If so, it should go through a separated
> > > > fix
> > > > patch.
> > 
> > Thanks for the review:)
> > 
> > > 
> > > Makes sense.
> > > 
> > > I read the commit log of the original change:
> > > 
> > 
> > https://lore.kernel.org/r/1589530123-30240-1-git-send-email-
> > yong.wu@mediatek.com
> > > 
> > > It doesn't seem to allow devices to get attached to different
> > > domains other than the shared mapping->domain, created in the
> > > in the mtk_iommu_probe_device(). So it looks like returning 0
> > > is intentional. Though I am still very confused by this return
> > > value here, I doubt it has ever been used in a VFIO context.
> > 
> > It's not used in VFIO context. "return 0" just satisfy the iommu
> > framework to go ahead. and yes, here we only allow the shared
> > "mapping-
> > > domain" (All the devices share a domain created internally).
> > 
> > thus I think we should still keep "return 0" here.
> > 
> 
> What prevent this driver from being used in VFIO context?

Nothing prevent this. Just I didn't test. mtk_iommu_v1.c only is used
in mt2701 and there is no VFIO scenario. I'm not sure if it supports
VFIO. (mtk_iommu.c support VFIO.)

> and why would we want to go ahead when an obvious error occurs
> i.e. when a device is attached to an unexpected domain?

The iommu flow in this file always is a bit odd as we need share iommu
domain in ARM32. As I tested before in the above link, "The iommu
framework will create a iommu domain for each a device.", therefore we
have to *workaround* in this file.

And this was expected to be fixed by:

https://lore.kernel.org/linux-iommu/cover.1597931875.git.robin.murphy@arm.com/

sorry, I don't know its current status.

Thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
