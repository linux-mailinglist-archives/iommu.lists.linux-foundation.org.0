Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F852305730
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 10:45:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D9A24214D2;
	Wed, 27 Jan 2021 09:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IoyKxqniroCx; Wed, 27 Jan 2021 09:45:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2D33521080;
	Wed, 27 Jan 2021 09:45:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 201EEC013A;
	Wed, 27 Jan 2021 09:45:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E21AC013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 09:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8C3A886DF1
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 09:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wS5fMa6+u+OQ for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 09:45:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by hemlock.osuosl.org (Postfix) with ESMTP id AD5D686DDB
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 09:45:08 +0000 (UTC)
X-UUID: 95a941a449a945569533e47030366fa5-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OBxOSBPDbNRIc9EIOyaVw0/Acj/J50gJQln+TyAJ4w4=; 
 b=fKTey2UsD9ZWtXMjndTDzR8flYyWadWqD3c0di7De3krd96p/88RpeIDGsiigtf1d7pZrWTZGrqqZc4zwcJMXo36VHJTaZYbMLwlt+xy3lmI28KLMntvuUG8N4iZUXh/Pmi2FoqvhFacYiYdXTKM00S3hWiLDYCUwMiJeOk2PbU=;
X-UUID: 95a941a449a945569533e47030366fa5-20210127
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 969588445; Wed, 27 Jan 2021 17:39:19 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Jan 2021 17:39:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Jan 2021 17:39:16 +0800
Message-ID: <1611740356.5302.14.camel@mhfsdcap03>
Subject: Re: [PATCH v6 07/33] iommu: Avoid reallocate default domain for a
 group
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>
Date: Wed, 27 Jan 2021 17:39:16 +0800
In-Reply-To: <20210126222305.GB30460@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-8-yong.wu@mediatek.com>
 <20210126222305.GB30460@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F36F529AFC96016349EB7092D40E98B771F9B02D82265433FE286BC98F51FFAC2000:8
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Tue, 2021-01-26 at 22:23 +0000, Will Deacon wrote:
> On Mon, Jan 11, 2021 at 07:18:48PM +0800, Yong Wu wrote:
> > If group->default_domain exists, avoid reallocate it.
> > 
> > In some iommu drivers, there may be several devices share a group. Avoid
> > realloc the default domain for this case.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/iommu.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 3d099a31ddca..f4b87e6abe80 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -266,7 +266,8 @@ int iommu_probe_device(struct device *dev)
> >  	 * support default domains, so the return value is not yet
> >  	 * checked.
> >  	 */
> > -	iommu_alloc_default_domain(group, dev);
> > +	if (!group->default_domain)
> > +		iommu_alloc_default_domain(group, dev);
> 
> I don't really get what this achieves, since iommu_alloc_default_domain()
> looks like this:
> 
> static int iommu_alloc_default_domain(struct iommu_group *group,
> 				      struct device *dev)
> {
> 	unsigned int type;
> 
> 	if (group->default_domain)
> 		return 0;
> 
> 	...
> 
> in which case, it should be fine?

oh. sorry, I overlooked this. the current code is enough.
I will remove this patch. and send the next version in this week.
Thanks very much.

> 
> Will

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
