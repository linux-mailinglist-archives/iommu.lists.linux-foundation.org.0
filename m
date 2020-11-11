Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF412AFA5B
	for <lists.iommu@lfdr.de>; Wed, 11 Nov 2020 22:30:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6CCFD86D23;
	Wed, 11 Nov 2020 21:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEwrlJ0fOGOZ; Wed, 11 Nov 2020 21:30:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC275858F7;
	Wed, 11 Nov 2020 21:30:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4E5BC016F;
	Wed, 11 Nov 2020 21:30:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B680C016F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 21:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 14E782E174
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 21:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwzCZ9fo6WlS for <iommu@lists.linux-foundation.org>;
 Wed, 11 Nov 2020 21:30:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 63D272E119
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 21:30:46 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id w13so4707244eju.13
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 13:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z+ETELXno+NvRIRsDlBueAlts5jLlnpIbWvTkKx52dc=;
 b=nhCQ8MEK19OPLakqUgpw5RkVuREqV4KYEsJhxaWpCdFDd+Wcj8zAcPasSOTE9Qdc4A
 EhoSYJr+/YXgIehpiZXUreQdxc80Nr4wLg538SvRA89FWbg9gQnpGamfEGczZEA+t/f8
 K+mJ3CL4OK9kfbzXTBhPe8kovL7sColtDgaBcVA1WZoAxT+Jug3vCpPshLfZtns1dUwj
 FJgZeKxCStRyXg2Gd3SWFbcPxcHOO7WzW0GSKznS9tn+rhE4JrzylKmtIgq8t5pfMpH0
 2zxg27DwqQ+yDXe/ejZ5G8Rv0Qh+fN84wprvxeK4mb0mSy05cEppPncpE0kKQ/WA4S0C
 7Otg==
X-Gm-Message-State: AOAM5324W62BQu/5ysPELX821pcJ8tlwv9xjl23Cj3Hk4qT+ZTDo8nMd
 5OXrL8Y4BWLfW1mX4LD/5T8=
X-Google-Smtp-Source: ABdhPJyhZPk3FplV/r7GELuT8+cAZX7sxSAYu7E4SNmzzETHkXyXKEmJuKnrqs52+PR3B57lSpkvkA==
X-Received: by 2002:a17:906:f186:: with SMTP id
 gs6mr28257486ejb.171.1605130244772; 
 Wed, 11 Nov 2020 13:30:44 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id c11sm1421524eds.62.2020.11.11.13.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 13:30:43 -0800 (PST)
Date: Wed, 11 Nov 2020 22:30:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 04/24] dt-bindings: memory: mediatek: Add domain
 definition
Message-ID: <20201111213041.GC287176@kozik-lap>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111123838.15682-5-yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel-team@android.com, anan.sun@mediatek.com,
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

On Wed, Nov 11, 2020 at 08:38:18PM +0800, Yong Wu wrote:
> In the latest SoC, there are several HW IP require a sepecial iova
> range, mainly CCU and VPU has this requirement. Take CCU as a example,
> CCU require its iova locate in the range(0x4000_0000 ~ 0x43ff_ffff).
> 
> In this patch we add a domain definition for the special port. In the
> example of CCU, If we preassign CCU port in domain1, then iommu driver
> will prepare a independent iommu domain of the special iova range for it,
> then the iova got from dma_alloc_attrs(ccu-dev) will locate in its special
> range.
> 
> This is a preparing patch for multi-domain support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  include/dt-bindings/memory/mtk-smi-larb-port.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
