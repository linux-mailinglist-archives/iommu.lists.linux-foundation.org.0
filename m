Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3900B2E2654
	for <lists.iommu@lfdr.de>; Thu, 24 Dec 2020 12:27:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC0DE86204;
	Thu, 24 Dec 2020 11:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIDDd-tkjptx; Thu, 24 Dec 2020 11:27:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A03CB86200;
	Thu, 24 Dec 2020 11:27:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83483C0893;
	Thu, 24 Dec 2020 11:27:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1209C0893
 for <iommu@lists.linux-foundation.org>; Thu, 24 Dec 2020 11:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D9F1E203AB
 for <iommu@lists.linux-foundation.org>; Thu, 24 Dec 2020 11:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOs+5VkzWevj for <iommu@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 11:27:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by silver.osuosl.org (Postfix) with ESMTP id 78C7820335
 for <iommu@lists.linux-foundation.org>; Thu, 24 Dec 2020 11:27:23 +0000 (UTC)
X-UUID: 6534fe546ee846e8b3136e2f8c9ec414-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x+vmTzBVFEHCrm2Yqn8M1lXv0V4BMO6yO0ekQRSMMRw=; 
 b=RTqhyRuN/AFFDnpBD4IK49T4eCUUo4z6DJ7US2CGcEuMLnTla9A6u/wZMobH6b8ZRGWc6ru/JTMNTxt9qe/acwIBjVfeOIGHV7lGTNMR2tKT/FAmw/wgtFp7Y6v+8wi8hO964L+Bs5unBWauQY3cYk84s28v/vrCjKtLMRoNgME=;
X-UUID: 6534fe546ee846e8b3136e2f8c9ec414-20201224
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 172344441; Thu, 24 Dec 2020 19:26:54 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Dec 2020 19:26:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 19:26:51 +0800
Message-ID: <1608809212.26323.258.camel@mhfsdcap03>
Subject: Re: [PATCH v5 04/27] dt-bindings: memory: mediatek: Add domain
 definition
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 24 Dec 2020 19:26:52 +0800
In-Reply-To: <X+L8qpO+T7+U2s5r@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-5-yong.wu@mediatek.com>
 <X+L8qpO+T7+U2s5r@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8C474D3B2374B83E77D4A8D2415ADFF8FAC79803632363B2F7FCFDD373A9DCFD2000:8
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
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

On Wed, 2020-12-23 at 17:15 +0900, Tomasz Figa wrote:
> Hi Yong,
> 
> On Wed, Dec 09, 2020 at 04:00:39PM +0800, Yong Wu wrote:
> > In the latest SoC, there are several HW IP require a sepecial iova
> > range, mainly CCU and VPU has this requirement. Take CCU as a example,
> > CCU require its iova locate in the range(0x4000_0000 ~ 0x43ff_ffff).
> 
> Is this really a domain? Does the address range come from the design of
> the IOMMU?

It is not a really a domain. The address range comes from CCU HW
requirement. That HW can only access this iova range. thus I create a
special iommu domain for it.

> 
> Best regards,
> Tomasz
> 
> > 
> > In this patch we add a domain definition for the special port. In the
> > example of CCU, If we preassign CCU port in domain1, then iommu driver
> > will prepare a independent iommu domain of the special iova range for it,
> > then the iova got from dma_alloc_attrs(ccu-dev) will locate in its special
> > range.
> > 
> > This is a preparing patch for multi-domain support.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  include/dt-bindings/memory/mtk-smi-larb-port.h | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > index 7d64103209af..2d4c973c174f 100644
> > --- a/include/dt-bindings/memory/mtk-smi-larb-port.h
> > +++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > @@ -7,9 +7,16 @@
> >  #define __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
> >  
> >  #define MTK_LARB_NR_MAX			32
> > +#define MTK_M4U_DOM_NR_MAX		8
> > +
> > +#define MTK_M4U_DOM_ID(domid, larb, port)	\
> > +	(((domid) & 0x7) << 16 | (((larb) & 0x1f) << 5) | ((port) & 0x1f))
> > +
> > +/* The default dom id is 0. */
> > +#define MTK_M4U_ID(larb, port)		MTK_M4U_DOM_ID(0, larb, port)
> >  
> > -#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
> >  #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
> >  #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
> > +#define MTK_M4U_TO_DOM(id)		(((id) >> 16) & 0x7)
> >  
> >  #endif
> > -- 
> > 2.18.0
> > 
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
