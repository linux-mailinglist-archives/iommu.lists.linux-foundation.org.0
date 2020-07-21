Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 177CB227555
	for <lists.iommu@lfdr.de>; Tue, 21 Jul 2020 04:03:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C4ACF867BD;
	Tue, 21 Jul 2020 02:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ll0rOaewkCAQ; Tue, 21 Jul 2020 02:03:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 52619864A6;
	Tue, 21 Jul 2020 02:03:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A8A6C016F;
	Tue, 21 Jul 2020 02:03:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A68F1C016F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 02:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9F868882D3
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 02:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9qBpKBZMv+m for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 02:03:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 306FC882BD
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 02:03:14 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id q3so15047904ilt.8
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 19:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NI0Hxq+b23u61HCgb6cNvKoXwQP7jMZ4BvjN9EOpDkY=;
 b=efaXFSO2lokuevscYY71O7o7RShqMeC54hKqNt221qU4Bjxgxa46Xx5q/zIRYuZFLP
 6Qw36s9GLkSVrqPFx0+8dPKHhBw/jSPjS38jL3x7uccOGc+uxiXLapdHY6M5EsSIPmEy
 Tlzni0Pnj1zVgFCwv8MurW0wep8FPLeGwlZ4XvWyq4j2o5T6LCLGFUG9zTJpsFtj/57I
 afqxFyfEokAx5xIeN1FVbPqU30PiSw8fRa71PTAk58whGpHBTHektGVUfSY/zdaeL/wT
 QavRjX3WL/56qokE8mWpQsKlsBUkOeMs2caJIhvxh17B4HMAI10HiooE6LnE9wpypelc
 8NqA==
X-Gm-Message-State: AOAM530MrmoUDeniKJhpfScmFxf0xOmm6whQ7CjswnWG3ZrFH4OaNGqh
 7ZEadylGmATqf1rKWnEVSA==
X-Google-Smtp-Source: ABdhPJzmsRID8T/oluWCq8KPBMnZBgnmkwCQskK/tjvFgX/rIZQhMljjjrf1/cVgMwDrcoB6A8xwkg==
X-Received: by 2002:a92:77d2:: with SMTP id
 s201mr26324309ilc.256.1595296993570; 
 Mon, 20 Jul 2020 19:03:13 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id h5sm9883666ilq.22.2020.07.20.19.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 19:03:12 -0700 (PDT)
Received: (nullmailer pid 3376169 invoked by uid 1000);
 Tue, 21 Jul 2020 02:03:09 -0000
Date: Mon, 20 Jul 2020 20:03:09 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 8/9] dt-bindings: net: renesas,ravb: Add support for
 r8a774e1 SoC
Message-ID: <20200721020309.GA3376098@bogus>
References: <1594676120-5862-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594676120-5862-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594676120-5862-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org
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

On Mon, 13 Jul 2020 22:35:19 +0100, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Document RZ/G2H (R8A774E1) SoC bindings.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
