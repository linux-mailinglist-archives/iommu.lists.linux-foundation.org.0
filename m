Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C566250B9B
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 00:23:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 541ED8453D;
	Mon, 24 Aug 2020 22:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xB2aDElwm2hM; Mon, 24 Aug 2020 22:23:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D7B3B84528;
	Mon, 24 Aug 2020 22:23:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2B30C089E;
	Mon, 24 Aug 2020 22:23:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6642C0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 22:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 09A0D87BFE
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 22:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-LjdmsAFtra for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 22:23:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0183087B94
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 22:23:36 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id f75so8440826ilh.3
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 15:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sxWoSiXfyNxC7RpNkWsYKNGkllX1hPdgCddbI6UFMS8=;
 b=p0bK0y9qr4F4FdeZ8Z0QJ0no/vmqu/2o+aJEl9CM/j1UHT6jX5uIxlFeSylYwpXXDW
 YXBxwsuH8hT2iquC8k0IGTWoMgKli2do6xo0c5uPyxOBuOqLTN2PmXJpYUsolX0drXHR
 I1e78m790MncI0nvFOqBqOtg2TPJ+qKKF2/UTpM/T4on7sDRCPA4jo1GlLvmYSeUFM8L
 xdtIymHzhgT0aa0LBndxLy/kSJZh8eJqcEFFHqnU2cNaMwQuzB966bb9rolxsZb+qG4i
 E6jZNYHGhSPb2lP3mguLj23o6gE4ovcjQOr0JIwBaMKckrQtnvOdO2pU4rlVJgoXIETz
 AD6Q==
X-Gm-Message-State: AOAM533bPCi1vNjnGKgHABIQWB6jPqU3WH1IjDGbSSO8Tnfg03efqOEa
 UNGKGLdipE8iE4/upmzlTQ==
X-Google-Smtp-Source: ABdhPJznOKZdKvAaryVXsQIpvkIsmCU7LK5fBX41NJ1Qm07XPJOu1Tb2fW0OF5VP6XC4w7/K9fuXIw==
X-Received: by 2002:a92:89c8:: with SMTP id w69mr6996316ilk.139.1598307816294; 
 Mon, 24 Aug 2020 15:23:36 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id f186sm3428221ioa.42.2020.08.24.15.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 15:23:35 -0700 (PDT)
Received: (nullmailer pid 3425801 invoked by uid 1000);
 Mon, 24 Aug 2020 22:23:30 -0000
Date: Mon, 24 Aug 2020 16:23:30 -0600
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Sort compatible
 string in increasing number of the SoC
Message-ID: <20200824222330.GA3425741@bogus>
References: <20200809193527.19659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200809193527.19659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
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

On Sun, 09 Aug 2020 20:35:27 +0100, Lad Prabhakar wrote:
> Sort the items in the compatible string list in increasing number of SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
