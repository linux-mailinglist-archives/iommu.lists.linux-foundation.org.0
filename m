Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC642A86A8
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 20:03:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D992864F4;
	Thu,  5 Nov 2020 19:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMq85yNSj6yi; Thu,  5 Nov 2020 19:02:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 66DDF865D3;
	Thu,  5 Nov 2020 19:02:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E84FC0889;
	Thu,  5 Nov 2020 19:02:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42D02C0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 19:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2D344871D9
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 19:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lGw1V3WPZ4l5 for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 19:02:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5FAC6871D8
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 19:02:55 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id ay21so2680945edb.2
 for <iommu@lists.linux-foundation.org>; Thu, 05 Nov 2020 11:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WRATYPVVpUj0dIlvu1sSRL+DjOGoPhuNmDfmJZyE3X4=;
 b=elkjSa0cgDOQ0rfcY1Pz1lorJPpIAnpNeGH19+FsiK+lx3SmVLV7OKcTkaS+SyU2Md
 BaFzRPXiIIj1I8uYC9Em+ZPgZTIQGdI2A4mWQDaOjdXtoHkb2IpBxyDuyq1VhvUJE+mR
 zBSgslwe5XI2w9yo29hvs69H886PBs5ue/CPEW/zKbTQVM7JPl/Umdf41WYn3NKtuz0X
 rwR3EQ6k6eKsSjd6271NnWtwQwHmS7kN2af59Ld/jHZv/AO/y8aG0sZ6upebukln9QQW
 9miwYTUH/IOaFs9GGZYag/5i6shPLaRoYM6bS/tr8LboXCj4DmP97sxu+me0sH4GZCPV
 bKyw==
X-Gm-Message-State: AOAM532ssEcM9P212HN5RUygdUMuI+gI+8VO8L3TPY1ipo+mfIau/ee5
 iR+vX17Trs96VyQLN+zUBA0=
X-Google-Smtp-Source: ABdhPJy4eek/pneQf2INHGzsXHnasKODWlCZYK99ygc4HT8ykdbZgCZY3RkkdXqf9JumHekNW1uKCA==
X-Received: by 2002:a05:6402:4c6:: with SMTP id
 n6mr4246361edw.204.1604602973903; 
 Thu, 05 Nov 2020 11:02:53 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id e19sm1472305ejz.35.2020.11.05.11.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:02:52 -0800 (PST)
Date: Thu, 5 Nov 2020 20:02:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: memory: mediatek: Add mt8192 support
Message-ID: <20201105190251.GB217610@kozik-lap>
References: <20201103054200.21386-1-yong.wu@mediatek.com>
 <20201103054200.21386-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103054200.21386-3-yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
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

On Tue, Nov 03, 2020 at 01:41:59PM +0800, Yong Wu wrote:
> Add mt8192 smi support in the bindings.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml      | 4 +++-
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml        | 2 ++

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
