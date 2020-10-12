Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 770CD28BEB2
	for <lists.iommu@lfdr.de>; Mon, 12 Oct 2020 19:08:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D4EC5869AA;
	Mon, 12 Oct 2020 17:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3JXiB3ZGo3z; Mon, 12 Oct 2020 17:08:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 632DE8697D;
	Mon, 12 Oct 2020 17:08:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53DBFC0051;
	Mon, 12 Oct 2020 17:08:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24B6EC0051
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 17:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0CADE86963
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 17:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fU4ffyc9Y07V for <iommu@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 17:08:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 443458692C
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 17:08:25 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADEBC214D8
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 17:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602522504;
 bh=diu7jTvqirdea73U2Pivn25Z5fqp8dxACmIMHPhvbwQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l33ti6Wh+Yoy28eOWfBvJIGFVVsEGuoGcfMEc1rp3LXWY2i1AsPCJKFJ6JTa8n2Ej
 zXnu25cLJRfBDN2Hu9c0VAgD8B97+fz2FO6Sr1e/x+F5NBsYByZbFD/O5LeYIT97kb
 7C9jn70SgLa9QD/DQPLf+JcrmnMyxCXFsstt94M4=
Received: by mail-ed1-f41.google.com with SMTP id t21so17785300eds.6
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 10:08:23 -0700 (PDT)
X-Gm-Message-State: AOAM533rUwIFsqBVkXb7Dax1GfRA2qAYvzFo3t+1v7ddH8J+oIlOp2xh
 ppwzR0uZ2+rMgVOa3xQ7k1m515YqE6W5aqV+0KI=
X-Google-Smtp-Source: ABdhPJznFFkxxdcO9CFLA1y4py80sWN1jeeBhSeZnTVvSdAbSWX+EHDk5exEBJ+K31o8PGsm86EFdFdTJq7JbVnnqqk=
X-Received: by 2002:aa7:c643:: with SMTP id z3mr13042703edr.104.1602522502225; 
 Mon, 12 Oct 2020 10:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-2-yong.wu@mediatek.com>
 <20201002110709.GC6888@pi3> <1601958415.26323.25.camel@mhfsdcap03>
In-Reply-To: <1601958415.26323.25.camel@mhfsdcap03>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 12 Oct 2020 19:08:09 +0200
X-Gmail-Original-Message-ID: <CAJKOXPedQdOYque5igJ0_v_-_0L4S+NW6puUw-kWc+zWM96i_Q@mail.gmail.com>
Message-ID: <CAJKOXPedQdOYque5igJ0_v_-_0L4S+NW6puUw-kWc+zWM96i_Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/24] dt-bindings: iommu: mediatek: Convert IOMMU to
 DT schema
To: Yong Wu <yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Tue, 6 Oct 2020 at 06:27, Yong Wu <yong.wu@mediatek.com> wrote:
>
> On Fri, 2020-10-02 at 13:07 +0200, Krzysztof Kozlowski wrote:
> > On Wed, Sep 30, 2020 at 03:06:24PM +0800, Yong Wu wrote:
> > > Convert MediaTek IOMMU to DT schema.
> > >
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >  .../bindings/iommu/mediatek,iommu.txt         | 103 ------------
> > >  .../bindings/iommu/mediatek,iommu.yaml        | 154 ++++++++++++++++++
> > >  2 files changed, 154 insertions(+), 103 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > >  create mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > >
>
> [...]
>
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - enum:
> > > +          - mediatek,mt2701-m4u # mt2701 generation one HW
> > > +          - mediatek,mt2712-m4u # mt2712 generation two HW
> > > +          - mediatek,mt6779-m4u # mt6779 generation two HW
> > > +          - mediatek,mt8173-m4u # mt8173 generation two HW
> > > +          - mediatek,mt8183-m4u # mt8183 generation two HW
> > > +
> > > +      - description: mt7623 generation one HW
> > > +        items:
> > > +          - const: mediatek,mt7623-m4u
> > > +          - const: mediatek,mt2701-m4u
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description: |
> > > +      bclk is optional. here is the list which require this bclk:
> > > +      mt2701, mt2712, mt7623 and mt8173.
> >
> > Similarly to my comment in other patch, this should be part of schema
> > within 'if-then'.
>
> Thanks for the review.
>
> I will change like this:
>
> =============
>   clocks:
>     items:
>       - description: bclk is the block clock.
>
>   clock-names:
>     items:
>       - const: bclk
>
> required:
>   - compatible
>   - reg
>   - interrupts
>   - mediatek,larbs
>   - '#iommu-cells'
> if:
>   properties:
>     compatible:
>       contains:
>         enum:
>           - mediatek,mt2701-m4u
>           - mediatek,mt2712-m4u
>           - mediatek,mt8173-m4u
>
> then:
>  required:
>    - clocks
> ==============
>
> If this is not right, please tell me.
> (dt_binding_check is ok.)

Looks fine, except "if" should be part of some "allOf" block.

Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
