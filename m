Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8649E034
	for <lists.iommu@lfdr.de>; Thu, 27 Jan 2022 12:05:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2528184F3C;
	Thu, 27 Jan 2022 11:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l53LlwOQVIWv; Thu, 27 Jan 2022 11:05:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 486CA84E92;
	Thu, 27 Jan 2022 11:05:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 193D6C0031;
	Thu, 27 Jan 2022 11:05:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF5D1C000B
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 11:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C909C610A3
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 11:05:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5VgIp4me827 for <iommu@lists.linux-foundation.org>;
 Thu, 27 Jan 2022 11:05:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E379261096
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 11:05:44 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id l196so1596581vki.5
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 03:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=loIa7nlMENziG0/c90oCJAPlR/jhhazB44r3+ZnUWXw=;
 b=07St7tUFS4JXocUSjoUnVpPeBMz8r6g4wgBtC2UmGATZGMA0HdzoZHWemT9BKdn0o/
 Apjo9elPe/fMKlpc9+st6V+aKIiekJ9Kgo2vyGLHUjH4v3O5/TojfSTMfSMGAS3Yi3jK
 8pLXsSxELWmadKcUC0QFTr6JZUjjoPa00Tc1NRxdDvU/jSkjsNjqqERUKDHIzKqKcEja
 kHvOTrqHgNA1fEco39S+KgDK7wqoRhvxL/knKR26lLxw+92cKRKKv/2AxN87u5HJFxtO
 KVssOK+3IurtTL4+9rQJeYrhBl1SZpQfEE8aazusPOqU/Gkfqq5kFJOPHxCrkU0aZkIa
 FRZA==
X-Gm-Message-State: AOAM5329NN/Kb+uDzmVUiaGK9q/khRsBYl5KKGZdSx9RyAWTAXss10hv
 MkjtBZmhcofGA7G/LwlNrxg9VkJh7dLPFw==
X-Google-Smtp-Source: ABdhPJytoNtwZE3paRDLaYpOG0eCOvfCiGRXq+56zmEhf2RpwwkWQ7eODGxkUby7oooU9H6gSY/f3Q==
X-Received: by 2002:a05:6122:20a0:: with SMTP id
 i32mr1260276vkd.36.1643281543648; 
 Thu, 27 Jan 2022 03:05:43 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175])
 by smtp.gmail.com with ESMTPSA id z65sm467397vsz.33.2022.01.27.03.05.43
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 03:05:43 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id w206so1578056vkd.10
 for <iommu@lists.linux-foundation.org>; Thu, 27 Jan 2022 03:05:43 -0800 (PST)
X-Received: by 2002:a05:6122:1254:: with SMTP id
 b20mr1332640vkp.0.1643281542969; 
 Thu, 27 Jan 2022 03:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com>
 <20220125125602.4144793-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220125125602.4144793-2-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jan 2022 12:05:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgg8XApJETkN1oDDSy=N01kJaTz4DADyD9ZOM0ZXXttA@mail.gmail.com>
Message-ID: <CAMuHMdXgg8XApJETkN1oDDSy=N01kJaTz4DADyD9ZOM0ZXXttA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas,
 ipmmu-vmsa: add r8a779f0 support
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>
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

Hi Shimoda-san,

CC Laurent, Magnus.

On Tue, Jan 25, 2022 at 6:33 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document the compatible values for the IPMMU-VMSA blocks in
> the Renesas R-Car S4-8 (R8A779F0) SoC and R-Car Gen4.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> @@ -44,6 +44,10 @@ properties:
>                - renesas,ipmmu-r8a77990 # R-Car E3
>                - renesas,ipmmu-r8a77995 # R-Car D3
>                - renesas,ipmmu-r8a779a0 # R-Car V3U
> +      - items:
> +          - enum:
> +              - renesas,ipmmu-r8a779f0 # R-Car S4-8
> +          - const: renesas,rcar-gen4-ipmmu-vmsa  # R-Car Gen4
>

I'm wondering if we need the family-specific fallback.
For R-Car Gen3, we don't have it, and match on (all) the SoC-specific
compatible values instead.
Do you remember why we decided to do it that way?

At least R-Car V3M/V3H/D3 have slight differences in the register bits,
but I don't think that was the reason.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
