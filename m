Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4819321ECF8
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 11:34:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 003D2883D7;
	Tue, 14 Jul 2020 09:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9f4mEZAfcPBL; Tue, 14 Jul 2020 09:34:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 92F8D88384;
	Tue, 14 Jul 2020 09:34:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BCD5C0733;
	Tue, 14 Jul 2020 09:34:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE682C0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 09:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BC969883D7
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 09:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0q7hDaHQcZL for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 09:34:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD00888384
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 09:34:01 +0000 (UTC)
X-UUID: 294ffe915ddd4f2ebdd084d2a09cb58b-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=g0vfCKfsVImSYs7pBa71fJvZ3L9cSxC+jFd3c5Ar0OA=; 
 b=qga6wQmnl6LFOkFK300s5TBJueZg6wKqfCxqm5ApKl/ZRsDH9DFKNGfON9o0N811mIV5nbnXtOhLq1skUUp1gl8KFO7yK+XzxmK+qHBqDCq+Tf2eYe/t2m2HpEiDShWesjx0GfIE2m3D5iou3wiEwCOHQkXt+aM8yocisuLvyqU=;
X-UUID: 294ffe915ddd4f2ebdd084d2a09cb58b-20200714
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1789059505; Tue, 14 Jul 2020 17:33:57 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 14 Jul 2020 17:33:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 17:33:54 +0800
Message-ID: <1594719186.16172.35.camel@mhfsdcap03>
Subject: Re: [PATCH 11/21] iommu/mediatek: Add power-domain operation
From: Yong Wu <yong.wu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Tue, 14 Jul 2020 17:33:06 +0800
In-Reply-To: <CANdKZ0e3=AeCxpSHVk7daUE01L7AgJYmZ7jeOQDT169SaowL-g@mail.gmail.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-12-yong.wu@mediatek.com>
 <CANdKZ0e3=AeCxpSHVk7daUE01L7AgJYmZ7jeOQDT169SaowL-g@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4A868CC5672C9E09033785D03A34B39C2AB230B1DC2A9B4BD748D338AF6B73A92000:8
X-MTK: N
Cc: Youlin Pei =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?=
 <youlin.pei@mediatek.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

On Mon, 2020-07-13 at 15:03 +0800, Pi-Hsun Shih wrote:
> On Sat, Jul 11, 2020 at 2:51 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > In the previous SoC, the M4U HW is in the EMI power domain which is
> > always on. the latest M4U is in the display power domain which may be
> > turned on/off, thus we have to add pm_runtime interface for it.
> >
> > we should enable its power before M4U hw initial. and disable it after HW
> > initialize.
> >
> > When the engine work, the engine always enable the power and clocks for
> > smi-larb/smi-common, then the M4U's power will always be powered on
> > automatically via the device link with smi-common.
> >
> > Note: we don't enable the M4U power in iommu_map/unmap for tlb flush.
> > If its power already is on, of course it is ok. if the power is off,
> > the main tlb will be reset while M4U power on, thus the tlb flush while
> > m4u power off is unnecessary, just skip it.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 54 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 47 insertions(+), 7 deletions(-)
> > ...
> >         for_each_m4u(data) {
> > +               /* skip tlb flush when pm is not active */
> > +               if (pm_runtime_enabled(data->dev) &&
> > +                   !pm_runtime_active(data->dev))
> > +                       continue;
> > +
> 
> pm_runtime_active(dev) == false implies dev->power.disable_depth == 0,
> which implies pm_runtime_enabled(dev) == true, so the
> pm_runtime_enabled(data->dev) can be omitted here.

Yes. Thanks.
Will fix in next version.

> 
> >                 spin_lock_irqsave(&data->tlb_lock, flags);
> >                 writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> >                                data->base + data->plat_data->inv_sel_reg);
> > ...

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
