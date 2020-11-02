Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E96DC2A25AD
	for <lists.iommu@lfdr.de>; Mon,  2 Nov 2020 08:53:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 89EF8867DE;
	Mon,  2 Nov 2020 07:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f0p6snrsvZHS; Mon,  2 Nov 2020 07:53:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB817867CE;
	Mon,  2 Nov 2020 07:53:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94DBDC0051;
	Mon,  2 Nov 2020 07:53:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF29AC0051
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 07:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D2FAA87397
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 07:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6BOskM9Nf8JP for <iommu@lists.linux-foundation.org>;
 Mon,  2 Nov 2020 07:53:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CB0A487394
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 07:53:40 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E15E21556
 for <iommu@lists.linux-foundation.org>; Mon,  2 Nov 2020 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604303620;
 bh=iXFXlIxzo6mEuRbhfEI2cZTIEJwsOtvvLLIzi+xj3k4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l2iXFvJ5TKiHGm2H2qhJ8UZhLfu+xl8wgP1683sivUlrippNMVG1tuFu3l+DOyNhk
 wACruFfQljRDZ2RQC2pgMo1x3MC4+4AaG9/rEPqSEBT5WqwH0X13fS3h9b3XrwBdpH
 QB8PXdcWoJ7NZXPCV3Fqs/T+UMfcgO2Qf5gXJt7s=
Received: by mail-ej1-f48.google.com with SMTP id p5so17609149ejj.2
 for <iommu@lists.linux-foundation.org>; Sun, 01 Nov 2020 23:53:40 -0800 (PST)
X-Gm-Message-State: AOAM531fBRHttNQ5KKib8DrFsm03oJqoHboKI7RmupsgROtTGYaLArhT
 gdvvxpU/qknDMiut0/70d4D2rfzQFyrX6/yh09U=
X-Google-Smtp-Source: ABdhPJwrevmNFDi1+ho8xYZZMC8Zs02UNBVWMPiQlQWPrCoMlPylk2aWDQx4j1s/36cKVA0piAyvfZef46tp+4IihZ4=
X-Received: by 2002:a17:907:d1e:: with SMTP id
 gn30mr1374045ejc.148.1604303618691; 
 Sun, 01 Nov 2020 23:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20201030091254.26382-1-yong.wu@mediatek.com>
 <20201030091254.26382-2-yong.wu@mediatek.com>
 <20201031113623.GA4019@kozik-lap> <1604295074.26323.107.camel@mhfsdcap03>
In-Reply-To: <1604295074.26323.107.camel@mhfsdcap03>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 2 Nov 2020 08:53:26 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfTmXuBOWgrmgCfQcqhXxoVjE=9T=m1weRS=H4hV0bYog@mail.gmail.com>
Message-ID: <CAJKOXPfTmXuBOWgrmgCfQcqhXxoVjE=9T=m1weRS=H4hV0bYog@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: memory: mediatek: Convert SMI to DT
To: Yong Wu <yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 2 Nov 2020 at 06:31, Yong Wu <yong.wu@mediatek.com> wrote:
>
> On Sat, 2020-10-31 at 12:36 +0100, Krzysztof Kozlowski wrote:
> > On Fri, Oct 30, 2020 at 05:12:52PM +0800, Yong Wu wrote:
> > > Convert MediaTek SMI to DT schema.
> > >
> > > CC: Fabien Parent <fparent@baylibre.com>
> > > CC: Ming-Fan Chen <ming-fan.chen@mediatek.com>
> > > CC: Matthias Brugger <matthias.bgg@gmail.com>
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >  .../mediatek,smi-common.txt                   |  50 -------
> > >  .../mediatek,smi-common.yaml                  | 140 ++++++++++++++++++
> > >  .../memory-controllers/mediatek,smi-larb.txt  |  50 -------
> > >  .../memory-controllers/mediatek,smi-larb.yaml | 129 ++++++++++++++++
> > >  4 files changed, 269 insertions(+), 100 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> >
> > +Cc Honghui Zhang,
>
> As comment [1], Honghui's address is not valid now. I will act for him.
>
> >
> > Your Ack is needed as you contributed descriptions to the bindings and
> > work is being relicensed to GPL-2.0-only OR BSD-2-Clause.
>
> "GPL-2.0-only OR BSD-2-Clause" is required when we run check-patch.
>
> If I still use "GPL-2.0-only", then the contributors' Ack/SoB is not
> needed, right?

That would be one solution but I was thinking to proceed with only
your agreement. You were the main contributor to these files. Honghui
added a few descriptions. Other developers added only compatibles.
Since we cannot reach Honghui, I would assume that your agreement
(Sign-off) is enough.

Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
