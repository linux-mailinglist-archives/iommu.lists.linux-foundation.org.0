Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3562721CEFF
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 07:49:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B479888153;
	Mon, 13 Jul 2020 05:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkC4UlOLIykG; Mon, 13 Jul 2020 05:49:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E4E248815C;
	Mon, 13 Jul 2020 05:49:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9E22C0733;
	Mon, 13 Jul 2020 05:49:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59607C0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 05:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3F2AC88132
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 05:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MJ1i73a7Mm9 for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 05:49:29 +0000 (UTC)
X-Greylist: delayed 00:05:10 by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6C71E8811F
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 05:49:29 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id y10so14742631eje.1
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jul 2020 22:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rp7+bh2mU6TpEEtWpOr+87rCm6MPnrvLOWdtUzMHKQ8=;
 b=CRSdQDBtxmD9eFlVT0K5jcruX9Eb95imbaOtpnYb7gl8aEBpXbsxoBVC4abKx/J+Ld
 DFDhaOOfCqUgceSh2DeJvNwSBdWGz4Enfbn7+tsEQatlol7t82YFPryAObOhHvlVQ1A+
 fkQzDtU1fT+c4rqwAN9nfZyl6z1t9Vi91nFGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rp7+bh2mU6TpEEtWpOr+87rCm6MPnrvLOWdtUzMHKQ8=;
 b=Tbkr3bCW2aW0HhMxnmwTXnEsvT4JUTNyrW/b1AKBe9tnXywg0gT+TjlFOKvymOBpaI
 W0aDQ7lGSC05bs6upa75gfwI44BUEdEEYaoOiMCRVXtCWiNVsD9CySgy7hHPFsDf+eLd
 eySnntIR88PN9NIH/wFgLgP/yP0Ivhw2QkItBStndaDqxJolZbXGmRmssJZVRydU49kR
 +wG8BT6YZKM/XBMN5aTQk7hcPA1ye+PAHvyiD3DfwcHrmfZz4TfE9R5hnU2qX45Bjjwf
 irElsK7/Bgw6iD0YU1y/tLbPnC/WHYqOiVKDPzS7+EKeJedcr7SyS/xe6T6/JuPe+/V3
 vgZA==
X-Gm-Message-State: AOAM532MdAVZC3Jm+4Mz4sIkbMvBNSoRwXWMGbBiImJz3DoFaNc8DL8e
 9YzEQAa2uPf/+WslOryDNLHihc6uia1EmorydUiSXFx2Puc=
X-Google-Smtp-Source: ABdhPJxKhhkxwRWVmaaKVxOyh3qvejCjDIr3yNQRWD870hkkTeHHZbJtXmbbx2iPuNB7nZjoO1GN3ll0CJpetV9WDDo=
X-Received: by 2002:a17:906:b45:: with SMTP id
 v5mr69591620ejg.464.1594619058124; 
 Sun, 12 Jul 2020 22:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-2-yong.wu@mediatek.com>
 <9e21288c-07da-88b0-2dbb-bd9a2a4d529b@gmail.com>
In-Reply-To: <9e21288c-07da-88b0-2dbb-bd9a2a4d529b@gmail.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 13 Jul 2020 13:43:42 +0800
Message-ID: <CANdKZ0dwsaP=s8AgRbDx2_0y4JmPnF-X0Rb=4vor2MWCYWfGKw@mail.gmail.com>
Subject: Re: [PATCH 01/21] dt-binding: memory: mediatek: Add a common
 larb-port header file
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>
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

On Mon, Jul 13, 2020 at 2:06 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 11/07/2020 08:48, Yong Wu wrote:
> > Put all the macros about smi larb/port togethers, this is a preparing
> > patch for extending LARB_NR and adding new dom-id support.
> >
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   include/dt-bindings/memory/mt2712-larb-port.h  |  2 +-
> >   include/dt-bindings/memory/mt6779-larb-port.h  |  2 +-
> >   include/dt-bindings/memory/mt8173-larb-port.h  |  2 +-
> >   include/dt-bindings/memory/mt8183-larb-port.h  |  2 +-
> >   include/dt-bindings/memory/mtk-smi-larb-port.h | 15 +++++++++++++++
> >   5 files changed, 19 insertions(+), 4 deletions(-)
> >   create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h
> >
> > ...
> > diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > new file mode 100644
> > index 000000000000..2ec7fe5ce4e9
> > --- /dev/null
> > +++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> > + * Author: Yong Wu <yong.wu@mediatek.com>
> > + */
> > +#ifndef __DTS_MTK_IOMMU_PORT_H_
> > +#define __DTS_MTK_IOMMU_PORT_H_
> > +
> > +#define MTK_LARB_NR_MAX                      16
>
> include/soc/mediatek/smi.h has the very same define.
> Should smi.h include this file?
>
> Regards,
> Matthias
>

Looks like this is being addressed in patch 5 in this series ([05/21]
iommu/mediatek: Use the common mtk-smi-larb-port.h)
That said, should that patch be merged into this one?



> > +
> > +#define MTK_M4U_ID(larb, port)               (((larb) << 5) | (port))
> > +#define MTK_M4U_TO_LARB(id)          (((id) >> 5) & 0xf)
> > +#define MTK_M4U_TO_PORT(id)          ((id) & 0x1f)
> > +
> > +#endif
> >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
