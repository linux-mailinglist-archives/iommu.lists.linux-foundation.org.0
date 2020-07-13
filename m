Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C720821D017
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 08:55:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F76D875FB;
	Mon, 13 Jul 2020 06:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqv_ayu9vM_7; Mon, 13 Jul 2020 06:55:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D108687609;
	Mon, 13 Jul 2020 06:55:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0BCEC0894;
	Mon, 13 Jul 2020 06:55:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 958C5C0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 06:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6B37E262BC
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 06:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4WOAz8hzHgY for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 06:55:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by silver.osuosl.org (Postfix) with ESMTP id EC56D24B78
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 06:55:53 +0000 (UTC)
X-UUID: 01f36fb1f18047b4bc30c942acc95743-20200713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3fTv0ya9+6e1JsaEzRkR7OFnJZ1h0+BVwHRIgcNxfp8=; 
 b=ZUl5wrov0eQwif2lntsupXa+ZHmNIi0oaiz62ks6llG27X5NlH50QLIKBDrRSw7Lm+zOUJRvZp7GUB2nx8XSuwD1cTC84Xc1CVI1b2darBNBtLLikV5HG7MmxifcLOb8slI1tWli759VdoVETn4flVOU5v2Ur/1WoqaTv4uGm28=;
X-UUID: 01f36fb1f18047b4bc30c942acc95743-20200713
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 602200238; Mon, 13 Jul 2020 14:55:47 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 13 Jul 2020 14:55:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 14:55:44 +0800
Message-ID: <1594623299.16172.29.camel@mhfsdcap03>
Subject: Re: [PATCH 04/21] dt-binding: mediatek: Add binding for mt8192
 IOMMU and SMI
From: Yong Wu <yong.wu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 13 Jul 2020 14:54:59 +0800
In-Reply-To: <CANdKZ0cGNy7ckzD_NAOV613o62WHdYazRRM-J8jY2-4mx_sNDA@mail.gmail.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-5-yong.wu@mediatek.com>
 <CANdKZ0cGNy7ckzD_NAOV613o62WHdYazRRM-J8jY2-4mx_sNDA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 533535A6522B7AB06F6A5C489515BEA97381B42424A0490A05D20470D84F27B32000:8
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

On Mon, 2020-07-13 at 13:36 +0800, Pi-Hsun Shih wrote:
> On Sat, Jul 11, 2020 at 2:50 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > This patch adds decriptions for mt8192 IOMMU and SMI.
> >
> > mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> > table format. The M4U-SMI HW diagram is as below:
> >
> >                           EMI
> >                            |
> >                           M4U
> >                            |
> >                       ------------
> >                        SMI Common
> >                       ------------
> >                            |
> >   +-------+------+------+----------------------+-------+
> >   |       |      |      |       ......         |       |
> >   |       |      |      |                      |       |
> > larb0   larb1  larb2  larb4     ......      larb19   larb20
> > disp0   disp1   mdp    vdec                   IPE      IPE
> >
> > All the connections are HW fixed, SW can NOT adjust it.
> >
> > mt8192 M4U support 0~16GB iova range. we preassign different engines
> > into different iova ranges:
> >
> > domain-id  module     iova-range                  larbs
> >    0       disp        0 ~ 4G                      larb0/1
> >    1       vcodec      4G ~ 8G                     larb4/5/7
> >    2       cam/mdp     8G ~ 12G             larb2/9/11/13/14/16/17/18/19/20
> >    3       CCU0    0x4000_0000 ~ 0x43ff_ffff     larb13: port 9/10
> >    4       CCU1    0x4400_0000 ~ 0x47ff_ffff     larb14: port 4/5
> >
> > The iova range for CCU0/1(camera control unit) is HW requirement.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  .../bindings/iommu/mediatek,iommu.txt         |   8 +-
> >  .../mediatek,smi-common.txt                   |   5 +-
> >  .../memory-controllers/mediatek,smi-larb.txt  |   3 +-
> >  include/dt-bindings/memory/mt8192-larb-port.h | 237 ++++++++++++++++++
> >  4 files changed, 247 insertions(+), 6 deletions(-)
> >  create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
> > ...
> > diff --git a/include/dt-bindings/memory/mt8192-larb-port.h b/include/dt-bindings/memory/mt8192-larb-port.h
> > new file mode 100644
> > index 000000000000..fbe0d5d50f1c
> > --- /dev/null
> > +++ b/include/dt-bindings/memory/mt8192-larb-port.h
> > ...
> > +/* larb7 */
> > +#define M4U_PORT_L7_VENC_RCPU                  MTK_M4U_DOM_ID(1, 7, 0)
> > +#define M4U_PORT_L7_VENC_REC                   MTK_M4U_DOM_ID(1, 7, 1)
> > +#define M4U_PORT_L7_VENC_BSDMA                 MTK_M4U_DOM_ID(1, 7, 2)
> > +#define M4U_PORT_L7_VENC_SV_COMV               MTK_M4U_DOM_ID(1, 7, 3)
> > +#define M4U_PORT_L7_VENC_RD_COMV               MTK_M4U_DOM_ID(1, 7, 4)
> > +#define M4U_PORT_L7_VENC_CUR_LUMA              MTK_M4U_DOM_ID(1, 7, 5)
> > +#define M4U_PORT_L7_VENC_CUR_CHROMA            MTK_M4U_DOM_ID(1, 7, 6)
> > +#define M4U_PORT_L7_VENC_REF_LUMA              MTK_M4U_DOM_ID(1, 7, 7)
> > +#define M4U_PORT_L7_VENC_REF_CHROMA            MTK_M4U_DOM_ID(1, 7, 8)
> > +#define M4U_PORT_L7_JPGENC_Y_RDMA              MTK_M4U_DOM_ID(1, 7, 9)
> > +#define M4U_PORT_L7_JPGENC_Q_RDMA              MTK_M4U_DOM_ID(1, 7, 10)
> > +#define M4U_PORT_L7_JPGENC_C_TABLE             MTK_M4U_DOM_ID(1, 7, 11)
> > +#define M4U_PORT_L7_JPGENC_BSDMA               MTK_M4U_DOM_ID(1, 7, 12)
> > +#define M4U_PORT_L7_VENC_SUB_R_LUMA            MTK_M4U_DOM_ID(1, 7, 13)
> > +#define M4U_PORT_L7_VENC_SUB_W_LUMA            MTK_M4U_DOM_ID(1, 7, 14)
> > +
> 
> Small nit, /* larb8: null */ is missing here.

oh. Yes. Thanks.
I will add it in next version.

> 
> > +/* larb9 */
> > +#define M4U_PORT_L9_IMG_IMGI_D1                        MTK_M4U_DOM_ID(2, 9, 0)
> > +#define M4U_PORT_L9_IMG_IMGBI_D1               MTK_M4U_DOM_ID(2, 9, 1)
> > +#define M4U_PORT_L9_IMG_DMGI_D1                        MTK_M4U_DOM_ID(2, 9, 2)
> > +#define M4U_PORT_L9_IMG_DEPI_D1                        MTK_M4U_DOM_ID(2, 9, 3)
> > +#define M4U_PORT_L9_IMG_ICE_D1                 MTK_M4U_DOM_ID(2, 9, 4)
> > +#define M4U_PORT_L9_IMG_SMTI_D1                        MTK_M4U_DOM_ID(2, 9, 5)
> > +#define M4U_PORT_L9_IMG_SMTO_D2                        MTK_M4U_DOM_ID(2, 9, 6)
> > +#define M4U_PORT_L9_IMG_SMTO_D1                        MTK_M4U_DOM_ID(2, 9, 7)
> > +#define M4U_PORT_L9_IMG_CRZO_D1                        MTK_M4U_DOM_ID(2, 9, 8)
> > +#define M4U_PORT_L9_IMG_IMG3O_D1               MTK_M4U_DOM_ID(2, 9, 9)
> > +#define M4U_PORT_L9_IMG_VIPI_D1                        MTK_M4U_DOM_ID(2, 9, 10)
> > +#define M4U_PORT_L9_IMG_SMTI_D5                        MTK_M4U_DOM_ID(2, 9, 11)
> > +#define M4U_PORT_L9_IMG_TIMGO_D1               MTK_M4U_DOM_ID(2, 9, 12)
> > +#define M4U_PORT_L9_IMG_UFBC_W0                        MTK_M4U_DOM_ID(2, 9, 13)
> > +#define M4U_PORT_L9_IMG_UFBC_R0                        MTK_M4U_DOM_ID(2, 9, 14)
> > +
> > ...

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
